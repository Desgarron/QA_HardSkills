def update_user_info(email: slice | str, key: slice | str, value: str, users_storage: dict):
    """
    Update user info for particular email.
    """
    users_storage[email][key] = value
