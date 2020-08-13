#include <Heap.h>

Heap::Heap(Triple* d, int _n){
    h = d;
    n = _n;
    for (int i=n/2-1; i>=0; i--)
        sift(i);

}

void Heap::print(){
    for (int i=0; i<n; i++)
        std::cout<<h[i].dist<<", ";
    std::cout<<"\n\n";
}

void Heap::sift(int i){
    int esq = 2*i +1;
    int dir = 2*(i+1);
    int menor = i;

    if (esq<n && h[esq].dist<h[menor].dist)
        menor= esq;
    if (dir<n && h[dir].dist<h[menor].dist)
        menor = dir;
    if (menor!=i){
        Triple aux = h[i];
        h[i] = h[menor];
        h[menor] = aux;
        sift(menor);
    }
}

Triple Heap::top(){
    return h[0];
}

void Heap::pop(){
    h[0] = h[n-1];
    n--;
    sift(0);
}

void Heap::modify(int i, Triple p){
    h[i] = p;

    while (i>0 && h[(i-1)/2].dist>h[i].dist){
        Triple aux = h[(i-1)/2];
        h[(i-1)/2] = h[i];
        h[i] = aux;
        i = (i-1)/2;
    }

    sift(i);
}

int Heap::is_empty(){
    return n==0;
}