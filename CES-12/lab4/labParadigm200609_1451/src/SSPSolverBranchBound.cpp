#include <SubsetSumSolver.h>

 void fillSubVector(int start, int end, const std::vector< long> &input, long value, bool *v, long **vpath, long *vpathlen){

    int n = end - start, j;
    // existem 2^n combinações de somas
    long combinations = 1 << n;
    long sum;

    long *newVals = (long *)malloc((value+1)*sizeof(long));
    long lenNewVals = 0;

    for (int i = 0; i<combinations; i++){
        sum = 0;
        for (j = 0; j < n; j++){
            if (i & 1<<j){
                sum += input[j + start];
                newVals[lenNewVals++] = j + start;
            }
        }
        if (sum <= value && !v[sum]){
            v[sum] = true;
            vpath[sum] = (long *)malloc(lenNewVals*sizeof(long));
            for (int k=0; k<lenNewVals; k++)
                vpath[sum][k] = newVals[k];
            vpathlen[sum] = lenNewVals;
        }
        lenNewVals = 0;
    }  

}

 bool SSPSolverBranchBound::solve(const std::vector< long> &input,
                            long value, std::vector< char> &output) {
    
    
    // MEET IN MIDDLE

    int n = input.size();
    int half = n/2;
    output.resize(n);

    // VETORES X E Y CONTÊM AS POSSÍVEIS SOMAS NOS SUBARRAYS DO INPUT
    bool *X = (bool *)malloc((value+1) * sizeof(bool));
    bool *Y = (bool *)malloc((value+1) * sizeof(bool));
    X[0] = Y[0] = true;
    for (long i = 1; i<=value; i++)
        X[i] = Y[i] = false;

    // VETORES XPATH TERAO OS CAMINHOS PARA ATINGIR CADA SOMA NO SUBVETOR X, COM TAMANHOS ARMAZENADOS EM XPATHLEN
    long **Xpath = (long **)malloc((value+1)*sizeof(long*));
    long **Ypath = (long **)malloc((value+1)*sizeof(long*));
    long *Xpathlen = (long *)malloc((value + 1)*sizeof(long));
    long *Ypathlen = (long *)malloc((value + 1)*sizeof(long));
    for (int i=0; i<=value; i++)
        Xpathlen[i] = Ypathlen[i]= 0;

    //para cada metade, são obtidas todas as possíveis somas e caminhos dessas somas
    fillSubVector(0, half, input, value, X, Xpath, Xpathlen);
    fillSubVector(half, n, input, value, Y, Ypath, Ypathlen);

    //Por fim, para cada soma possível em uma metade, é verificado se o complemento em relação a value está 
    //presente na outra metade. Se estiver, output é preenchido de acordo com a concatenação dos vetores de 
    //caminho das duas metades.
    for (long i = 0; i<=value; i++){
        if (X[i] && Y[value - i]){
            long j;
            for (j = 0; j<Xpathlen[i]; j++)
                output[Xpath[i][j]] = true;
            for (j = 0; j<Ypathlen[value - i]; j++)
                output[Ypath[value - i][j]] = true;
            return true;
        }
    }

    return false;
    
    
}
