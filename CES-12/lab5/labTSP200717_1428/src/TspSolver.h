#ifndef TSP_SOLVER
#define TSP_SOLVER


#include <TspReader.h>
#include <vector>
#include <Heap.h>
#include <Graph.h>
#include <Triple.h>

class TspSolver {
public:
    // you should fill percourse with a permutation that represents the TSP solution
    void solve(TspReader &tr,std::vector<int> &percourse); 
}; 



#endif