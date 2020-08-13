# DESIGN PATTERN FACTORY
from abc import ABC, abstractmethod
import ex1


# A CLASSE CRIADOR DECLARA O MÉTODO DE CRIAÇÃO DOS OBJETOS.
# É NECESSÁRIO UM CRIADOR DE MOTORES E OUTRO DE VEÍCULOS, POIS NA CRIACAO DE VEICULOS
# O MOTOR É RECEBIDO COMO ARGUMENTO
class CriadorMotor:
    @abstractmethod
    def criarObjeto(self):
        pass


class CriadorMotorEletrico(CriadorMotor):
    def criarObjeto(self):
        return ex1.MotorEletrico()


class CriadorMotorHibrido(CriadorMotor):
    def criarObjeto(self):
        return ex1.MotorHibrido()


class CriadorMotorCombustao(CriadorMotor):
    def criarObjeto(self):
        return ex1.MotorCombustao()


class CriadorVeiculo:
    @abstractmethod
    def criarObjeto(self, motor, velocidade = 0):
        pass


class CriadorCaminhao(CriadorVeiculo):
    def criarObjeto(self, motor, velocidade = 0):
        return ex1.Caminhao(motor, velocidade)


class CriadorAutomovel(CriadorVeiculo):
    def criarObjeto(self, motor, velocidade = 0):
        return ex1.Automovel(motor, velocidade)


class CriadorMotocicleta(CriadorVeiculo):
    def criarObjeto(self, motor, velocidade = 0):
        return ex1.Motocicleta(motor, velocidade)


def test(veiculo):
    veiculo.obter_veiculo()
    veiculo.acelerar()
    veiculo.energizar()
    veiculo.acelerar()
    veiculo.acelerar()
    veiculo.acelerar()
    print('\n')


#SERÃO REALIZADAS EXATAMENTE OS MESMOS TESTES DO EXERCÍCIO 1, MUDANDO APENAS A INSTANCIAÇÃO
if __name__ == '__main__':
    motor_hibrido = CriadorMotorHibrido().criarObjeto()
    caminhao_hibrido = CriadorCaminhao().criarObjeto(motor_hibrido)
    test(caminhao_hibrido)

    motor_combustao = CriadorMotorCombustao().criarObjeto()
    motocicleta_combustao = CriadorMotocicleta().criarObjeto(motor_combustao)
    test(motocicleta_combustao)

    motor_eletrico = CriadorMotorEletrico().criarObjeto()
    automovel_eletrico = CriadorAutomovel().criarObjeto(motor_eletrico, 10)
    test(automovel_eletrico)