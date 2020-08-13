class Point:
    def __init__(self, x=0, y=0):
        self.x = x
        self.y = y

    def slope_from_origin(self):
        if self.x == 0:
            return None  #prevent fail
        return self.y/self.x

    def __str__(self):
        return "({0}, {1})".format(self.x, self.y)


print(Point(4, 10).slope_from_origin())