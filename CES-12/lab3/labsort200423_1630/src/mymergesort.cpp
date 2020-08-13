
#include <mysortfunctions.h>

void merge(int i, int m, int f, std::vector<int> &v){
    std::vector<int> aux;
    aux.resize(f-i+1);

    int h1=i, h2=m+1, auxi=0;
    while (h1<=m && h2<=f)
        if(v[h1]<v[h2])
            aux[auxi++] = v[h1++];
        else
            aux[auxi++] = v[h2++];
    while(h1<=m)
        aux[auxi++] = v[h1++];
    while(h2<=f)
        aux[auxi++] = v[h2++];
    for(int j=0; i<=f; i++)
        v[i] = aux[j++];
}

void MergeSort(int i, int f, std::vector<int> &v, SortStats &stats){
    stats.recursive_calls ++;
    if (i<f){
        int m = (i+f)/2;
        MergeSort(i, m, v, stats);
        MergeSort(m+1, f, v, stats);
        merge(i, m, f, v);
    }else{
        if (stats.depth_recursion_stack == 0){
            stats.depth_recursion_stack = stats.recursive_calls;
        }
    }
}

void mymergesort_recursive(std::vector<int> &v, SortStats &stats) {
    // you need to set the counting of recursive recursive_calls
    stats.recursive_calls = 0;
    // you need to set the depth = the maximum height of the tree of recursion calls. 
    stats.depth_recursion_stack = 0;
    // the tester already knows the size of v and the algorithm name, it already measures time
    // you may set custom1 field if you want to measure anything else.
    //stats.custom1 = 2;
    int n = v.size();
    MergeSort(0, n-1, v, stats);
}

void mymergesort_iterative(std::vector<int> &v, SortStats &stats) {
    // you need to set the counting of recursive recursive_calls
    stats.recursive_calls = 0;
    // you need to set the depth = the maximum height of the tree of recursion calls. 
    stats.depth_recursion_stack = 0;
    // the tester already knows the size of v and the algorithm name, it already measures time
    // you may set custom1 field if you want to measure anything else.
    //stats.custom1 = 2;

    int b = 1, f = v.size() - 1, p, r, m, fin;

    while(b<f+1){
        for(p = 0; p+b<=f ;p+=2*b){
            fin = p-1+2*b;
            if(fin>f)
                r = f;
            else
                r = fin;
            m = p+b-1;
            merge(p, m, r, v);
            stats.recursive_calls ++;
        }
        b *= 2;
        stats.depth_recursion_stack ++;
    }

}
    
