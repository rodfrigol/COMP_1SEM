
#include <mysortfunctions.h>

int max_value(int a, int b){
    if(a>=b)
        return a;
    return b;
}

int min_value(int a, int b){
    if (a<=b)
        return a;
    return b;
}

int Partition_median(int left, int right, std::vector<int> &v){
    int middle = (left+right)/2;
    int pivot_position;
    int vleft = v[left];
    int vmiddle = v[middle];
    int vright = v[right];
    
    if(vleft>vright != vleft>vmiddle)
        pivot_position = left;
    else if (vmiddle > vleft != vmiddle > vright)
        pivot_position = middle;
    else
        pivot_position = right;

    troca(v, pivot_position, left);
    

    int pivot = v[left];
    int l = left + 1, r = right;
    while(1){
        while(l<right && v[l]<pivot) l++;
        while(r>left && v[r]>=pivot) r--;
        if (l>=r)
            break;
        troca(v, l, r);
    }
    troca(v, left, r);
    return r;
}

int Partition_fixed_pivot(int left, int right, std::vector<int> &v){
    int pivot = v[left];
    int l = left + 1, r = right;
    while(1){
        while(l<right && v[l]<pivot) l++;
        while(r>left && v[r]>=pivot) r--;
        if (l>=r)
            break;
        troca(v, l, r);
    }
    troca(v, left, r);
    return r;
}

int QuickSort_fixedPivot(int min, int max, std::vector<int> &v, SortStats &stats){
    stats.recursive_calls ++;
    if (min<max){
        int p = Partition_fixed_pivot(min, max, v);
        int depth = max_value(QuickSort_fixedPivot(min, p-1, v, stats), QuickSort_fixedPivot(p+1, max, v, stats));
        return depth + 1;
    }else{
        return 0;
    }
}

int QuickSort_1recursion(int min, int max, std::vector<int> &v, SortStats &stats){
    int tail = 0;
    int iterations = 0;
    stats.recursive_calls ++;
    while (min < max){
        int p = Partition_median(min, max, v);
        if (p - min < max - p){
            tail = QuickSort_1recursion(min, p - 1, v, stats);
            min = p + 1;
        }else{
            tail = QuickSort_1recursion(p+1, max, v, stats);
            max = p - 1;
        }
        iterations++;
        iterations = max_value(iterations, tail);
    }
    return iterations;
}

int QuickSort_2recursion(int min, int max, std::vector<int> &v, SortStats &stats){
    stats.recursive_calls ++;
    if (min<max){
        int p = Partition_median(min, max, v);
        int depth = max_value(QuickSort_2recursion(min, p-1, v, stats), QuickSort_2recursion(p+1, max, v, stats));
        return depth + 1;
    }else{
        return 0;
    }
}

void myquicksort_2recursion_medianOf3(std::vector<int> &v, SortStats &stats) {
    stats.recursive_calls = 0;
    int n = v.size();
    stats.depth_recursion_stack = QuickSort_2recursion(0, n - 1, v, stats);
}// function myquicksort_2recursion_medianOf3

void myquicksort_1recursion_medianOf3(std::vector<int> &v, SortStats &stats) {
    stats.recursive_calls = 0;
    int n = v.size();
    stats.depth_recursion_stack = QuickSort_1recursion(0, n - 1, v, stats);
} // function myquicksort_1recursion_medianOf3

void myquicksort_fixedPivot(std::vector<int> &v, SortStats &stats) {
    stats.recursive_calls = 0;
    int n = v.size();
    stats.depth_recursion_stack = QuickSort_fixedPivot(0, n-1, v, stats);
} // myquicksort_fixedPivot


