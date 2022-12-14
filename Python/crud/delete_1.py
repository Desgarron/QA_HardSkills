
def delete_all(emails: list | slice, users_storages: dict):
    """"
    Delete all information about users
    """
    emails.clear()
    users_storages.clear()


def delete_user(user_email: slice | str, users_emails: list, users_storage: dict):
    users_emails.remove(user_email)
    del users_storage[user_email]
