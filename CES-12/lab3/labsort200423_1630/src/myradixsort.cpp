
#include <mysortfunctions.h>


void myradixsort(std::vector<int> &v, SortStats &stats) {
    // you need to set the counting of recursive recursive_calls
    
    // you need to set the depth = the maximum height of the tree of recursion calls. 
    
    // the tester already knows the size of v and the algorithm name, it already measures time
    // you may set custom1 field if you want to measure anything else.
    //stats.custom1 = 2;
    int n = v.size();
    int filas = 16;
    int nbits = 0;
    int len = n;
    
    for (nbits = 0;len; nbits++,len>>=1) {}
    int n_hex = nbits/4 + int(nbits%4>0); //numero de bits hexadecimal

    int **p = (int **)malloc(filas*sizeof(int*));
    int *psize = (int *)malloc(filas*sizeof(int));
    for (int i=0; i<filas; i++){
        p[i] = (int *)malloc(n*sizeof(int));
        psize[i] = 0;
    }
    
    int digit, i, cmp, nshifts, j, k, m;
    for (i = 0, cmp = 0xF, nshifts = 0; i<n_hex; i++, nshifts++, cmp*=0x10){
        for (j = 0; j<n; j++){
            digit = (v[j] & cmp) >> 4*nshifts;
            p[digit][psize[digit]++] = v[j];
        }
        for (k=0, j=0; k<filas; k++){
            for (m=0; m<psize[k]; m++)
                v[j++] = p[k][m];
            psize[k] = 0;
        }
    }

    stats.recursive_calls = n_hex * n;
    stats.depth_recursion_stack = n;
}
