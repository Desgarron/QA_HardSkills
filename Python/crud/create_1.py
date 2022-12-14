def create_user(email: str, name: str, password: str, phone: str, users_emails: list, users_storage: dict):
    """
    Create record info about particular user to the list
    """
    user_info = [email, name, password, phone]
    users_emails.append(email)
    users_storage[email] = {'name': name,
                            'password': password,
                            'phone': phone
                            }
    print('new user info: ', user_info)
