#include <iostream>
#include <cmath>           //for pow
#include <itpp/itbase.h>   //for vectors and matrixes
#include <chrono>          //for showing run-time
#include "funcs.hpp"       //sel-defined functions
#include <itpp/itcomm.h>    //for itpp::BERC::count_errors

int main(int argc, char **argv){
    itpp::Parser parser;
    parser.init(argc,argv);
    int r = 3; //code length n = 2 ^ r - 1
    int s = 1; //measured syndrome
    parser.get(r,"r");
    parser.get(s,"s");

    //start recording calculation time
    std::chrono::high_resolution_clock::time_point start = std::chrono::high_resolution_clock::now();

    //Hamming code parameters
    float nn = pow(2,r) - 1;
    int n = int(nn);
    int k = n - r;
    int d = 3;

    std::cout << "Hamming code [" << n << "," << k << "," << d << "]\n";

    //generate the perity check matrix h
    itpp::GF2mat h(r,n);
    h = write_h(r,n);
    //std::cout << "The parity check matrix is " << h << "\n";

    //find the generator matrix g
    itpp::GF2mat g(k,n);
    g = nullSpace(h);
    //std::cout << "The generator matrxi is" << g << "\n";

    //write the sydrome in binary form
    itpp::GF2mat syn(1,r);
    syn.set_row(0,binary_num(r, s)); 
    std::cout << "syndrome is " << s << " = " << syn << "\n"; 

    //find one error according to the syndrome
    itpp::GF2mat er(1,n), htemp(r,n+1), ermat(k+1,n+1);
    itpp::bvec syntra(r);
    for (int l = 0; l < n; l++){
        htemp.set_col(l, h.get_col(l));
    }
    syntra = syn.get_row(0);
    htemp.set_col(n, syntra);
    ermat = nullSpace(htemp);
    if (ermat(k,n) == 1){
        for (int x = 0; x < n; x++){
            er.set(0, x, ermat.get(k, x));
        }
        std::cout << "one coresponding error is " << er << "\n";     
    }
    else{
        std::cout << "last line is not approate error" << "\n";
        std::cout << ermat << "\n";
    }
    

    //find all coresponding errors
    int num_alpha = pow(2,k)-1;
    int wt, min_wt, count;
    itpp::GF2mat all_er(num_alpha,k);
    itpp::bvec ertemp(n), zero(n);

    for (int m = 1; m <= num_alpha; m++){

        all_er.set_row(m-1, binary_num(k,m));
    }

    all_er = itpp::operator*(all_er,g);

    min_wt = num_alpha;
    count = 0;
    zero.zeros();
    for (int p = 1; p <= num_alpha; p++){
        ertemp.zeros();
        ertemp = all_er.get_row(p-1) + er.get_row(0);
        all_er.set_row(p-1,ertemp); 
        wt = itpp::BERC::count_errors(ertemp, zero);
        //std::cout << all_er.get_row(i-1) << "\n";
        //std::cout << wt << "," << min_wt << "\n";
        if (wt < min_wt){
            min_wt = wt;
            count = p;
        }
    }

    //std::cout << "all errors are " << all_er << "\n";
    std::cout << "minium weight error is " << all_er.get_row(count) << "with weight " << min_wt <<".\n";
    return 0;
    
}

