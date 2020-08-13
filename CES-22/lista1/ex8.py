def print_num(n, nspaces, string):
    lenn = len(str(n))
    for i in range(nspaces - lenn):
        string += ' '
    string += str(n)
    return string

def print_table(n):
    maxlenght = len(str(n))
    maxlenghtmult = len(str(n*n))
    string = ''

    string = print_num('', 2*maxlenght+1, string)
    for i in range(1, n+1):
        string = print_num(i, maxlenghtmult+1, string)
    string += '\n'

    string = print_num('', maxlenght, string)
    string += ':'
    for i in range(maxlenght + n*(1+maxlenghtmult)):
        string = print_num('-', 1, string)
    string += '\n'

    for i in range(1, n+1):
        string = print_num(i, maxlenght, string)
        string += ':'
        string = print_num('', maxlenght, string)
        for j in range(1, n+1):
            string = print_num(i*j, maxlenghtmult+1, string)
        string += '\n'
    print(string)


print_table(12)