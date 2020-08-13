#include <TrocoSolver.h>

void TrocoSolverPD::solve(const std::vector<unsigned int> &denom,unsigned int value, std::vector<unsigned int> &coins) {

    // fills a dummy answer with 0 coins of each denomination    
    coins.resize(denom.size(),0);

    std::vector<unsigned int> quant(value + 1, 0), ultima(value + 1, 0);

    unsigned int quantProv, ultProv;
    int j;
    for (unsigned int cents = 1; cents<= value; cents++){
        quantProv = cents;
        ultProv = 0;
        for (j = 0; j < denom.size(); j++){
            if (denom[j]<=cents)
                if (quant[cents - denom[j]] + 1 < quantProv){
                    quantProv = quant[cents - denom[j]] + 1;
                    ultProv = j;
                }
        }
        quant[cents] = quantProv;
        ultima[cents] = ultProv;
    }

    while(value != 0){
        coins[ultima[value]] ++;
        value -= denom[ultima[value]];
    }
    
}//solve
