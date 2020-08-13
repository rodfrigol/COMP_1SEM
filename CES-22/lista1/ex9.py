def is_palindrome(str):
    return str == str[::-1]


def test(str):
    if is_palindrome(str):
        bool = ''
    else:
        bool = 'not '
    print("'" + str + "'" + ' is ' + bool + 'palindrome')


test('abba')
test('abab')
test('a')
test('banana')
test('socorram-me-em-marrocos')
test('')