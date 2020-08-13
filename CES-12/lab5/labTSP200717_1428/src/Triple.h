#ifndef TRIPLE
#define TRIPLE


class Triple {
    public:
        int id;
        int dist;
        int other;
        Triple(int _id, int _dist, int _other): id(_id), dist(_dist), other(_other){};
        Triple(){};
}; 

#endif
