#ifndef GRAPH
#define GRAPH
#include <iostream>
#include <vector>


class Node{
    public:
        Node(Node *_prox, int _dist, int _key): prox(_prox), dist(_dist), key(_key){}
        Node *prox;
        int dist;
        int key;
};

//VETOR DE LISTAS LIGADAS
class Graph {
    public:
        Graph(int _n);
        void add_aresta(int i, int j, int dist);
        void print();
        void preorder(int i, std::vector<int> &percourse, int &psize);
    private:
        Node **g;
        int n;
}; 



#endif
