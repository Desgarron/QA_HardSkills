# Задача №4
# Обменник. Скрипт запускается в консоли и работает постоянно. Остановится нажатием ctrl+c.
#     1. Скрипт сначала выводит "Выберите валюту из ['USD','EUR','CHF','GBP','CNY']"
#     2. Пользователь вводит один из 5 вариантов ['USD','EUR','CHF','GBP','CNY']
#     3. Потом Скрипт выводит "Введите сумму"
#     4. Пользователь вводит сумму int
#     5. Скрипт выводит:
#             "Вы ввели сумму int и валюту "Валюта" "
#             "конвертированная сумма в "Валюта" = int"
#     6. Скипт должен выдать сообщение
#                 "Введите положительное число." Если число меньше 0.
#                 "Вы ввели не число. Введите число." Если введены буквы.
#                 "Вы ввели пустое поле. Введите число." Если введено пустое значение.
#     7. После сообщеня об ошибке, скрипт должен автоматом вернуться к шагу 1.
#     8. Валюту пользователя определите сами.



# 1 solution
def convector_4():
    currency = {"USD": 29.50, "EUR": 31.82, "CHF": 30.34, "GBP": 37.19, 'CNY': 4.49}

    while True:
        print("Выберите валюту из ['USD','EUR','CHF','GBP','CNY']")
        currency_choose = input()
        print("Введите сумму")
        value = input()

        for k, v in currency.items():
            if k == currency_choose.upper():
                if value.strip() == '' or len(value) == 0:
                    print("Вы ввели пустое поле. Введите число.")
                else:
                    if value.isalpha():
                        print("Вы ввели не число. Введите число.")
                    elif int(value) >= 0:
                        print("Вы ввели сумму", value, "и валюту", currency_choose.upper())
                        r = int(value) / v
                        print("конвертированная сумма в", currency_choose.upper(), "=", int(r))
                    elif int(value) < 0:
                        print("Введите положительное число.")

# 2 solution
currency = {"USD": 29.50, "EUR": 31.82, "CHF": 30.34, "GBP": 37.19, 'CNY': 4.49}
while True:
    print("Выберите валюту из ['USD','EUR','CHF','GBP','CNY']")
    currency_1 = input()
    for k, v in currency.items():
        if k == currency_1.upper():
            print("Введите сумму")
            currency_2 = input()
            if currency_2.strip() == '' or len(currency_2) == 0:
                print("Вы ввели пустое поле. Введите число.")
            else:
                try:
                    if int(currency_2) >= 0:
                        print("Вы ввели сумму", currency_2, "и валюту", currency_1.upper())
                        r = int(currency_2) / v
                        print("конвертированная сумма в", currency_1, "=222", int(r))
                    elif int(currency_2) < 0:
                        print("Введите положительное число.")
                except ValueError:
                    print("Вы ввели не число. Введите число.")
