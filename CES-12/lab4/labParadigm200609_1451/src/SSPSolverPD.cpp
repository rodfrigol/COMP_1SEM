#include <SubsetSumSolver.h>



 bool SSPSolverPD::solve(const std::vector< long> &input,
                            long value, std::vector< char> &output) {
    
    int n = input.size();
    output.resize(n);

    long sum, k;

    //o vetor R apresenta indices de 0 a n, indicando se o índice correspondente pode ser uma soma dos valores em input
    bool *R = (bool *)malloc((value+1) * sizeof(bool));
    R[0] = true;
    for (int i = 1; i<=value; i++)
        R[i] = false;

    //o vetor X tem para cada indice o ultimo elemento adicionado para se obter o valor correspondente ao indice
    int *X = (int *)malloc((value+1) * sizeof(int));

    //para cada iteração dos valores em input, os valores de R são somados ao valor da iteração e,
    //se não excederem value nem forem repetidos, são acionados em R e o índice do último valor
    //somado é adicionado à posição correspondente no vetor X.
    for (int j=0; j<n; j++){
        for (k = value; k >= 0; k--){
            if (R[k]){
                sum = k+input[j];
                if (sum <= value && !R[sum]){
                    R[sum] = true;
                    X[sum] = j;
                }
            }
        }
    }

    //Por fim, basta verificar se o valor de value está presente no vetor R e, se estiver, preencher o output
    //de acordo com um backtrace no vetor X
    if (R[value]){

        while (value){
            output[X[value]] = true;
            value -= input[X[value]];
        }

        return true;
    }

    return false;
    
}
