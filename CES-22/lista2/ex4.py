import random
import datetime


def share_diagonal(x0, y0, x1, y1):
    return abs(x1 - x0) == abs(y1 - y0)


def col_clashes(bs, c):
    for i in range(c):
        if share_diagonal(i, bs[i], c, bs[c]):
            return True
    return False


def has_clashes(the_board):
    for col in range(1,len(the_board)):
        if col_clashes(the_board, col):
            return True
    return False


def solve(sz, solutions):
    rng = random.Random()
    bd = list(range(sz))
    num_found = 0
    tries = 0
    t0 = datetime.datetime.now()
    while num_found < solutions:
        rng.shuffle(bd)
        tries += 1
        if not has_clashes(bd):
            print("Found solution {0} in {1} tries.".format(bd, tries))
            tries = 0
            num_found += 1
    print("Time : " + str((datetime.datetime.now()-t0)/solutions) + " per solution\n\n")


solve(4, 10)
solve(12, 10)
solve(16, 3)
solve(19, 1) #approximately one minute to find