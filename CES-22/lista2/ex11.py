def estilos(*arguments, **keywords):
    print("Hoje eu ouvi música dos seguintes artistas:")
    for i in range(len(arguments)):
        print(arguments[i] + ' : ' + ', '.join(keywords[arguments[i]]))


estilos("Eletronica", "Rock", "Sertanejo", Eletronica=['Boris Brejcha', 'ANNA', 'Astrix'],
        Rock=['Pink Floyd', 'Queen'], Sertanejo=['Marilia Mendonça'])