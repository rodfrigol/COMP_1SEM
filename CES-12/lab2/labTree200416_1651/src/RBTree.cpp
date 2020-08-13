#include <RBTree.h>

RBTree::RBTree() : _T(NULL){}

void RBTree::recursive_count(RBTreeNode *t, int *total){
    (*total) ++;
    if (t->left != NULL)
        recursive_count(t->left, total);

    if (t->right != NULL)
        recursive_count(t->right, total);
    
}

long RBTree::size(){

    if (_T == NULL)
        return 0;
    
    int total = 0;
    recursive_count(_T, &total);
    return total;

}

/////////////////////////////////////////

RBTreeNode* RBTree::get_uncle(RBTreeNode* t){
    RBTreeNode* parent = t->parent;
    RBTreeNode* gp = parent->parent;

    if (gp->left == parent)
        return gp->right;

    return gp->left;
}

int RBTree::get_is_black(RBTreeNode* t){
    if (t == NULL)
        return 1;
    return t->is_black;
}

void RBTree::right_rotate(RBTreeNode* g){
    RBTreeNode *p = g->left;
    RBTreeNode *aux = p->right;
    p->right = g;
    p->parent = g->parent;
    if (g->parent != NULL){
        if (g->parent->left == g){
            g->parent->left = p;
        }else{
            g->parent->right = p;
        }
    }else{
        _T = p;
    }
    g->parent = p;
    g->left = aux;
    if (aux != NULL)
        aux->parent = g;
}

void RBTree::left_rotate(RBTreeNode *g){
    
    RBTreeNode *p = g->right;
    RBTreeNode *aux = p->left;
    
    p->left = g;
    p->parent = g->parent;
    if (g->parent != NULL){
        if (g->parent->left == g){
            g->parent->left = p;
        }else{
            g->parent->right = p;
        }
    }else{
        _T = p;
    }
    g->parent = p;
    g->right = aux;
    if (aux != NULL)
        aux->parent = g;
}

void RBTree::insert(std::pair<float, long> p){
    
    RBTreeNode *t;
    int done = 0;

    if (_T == NULL){
        _T = new RBTreeNode(p, NULL);
        _T->is_black = 1;
        return;
    }
    
    for (t = _T; done == 0;){
        if(t->par.first > p.first){
            if (t->left != NULL){
                t = t->left;
            }else{
                t->left = new RBTreeNode(p, t);
                t = t->left;
                done = 1;
            }
        }else{
            if (t->right != NULL){
                t = t->right;
            }else{
                t->right = new RBTreeNode(p, t);
                t = t->right;
                done = 1;
            }
        }
    }
    
    while (!t->parent->is_black){
        if (!get_is_black(get_uncle(t))){
            t->parent->is_black = get_uncle(t)->is_black = 1;
            t->parent->parent->is_black = 0;
            t = t->parent->parent;
        }else{
            RBTreeNode *p = t->parent;
            RBTreeNode *g = p->parent;
            if(g->left == p && p->left == t){
                right_rotate(g);
                p->is_black = 1;
                g->is_black = 0;
            }
            if(g->left == p && p->right == t){
                left_rotate(p);
                right_rotate(g);
                t->is_black = 1;
                g->is_black = 0;
            }
            if(g->right == p && p->right == t){
                left_rotate(g);
                p->is_black = 1;
                g->is_black = 0;
            }
            if(g->right == p && p->left == t){
                right_rotate(p);
                left_rotate(g);
                t->is_black = 1;
                g->is_black = 0;
            }
            break;
        }

        if (t->parent == NULL){
            t->is_black = 1;
            break;
        }
    }
}

//////////////////////////////////////////
void recursive_find(RBTreeNode *t, float first, float last, std::vector<long> &res){
    if (t != NULL){
        if (t->par.first < first)
            recursive_find(t->right, first, last, res);
        else if(t->par.first > last)
            recursive_find(t->left, first, last, res);
        else{
            res.push_back(t->par.second);
            recursive_find(t->right, first, last, res);
            recursive_find(t->left, first, last, res);
        }
    }
}

void RBTree::find(std::vector<long> &res, float first, float last){
    recursive_find(_T, first, last, res);
}
