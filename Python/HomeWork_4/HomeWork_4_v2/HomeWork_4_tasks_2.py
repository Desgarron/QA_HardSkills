# Задача №2
# Обменник. Создать скрипт который будет запускаться из консоли 1 раз из консоли, выдавать результат и зарываться.
#     1. На вход обменнику вводишь количество денег int.
#     2. На выходе в консоль выводится ответ в таком виде:
#                 "Ты ввёл int (Валюта)"
#                 "Конвертированная сумма в USD = int"
#                 "Конвертированная сумма в EUR = int"
#                 "Конвертированная сумма в CHF = int"
#                 "Конвертированная сумма в GBP = int"
#                 "Конвертированная сумма в CNY = int"
#     3. Валюту пользователя определите сами.

currency = {"USD": 29.50, "EUR": 31.82, "CHF": 30.34, "GBP": 37.19, 'CNY': 4.49}
print('Введите целое число в гривне')
value = int(input())
print('Ты ввёл', value, 'в Гривне')
a = 0
for k, v in currency.items():
    a = int(value) / v
    print("Конвертированная сумма в " + k + ' =', int(a))
