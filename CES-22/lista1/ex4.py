def sum_to_even(list):
    sum = 0
    for num in list:
        if num%2 == 0:
            return sum
        sum += num
    return sum


def test(list):
    print(str(list) + ' => ' + str(sum_to_even(list)))


print('if there is no even number, the sum of all elements is returned')
test([-1, 9])
test([3, 9, 10, 9])
test([2, 9, 10])
test([-5, -9, 3, -4])