#ifndef CES12_RBTREENODE_H
#define CES12_RBTREENODE_H
#include <iostream>
#include <vector>
#include <map>

class RBTreeNode{

public:

    RBTreeNode(std::pair<float, long> p, RBTreeNode *T);


    RBTreeNode *right, *left, *parent;
    int is_black;
    std::pair<float, long> par;

};

#endif