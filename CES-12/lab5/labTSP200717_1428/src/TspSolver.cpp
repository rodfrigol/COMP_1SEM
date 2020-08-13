#include <TspSolver.h>


void TspSolver::solve(TspReader &tr,std::vector<int> &percourse) {

    std::vector<City> cities;
    tr.copyCitiesVector(cities);

    City r = cities[0];
    int n = cities.size();

    //MONTANDO HEAP
    Triple *distancias = new Triple [n-1];
    for (int i=1; i<n; i++)
        distancias[i-1] = Triple(cities[i].getId(), cities[i].disti(r), 1);

    Heap h(distancias, n-1);
    
    //EXECUTANDO PRIM
    Graph MST(n);
    int usize = 1;
    
    int i;
    Triple *ref;
    std::vector<Triple> reinsercao;

    while(usize != n){
        Triple mais_proximo = h.top();
        h.pop();

        if (!h.is_empty()){
            
            while (h.top().dist==mais_proximo.dist){
                if(h.top().other<mais_proximo.other || (h.top().other==mais_proximo.other && h.top().id<mais_proximo.id)){
                    reinsercao.push_back(mais_proximo);
                    mais_proximo = h.top();
                }else{
                    reinsercao.push_back(h.top());
                }
                h.pop();
            }
        }

        for (i=0; i<reinsercao.size(); i++)
            h.insert(reinsercao[i]);
        reinsercao.resize(0);

        MST.add_aresta(mais_proximo.id, mais_proximo.other, mais_proximo.dist);

        for (ref = h.referencia(), i = 0; i<h.size(); i++){
            int newdist = cities[mais_proximo.id-1].disti(cities[ref[i].id-1]);
            if(newdist<ref[i].dist || (newdist == ref[i].dist && mais_proximo.id<ref[i].other))
                h.modify(i, Triple(ref[i].id, newdist, mais_proximo.id));
        }

        usize++;
    }

    //PRE ORDEM PARA PREENCHER PERCOURSE
    percourse.resize(n);
    int psize = 0;
    MST.preorder(1, percourse, psize);


}//solve