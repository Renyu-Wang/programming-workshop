#include <iostream>
#include <itpp/itbase.h>

// write a number into binary form
itpp::bvec binary_num(int r1, int x1){

    itpp::bvec co(r1);
    int j = r1 - 1;

    co.zeros();

    while (x1 > 0) { 
            co(j) = x1 % 2; 
            x1 = x1 / 2; 
            j--; 
    }
    
    return co;

} 
//write the parity check matrix of hamming code
itpp::GF2mat write_h(int r2, int n2){

    itpp::GF2mat h2(r2,n2);

    for (int i = 0; i < n2; i++){
        
        h2.set_col(i,binary_num(r2, i + 1));
    }
    
    return h2;
}

//return H such that GH^T = 0, and rank G + rank H = n = full rank
//by weilei
itpp::GF2mat nullSpace(itpp::GF2mat G){
    itpp::GF2mat T,U; itpp::ivec P;
    int t=G.cols();
    int rank_of_G = G.transpose().T_fact(T,U,P);
    //  itpp::GF2matPrint(T,"T");
    itpp::GF2mat Q=T.get_submatrix(rank_of_G,0,t-1,t-1);
    return Q;
}
