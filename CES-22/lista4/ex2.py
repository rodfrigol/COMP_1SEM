# DESIGN PATTERN DECORATOR


class EatComponent:
    def getDescription(self):
        return self.__class__.__name__

    def getTotalCost(self):
        return self.__class__.cost


class PizzaBox(EatComponent):
    cost = 0.10


# A CLASSE DECORADORA É FORMADA POR UM COMPONENTE E UM COMPONENTE ASSOCIADO A ESTE (QUE PODE
# POSSUIR OUTRO COMPONENTE ASSOCIADO, RECURSIVAMENTE)
class Decorator(EatComponent):
    def __init__(self, eatComponent):
        self.component = eatComponent

    def getTotalCost(self):
        return self.component.getTotalCost() + EatComponent.getTotalCost(self)

    def getDescription(self):
        return self.component.getDescription() + ' ' + EatComponent.getDescription(self)


class Cheese(Decorator):
    cost = 0.50

    def __init__(self, eatComponent):
        Decorator.__init__(self, eatComponent)


class Pepperoni(Decorator):
    cost = 0.20

    def __init__(self, eatComponent):
        Decorator.__init__(self, eatComponent)


class Tomato(Decorator):
    cost = 0.10

    def __init__(self, eatComponent):
        Decorator.__init__(self, eatComponent)


class Bacon(Decorator):
    cost = 0.35

    def __init__(self, eatComponent):
        Decorator.__init__(self, eatComponent)


def test(component):
    print(component.getDescription() + ": $" + str(component.getTotalCost()) + '\n')


if __name__ == '__main__':
    pepperoni = Cheese(Pepperoni(PizzaBox()))
    test(pepperoni)
    muzarella = Cheese(Tomato(PizzaBox()))
    test(muzarella)
    bacon = Cheese(Bacon(PizzaBox()))
    test(bacon)