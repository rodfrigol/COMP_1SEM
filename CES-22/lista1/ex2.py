import turtle

def draw_poly(t, n, sz):
    for i in range(n):
        t.forward(sz)
        alex.left(360/n)

wn = turtle.Screen()
wn.bgcolor("lightgreen")
wn.title("Exercício 2")

alex = turtle.Turtle()

draw_poly(alex, 8, 50)

wn.mainloop()