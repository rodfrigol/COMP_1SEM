class Point:
    def __init__(self, x=0, y=0):
        self.x = x
        self.y = y

    def get_line_to(self, other):
        m = (other.y-self.y)/(other.x-self.x)
        return m, self.y - m*self.x

    def __str__(self):
        return "({0}, {1})".format(self.x, self.y)


print(Point(4, 11).get_line_to(Point(6, 15)))