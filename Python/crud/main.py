from crud.create_1 import create_user
from crud.read_1 import user_info, all_users_info
from crud.delete_1 import delete_all, delete_user
from crud.update_1 import update_user_info

users_emails = []
users_storage = {}


while True:

    action = input('Please enter create or read, or update or delete actions: ')
    print('action = ', action)
    if action == 'create':
        email = input('Email: ')

        if email in users_emails:
            print('Email exist')
            continue

        name = input('Name: ')
        password = input('Password: ')
        phone = input('Phone: ')
        create_user(email,
                    name,
                    password,
                    phone,
                    users_emails,
                    users_storage)
        print('', users_emails)
    elif action == 'read_all':
        all_users_info(users_storage)
    elif action == 'read_user':
        user_e = input('Enter user email: ')
        message = user_info(user_e, users_emails, users_storage)
        print('action = ', action)
        print('User: ', message)

    elif action == 'update':
        print('Users emails: ', *users_emails, sep=' | ')
        email = input('Enter user email that you want to change: ')
        key = input('Enter one of the params (name | password | phone) you want to change: ')
        value = input('Enter new value: ')
        update_user_info(email, key, value, users_storage)
        print('Success')

    elif action == 'delete':
        action = input('delete_user or delete_all? \n')

        if action == 'delete_all':
            delete_all(users_emails, users_storage)
            print(users_emails, users_storage)
        if action == 'delete_user':
            print('Users emails: ', *users_emails, sep=' | ')
            email = input("Entre user email you want to delete ")
            delete_user(email, users_emails, users_storage)
