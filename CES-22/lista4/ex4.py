# DESIGN PATTERN COMMAND
from abc import ABC, abstractmethod
import datetime
import tkinter as tk


# OS COMANDOS FAZEM REQUISIÇÕES PARA O RECEPTOR (SISTEMA DO BANCO)
class Comando(ABC):
    def __init__(self, receiver):
        self.receiver = receiver

    @abstractmethod
    def execute(self):
        pass


class VerificarSaldo(Comando):
    def execute(self):
        self.receiver.obter_saldo()


class ObterExtrato(Comando):
    def execute(self):
        self.receiver.obter_extrato()


class RealizarTransferência(Comando):
    def __init__(self, receiver, destino):
        super().__init__(receiver)
        self.destino = destino

    def execute(self):
        self.receiver.realizar_transferência(self.destino)


# O RECEPTOR É ONDE AS TAREFAS SÃO EXECUTADAS DE FATO
class Receiver:
    def obter_saldo(self):
        print('O receptor está realizando as operações de obtenção do saldo...')

    def obter_extrato(self):
        print('O receptor esta realizando as operações de obtenção do extrato...')

    def realizar_transferência(self, b):
        print(f'O receptor esta realizando uma transferência para {b}...')


# O INVOCADOR PODE EXECUTAR COMANDOS, FAZENDO REQUISIÇÕES DE DIFERENTES AÇÕES
class Invocador:
    def __init__(self):
        self.on_start = None
        self.on_end = None
        self.historico = []

    def set_on_start(self, on_start):
        self.on_start = on_start

    def set_on_end(self, on_end):
        self.on_end = on_end

    def run(self):
        print('Invocando Receptor...')
        if self.on_start is not None:
            self.on_start.execute()
        if self.on_end is not None:
            self.on_end.execute()
        self.add_historico()
        self.on_start = self.on_end = None

    def add_historico(self):
        string = str(datetime.datetime.now())+' : '
        if self.on_start is not None:
            string += self.on_start.__class__.__name__ + ' '
        if self.on_end is not None:
            string += self.on_end.__class__.__name__
        self.historico.append(string)

    def print_hist(self):
        print('Histórico de operações:')
        for ocorrencia in self.historico:
            print(ocorrencia)


# A INTERFACE DO CLIENTE INTERAGE COM O INVOCADOR
class Interface(tk.Frame):
    def __init__(self, invoker, receiver):
        self.master = tk.Tk()
        self.invoker = invoker
        self.receiver = receiver
        super().__init__(self.master)
        self.pack()
        self.create_widgets()

    def create_widgets(self):
        # BOTÃO VERIFICA SALDO
        self.saldo = tk.Button(self, text="VERIFICAR SALDO",
                              command=self.verificar_saldo)
        self.saldo.pack(side="top")

        # BOTÃO OBTER EXTRATO
        self.extrato = tk.Button(self, text="OBTER EXTRATO",
                               command=self.obter_extrato)
        self.extrato.pack(side="top")

        # BOTÃO REALIZAR TRANSFERÊNCIA
        self.transf = tk.Button(self, text="REALIZAR TRANSFERENCIA",
                                 command=self.realizar_transferência)
        self.transf.pack(side="top")

        # BOTÃO HISTORICO
        self.hist = tk.Button(self, text="OBTER HISTORICO",
                                command=self.historico)
        self.hist.pack(side="top")

        # BOTÃO PARA FECHAR APLICAÇÃO
        self.quit = tk.Button(self, text="QUIT", fg="red",
                              command=self.master.destroy)
        self.quit.pack(side="bottom")

    def verificar_saldo(self):
        print('\nChamando Invocador...')
        self.invoker.set_on_start(VerificarSaldo(self.receiver))
        self.invoker.run()

    def obter_extrato(self):
        print('\nChamando Invocador...')
        self.invoker.set_on_start(ObterExtrato(self.receiver))
        self.invoker.run()

    def realizar_transferência(self):
        print('\nChamando Invocador...')
        self.invoker.set_on_start(VerificarSaldo(self.receiver))
        self.invoker.set_on_end(RealizarTransferência(self.receiver, '000000'))
        self.invoker.run()

    def historico(self):
        print('\nChamando Invocador...')
        self.invoker.print_hist()


if __name__ == '__main__':
    invoker = Invocador()
    receptor = Receiver()
    app = Interface(invoker, receptor)
    app.mainloop()


