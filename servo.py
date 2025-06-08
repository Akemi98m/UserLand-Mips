from machine import Pin, PWM
from time import sleep

servo = PWM(Pin(15))
servo.freq(50)

def simula_angulo(angulo):
    tempo_total = 1.0
    tempo = (abs(angulo - 90) / 180) * tempo_total

    if angulo > 90:
        servo.duty_u16(10000)
    elif angulo < 90:
        servo.duty_u16(5000)
    else:
        servo.duty_u16(7500)
        return

    sleep(tempo)
    servo.duty_u16(7500)

simula_angulo(135)