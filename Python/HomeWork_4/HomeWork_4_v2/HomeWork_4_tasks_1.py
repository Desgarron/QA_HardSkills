
# Задача №1
# Обменник. Создать скрипт который будет запускаться из консоли 1 раз из консоли, выдавать результат и закрываться.
#     1. На вход обменнику вводишь количество денег int.
#     2. На выходе в консоль выводится ответ в таком виде:
#                 "Ты ввёл int (Валюта)"
#                 "конвертированная сумма в USD = int"
#     3. Валюту пользователя определите сами.

import argparse

parser = argparse.ArgumentParser(description='Currency = ')
parser.add_argument('--currency', type=int)

USD = 29.50
args = parser.parse_args()
cur_ex = int(args.currency / USD)

print('Ты ввёл', ' ', args.currency, ' ', 'UAH')
print('конвертированная сумма в USD = ', cur_ex)

# print('Введи сумы в гривне и нажим Enter')
# a = int(input())
# USD = 28.50
# currency = int(a / USD)
#
# print('Ты ввёл', a, 'UAH')
# print('конвертированная сумма в USD =', currency)
