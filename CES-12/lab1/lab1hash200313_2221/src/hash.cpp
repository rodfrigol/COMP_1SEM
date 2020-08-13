#include "hash.h"

// LOOK FOR THE COMMENTS IN THE .H 
// TO UNDERSTAND WHAT EACH FUNCTION MUST DO

Hash::Hash(int tablesize, int (*hf) (std::string) ) : _hash_func(hf){
    
    _table.resize(tablesize);

 // CONSTRUTOR 
}

int Hash::add(std::string str, int &collisions) { 
    
    if (contains(str, collisions))
        return 0;

    int strhash = hash(str);
    _table[strhash].push_front(str);

    return 1;

    // porque existe 'return 0' neste codigo? 
    // para executar os testes, mesmo falhando, eh preciso compilar
    // assim, eh preciso retornar algum valor.
    // ** o aluno deve implementar a funcao completa e retornar o valor correto **
    //return 0;
    
}//add

int Hash::remove(std::string str, int &collisions) { 
    
    if (!contains(str, collisions))
        return 0;
    
    int strhash = hash(str);
    _table[strhash].remove(str);

    return 1;

    //return 0;
    
}//remove


int Hash::hash(std::string str) { 

    return _hash_func(str);
    
    //return 0;
    
}//hash
    
int Hash::contains(std::string str, int &collisions) { 
    
    int strhash = hash(str);
    collisions = 0;
    
    for (auto it = _table[strhash].begin(); it != _table[strhash].end(); it++){
        collisions ++;
        if (*it == str){
            return 1;
        }
    }

    return 0;
    
}//contains


int Hash::worst_case() {

    int worst = 0;
    int size;

    for (auto it = _table.begin(); it != _table.end(); it++){
        size = 0;
        for (auto i = (*it).begin(); i != (*it).end(); i++){
            size ++;
        }
        
        if (size>worst)
            worst = size;
    }
    
    return worst;

    //return 0;
    
}//worst_case

int Hash::size() {

    int total = 0;

    for (auto it = _table.begin(); it != _table.end(); it++)
        for (auto i = (*it).begin(); i != (*it).end(); i++)
            total ++;

    return total;

    //return 0;
    
}//size

