#include <TrocoSolver.h>

int sum(std::vector<unsigned int> *v){
    int sum = 0;
    for (int i=0; i<(*v).size(); i++)
        sum += (*v)[i];
    return sum;
}

std::vector<unsigned int> *min_vector(std::vector<unsigned int> *a, std::vector<unsigned int> *b){
    if (sum(a)<sum(b))
        return a;
    return b;
}

std::vector<unsigned int> *solve_recursive(const std::vector<unsigned int> &denom,unsigned int value, long &recursivecalls){
    recursivecalls ++;

    std::vector<unsigned int> *q = new std::vector<unsigned int>(denom.size(),0);

    if (value == 0)
        return q;
    
    (*q)[0] = value;

    for (int i=0; i<denom.size(); i++){
        if (denom[i]<=value){
            std::vector<unsigned int> *recursive;
            recursive = solve_recursive(denom, value - denom[i], recursivecalls);
            (*recursive)[i] ++;
            q = min_vector(q, recursive);
        }
    }

    return q;
}

void TrocoSolverDivConquer::solve(const std::vector<unsigned int> &denom,unsigned int value, std::vector<unsigned int> &coins) {

    // fills a dummy answer with 1 coin of each denomination    
    // coins.resize(denom.size(),1); 

    recursivecalls = 0;
    coins = *solve_recursive(denom, value, recursivecalls);
    
}//solve
