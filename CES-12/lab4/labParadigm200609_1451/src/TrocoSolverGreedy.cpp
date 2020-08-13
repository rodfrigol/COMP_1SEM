#include <TrocoSolver.h>

void TrocoSolverGreedy::solve(const std::vector<unsigned int> &denom,unsigned int value, std::vector<unsigned int> &coins) {

    // fills a dummy answer with 0 coins of each denomination    
    coins.resize(denom.size(),0); 
    
    for (int i = denom.size()-1; i>=0; i--){
        while(value >= denom[i]){
            value -= denom[i];
            coins[i] ++;
        }
    }
    
    
}//solve

// dica: iterar um vetor de tras pra frente
//https://stackoverflow.com/questions/3610933/iterating-c-vector-from-the-end-to-the-begin
//http://www.cplusplus.com/reference/vector/vector/rbegin/
