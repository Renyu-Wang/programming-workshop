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
    itpp::GF2mat er(1,n);
    er = itpp::operator*(syn,h);
    //std::cout << "one coresponding error is " << er << "\n";

    //find all coresponding errors
    int num_alpha = pow(2,k);
    int wt, min_wt, count;
    itpp::GF2mat all_er(num_alpha,k);
    itpp::bvec ertemp, zero;

    for (int i = 0; i < num_alpha; i++){

        all_er.set_row(i, binary_num(k,i+1));
    }

    all_er = itpp::operator*(all_er,g);

    min_wt = num_alpha;
    count = 0;
    zero.zeros();
    for (int i = 0; i < num_alpha; i++){
        ertemp.zeros();
        ertemp = all_er.get_row(i) + er.get_row(0);
        all_er.set_row(i,ertemp); 
        wt = itpp::BERC::count_errors(ertemp, zero);
        std::cout << ertemp << "\n";
        std::cout << wt << "\n";
        if (wt < min_wt){
            min_wt = wt;
            count = i;
        }
    }

    //std::cout << "all errors are " << all_er << "\n";
    std::cout << "minium weight error is " << all_er.get_row(count) << "with weight" << min_wt <<".\n";
    return 0;
    
}

