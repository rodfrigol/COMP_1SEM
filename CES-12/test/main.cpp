#include <iostream>
#include <vector>


int main(){
    int vleft = -3;
    int vright = 9;
    int vmiddle = 6;
    if(vleft>vright != vleft>vmiddle)
        std::cout<<vleft;
    else if (vmiddle > vleft != vmiddle > vright)
        std::cout<<vmiddle;
    else
        std::cout<<vright;
    return 0;
}