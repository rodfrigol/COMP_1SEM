#include <RBTreeNode.h>

RBTreeNode::RBTreeNode(std::pair<float, long> p, RBTreeNode *T) : par(p), is_black(0), right(NULL), left(NULL), parent(T){
}
