# DESIGN PATTERN STATE
from abc import ABC, abstractmethod


# O DOCUMENTO POSSUI UMA REFERÊNCIA PARA SEU ESTADO ATUAL E PODEM SER FEITAS REQUISIÇÕES PARA MUDANÇA DE ESTADO
class Document(ABC):
    def __init__(self, state):
        self.transition_to(state)

    def transition_to(self, state):
        self._state = state
        self._state.context = self

    def request1(self):
        self._state.handle1()

    def request2(self):
        self._state.handle2()


# OS ESTADOS POSSUEM UMA REFERÊNCIA PARA O DOCUMENTO E POSSUEM NOS SEUS MÉTODOS QUAIS SÃO AS POSSÍVEIS TRANSIÇÕES
class State(ABC):
    @property
    def context(self):
        return self._context

    @context.setter
    def context(self, context):
        self._context = context

    @abstractmethod
    def handle1(self):
        pass

    @abstractmethod
    def handle2(self):
        pass


class Draft(State):
    def handle1(self):
        print('State change from Draft to Moderation')
        self.context.transition_to(Moderation())

    def handle2(self):
        print('State change from Draft to Published')
        self.context.transition_to(Published())


class Moderation(State):
    def handle1(self):
        print('State change from Moderation to Draft')
        self.context.transition_to(Draft())

    def handle2(self):
        print('State change from Moderation to Published')
        self.context.transition_to(Published())


class Published(State):
    def handle1(self):
        print('State change from Published to Draft')
        self.context.transition_to(Draft())

    def handle2(self):
        pass


# O USUÁRIO PODE PUBLICAR UM DOCUMENTO
class User:
    def publish(self, doc):
        doc.request1()


# O ADMIN PODE PUBLICAR, REVISAR E EXPIRAR UM DOCUMENTO
class Admin:
    def publish(self, doc):
        doc.request2()

    def approve(self, doc):
        doc.request2()

    def deny(self, doc):
        doc.request1()

    def expire(self, doc):
        doc.request1()


if __name__ == '__main__':
    user = User()
    adm = Admin()
    doc = Document(Draft())

    print('Documento publicado, mas negado:')
    user.publish(doc)
    adm.deny(doc)

    print('\nDocumento publicado, aprovado e expirado:')
    user.publish(doc)
    adm.approve(doc)
    adm.expire(doc)

    print('\nDocumento publicado diretamente e expirado:')
    adm.publish(doc)
    adm.expire(doc)
