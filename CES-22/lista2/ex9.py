class Shape:
    geometric_shape = 'Generic Shape'

    def area(self):
        raise NotImplementedError

    def get_geometric_type(self):
        return self.geometric_type


class Plotter:
    def plot(self, ratio, topleft):
        print("Plotting at {}, ratio {}.".format(topleft, ratio))


class Polygon(Shape, Plotter):
    geometric_type = 'Polygon'


class RegularPolygon(Polygon):
    geometric_type = 'Regular Polygon'

    def __init__(self, side):
        self.side = side


class RegularHexagon(RegularPolygon):
    geometric_type = 'RegularHexagon'

    def area(self):
        return 1.5 * (3 ** .5 * self.side ** 2)


class Square(RegularPolygon):
    geometric_type = 'Square'

    def area(self):
        return self.side ** 2


class Triangle(RegularPolygon):
    geometric_type = 'Triangle'

    def area(self):
        return (3 ** .5 * self.side ** 2)/4


hexagon = RegularHexagon(10)
print(hexagon.area())
print(hexagon.get_geometric_type())
hexagon.plot(0.8, (75, 77))
print(hexagon.__class__.__mro__)
print('\n\n')

square = Square(12)
print(square.area())
print(square.get_geometric_type())
square.plot(0.93, (74, 75))
print(square.__class__.__mro__)
print('\n\n')

pol = Polygon()
print(pol.__class__.__mro__)
print('\n\n')

plttr = Plotter()
print(plttr.__class__.__mro__)
print('\n\n')

trng = Triangle(1)
print(trng.area())
print(trng.get_geometric_type())
trng.plot(9, (76, 44))
print(trng.__class__.__mro__)