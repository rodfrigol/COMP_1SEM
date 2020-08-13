def is_prime(n):
    for i in range(2, n):
        if n%i == 0:
            return False
    return True


def test(n):
    if is_prime(n):
        bool = ''
    else:
        bool = 'not '
    print(str(n) + ' is ' + bool + 'prime')


test(2)
test(3)
test(4)
test(11)
test(35)
test(20000501)