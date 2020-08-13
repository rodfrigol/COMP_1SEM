import turtle

def draw_square(alex, size):
    for i in range(4):
        alex.forward(size)
        alex.left(90)

wn = turtle.Screen()
wn.bgcolor("lightgreen")
wn.title("Exercício 1")

alex = turtle.Turtle()

for i in range(1, 6):
    alex.penup()
    alex.goto(-10*i, -10*i)
    alex.pendown()
    draw_square(alex, 20*i)

wn.mainloop()