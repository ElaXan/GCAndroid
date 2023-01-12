import os

def check_folder(path):
    """Checking if folder exists or not

    Args:
        path (_type_): _description_
        
    Returns:
        _type_: _description_
    """
    if not os.path.exists(path):
        return False
    else:
        return True
    
# Check if files exist
def check_file(path):
    """Checking if file exists or not

    Args:
        path (_type_): _description_

    Returns:
        _type_: _description_
    """
    if not os.path.isfile(path):
        return False
    else:
        return True