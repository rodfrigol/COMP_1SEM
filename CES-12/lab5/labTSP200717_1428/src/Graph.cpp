#include <Graph.h>

Graph::Graph(int _n){
    n = _n;
    g = new Node*[n];
    for (int i=0; i<n; i++)
        g[i] = NULL;
}

void insert(int i, int j, int dist, Node **g){
    Node *p = g[i-1];

    if (p==NULL){
        g[i-1] = new Node(NULL, dist, j);
        return;
    }

    if (dist<p->dist || (dist==p->dist && j<p->key)){
        g[i-1] = new Node(g[i-1], dist, j);
        return;
    }
    
    while(p->prox != NULL){
        if (p->prox->dist>dist || (p->prox->dist == dist && p->prox->key>j)){
            p->prox = new Node(p->prox, dist, j);
            return;
        }
        p = p->prox;
    }

    p->prox = new Node(NULL, dist, j);

}

void Graph::add_aresta(int i, int j, int dist){
    insert(i, j, dist, g);
    insert(j, i, dist, g);
    
}

int in(int key, std::vector<int> &percourse, int psize){
    for (int i=0; i<psize; i++)
        if (percourse[i] == key)
            return true;
    return false;
}

void Graph::preorder(int i, std::vector<int> &percourse, int &psize){
    percourse[psize++] = i;
    for (Node *p = g[i-1]; p!= NULL; p = p->prox)
        if (! in(p->key, percourse, psize))
            preorder(p->key, percourse, psize);
}

void Graph::print(){
    for (int i=0; i<n; i++){
        std::cout<<i+1<<": ";
        for  (Node* p= g[i]; p!= NULL; p = p->prox){
            std::cout<<"("<<p->key<<", "<<p->dist<<")"<<" ";
        }
        std::cout<<"\n";
    }
    std::cout<<"\n\n";
}