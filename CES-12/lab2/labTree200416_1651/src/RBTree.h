#ifndef CES12_RBTREE_H
#define CES12_RBTREE_H
#include <RBTreeNode.h>

class RBTree{

public:

    RBTree();
    long size();
    void insert(std::pair<float, long> p);
    void find(std::vector<long> &res, float first, float last);

private:

    RBTreeNode *_T;
    void recursive_count(RBTreeNode *t, int *total);

    RBTreeNode* get_uncle(RBTreeNode* t); 
    int get_is_black(RBTreeNode* t);

    void right_rotate(RBTreeNode *g);
    void left_rotate(RBTreeNode *g);
};


#endif