class Point:
    def __init__(self, x=0, y=0):
        self.x = x
        self.y = y

    def reflect_x(self):
        return Point(self.x, -self.y)

    def __str__(self):
        return "({0}, {1})".format(self.x, self.y)


print(Point(3, 5).reflect_x())