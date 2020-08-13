def addinfo(func):
    def newfunc(name, ex):
        ex_restantes = func(name, ex)
        print("Restam {} exercícios para terminar a lista.".format(ex_restantes))
    return newfunc


@addinfo
def print_state(name, exercicio):
    print("\nEstou estudando {}".format(name))
    return str(12 - exercicio)


print_state('CES-22', 10)