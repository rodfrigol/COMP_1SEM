# DESIGN PATTERN BRIDGE
from abc import ABC, abstractmethod


# CLASSE DE ABSTRAÇÃO REFERENTE AOS VEÍCULOS. A CADA VEÍCULO É ATRIBUÍDO UM TIPO DE MOTOR NO MOMENTO DA DECLARAÇÃO
class Veiculo:
    def __init__(self, motor, velocidade = 0):
        self.motor = motor
        self.velocidade = velocidade

    def acelerar(self):
        esforco = self.motor.realizar_esforco()
        if esforco[0]:
            self.velocidade += 1
            print('Aceleração realizada, o motor possui ' + esforco[1] + ' de energia e o veículo ' +str(self.velocidade)+ ' de velocidade.')

    def energizar(self):
        self.motor.energizar()

    @abstractmethod
    def obter_veiculo(self):
        pass


class Caminhao(Veiculo):
    def obter_veiculo(self):
        print('Este veículo é um caminhão com ' + self.motor.descricao())


class Automovel(Veiculo):
    def obter_veiculo(self):
        print('Este veículo é um automóvel com ' + self.motor.descricao())


class Motocicleta(Veiculo):
    def obter_veiculo(self):
        print('Este veículo é uma motocicleta com ' + self.motor.descricao())


# CLASSE DE IMPLEMENTAÇÃO DOS MOTORES. OS MOTORES PODEM REALIZAR TAREFAS MAIS ELEMENTARES, COMO REALIZAR ESFORÇO PARA
# AUMENTAR A VELOCIDADE DOS VEÍCULOS
class Motor():
    def __init__(self):
        self.energia = 0

    def realizar_esforco(self):
        if self.energia == 0:
            print('OOOPS, motor sem energia!!')
            return False, ''
        else:
            self.energia -= 1
            return True, str(self.energia)

    @abstractmethod
    def energizar(self):
        pass

    @abstractmethod
    def descricao(self):
        pass


class MotorEletrico(Motor):
    def energizar(self):
        self.energia = 100
        print('Motor Eletrico sendo energizado...')

    def descricao(self):
        return 'motor elétrico'


class MotorHibrido(Motor):
    def energizar(self):
        self.energia = 100
        print('Motor Híbrido sendo energizado/abastecido...')

    def descricao(self):
        return 'motor híbrido'


class MotorCombustao(Motor):
    def energizar(self):
        self.energia = 100
        print('Motor à Combustão sendo abastecido...')

    def descricao(self):
        return 'motor à combustão'


def test(veiculo):
    veiculo.obter_veiculo()
    veiculo.acelerar()
    veiculo.energizar()
    veiculo.acelerar()
    veiculo.acelerar()
    veiculo.acelerar()
    print('\n')


if __name__ == '__main__':
    caminhao_hibrido = Caminhao(MotorHibrido())
    test(caminhao_hibrido)

    motocicleta_combustao = Motocicleta(MotorCombustao())
    test(motocicleta_combustao)

    automovel_eletrico = Automovel(MotorEletrico(), 10)
    test(automovel_eletrico)