#ifndef HEAP
#define HEAP
#include <vector>
#include <iostream>
#include <Triple.h>


class Heap {
    public:
        Heap(Triple* d, int _n);
        Triple top();
        void pop();
        void print();
        void modify(int i, Triple p);
        void insert(Triple p){modify(n++, p);};
        int is_empty();
        
        Triple *referencia(){return h;};
        int size(){return n;};

    private:    
        Triple *h;
        int n;
        void sift(int i);
}; 



#endif
