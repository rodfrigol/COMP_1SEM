class MyClass:
    def __init__(self, password):
        self.password = password

    def static():
        print("""Método estático chamado, não é possível saber a instancia ou classe onde esta função esta sendo executada. 
        É vantajoso quando queremos definir uma função que não utiliza elementos da classe definida.\n\n\n""")
    static = staticmethod(static)   #modelo old school de definir uma função estática

    def cls(cls, pw):
        print("""Método de classe chamado, não é possível saber a instância do objeto, mas sim a classe.
        É vantajoso quando queremos utilizar a classe existente dentro da função.
        Por exemplo, vamos criar um objeto da classe com a senha recebida e printar esta senha:""")
        newObj = cls(pw)
        print(newObj.password + '\n\n\n')
    cls = classmethod(cls) #modelo old school de definir uma função de classe

    def abstract(self):
        raise NotImplementedError


class MyClassSub(MyClass):
    def __init__(self, pw, name):
        super().__init__(pw)
        self.name = name

    def abstract(self):
        print("""Método abstrato chamado. Notamos que ele só pode ser chamado por uma classe herdeira.
        É vantajoso quando a classe super terá uma função com diferentes implementações para cada clase herdeira.
        Para verificar que estamos na classe herdada, vamos printar a variável 'name', que só existe aqui.""")
        print("name : {0}".format(self.name))


obj = MyClass('banana')
obj.static()
obj.cls('maçã')

subObj = MyClassSub('banana', 'Rodrigo')
subObj.abstract()