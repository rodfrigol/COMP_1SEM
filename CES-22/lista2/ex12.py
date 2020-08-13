class Animal:
    def noise(self):
        raise NotImplementedError


class Cow(Animal):
    def noise(self):
        print('A vaca faz muuuu')


class Cat(Animal):
    def noise(self):
        print('O gato faz meow')


class Stone:
    def think(self):
        print("Unfortunately I can't talk")


class NoiseMaker:
    def make_noise(self, animal):
        try:
            animal.noise()
        except AttributeError:
            print("Duck typing : o python tentou realizar o comando 'noise' para a pedra, mas ela não possui esse atributo")



cat = Cat()
cow = Cow()
stone = Stone()

x = NoiseMaker()
x.make_noise(cat)
x.make_noise(cow)
x.make_noise(stone)