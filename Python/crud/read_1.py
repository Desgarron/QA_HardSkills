def user_info(email: slice | str, users_emails: list, users_storage: dict):
    """
    Return info about particular user from the list
    """
    if email in users_emails:
        message = 'user_email=', email, \
                  '\n', \
                  'user_info', users_storage[email]
        return message
    else:
        message = 'No user with this email ' + email
        return message


def all_users_info(users_storage: dict):
    """
    Return info about all users from the list
    """
    for k, v in users_storage.items():

        user_email = 'User email: ' + k
        user_info_1 = 'User_info: ', v
        print(user_email, '\n', user_info_1)
