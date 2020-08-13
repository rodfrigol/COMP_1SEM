def sum_complex(a, b):
    return a[0]+b[0], a[1] + b[1]

def test(a, b):
    print(str(a) + ' + ' + str(b) + ' = ' + str(sum_complex(a, b)))


test((4, 6), (-2, 7))
test((0, 0), (-2, 7))
test((-2, 7), (0, 0))
test((0, 0), (0, 0))
test((8, 8), (-5, 3))