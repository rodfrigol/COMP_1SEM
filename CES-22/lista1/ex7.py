def sum_of_squares(xs):
    sum = 0
    for num in xs:
        sum += num*num
    return sum

def test(xs):
    print(str(xs) + ' => ' + str(sum_of_squares(xs)))


test([2, 3, 4])
test([])
test([2, -3, 4])
test([0, -4, 4])