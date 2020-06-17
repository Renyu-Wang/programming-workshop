#include <iostream>
#include <itpp/itcomm.h>

int main() {

  itpp::bvec bb(3);
  bb.zeros();
  bb.set(1,1);
  std::cout<<"itpp bvec = "<<bb<<std::endl;
  std::cout<<"itpp test passed \n";
  return 0;

}
