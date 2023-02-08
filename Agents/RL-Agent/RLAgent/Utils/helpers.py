import shutil
from typing import List
def copy_directory(directory, new_folder="copy"):
        folder_path = directory.split("/")
        folder_name = folder_path[-1]
        folder_path = "/".join(folder_path[:-1]) 
        if new_folder == "":
            new_folder = "copy"
        new_folder = "_"+new_folder
        new_path = folder_path + "/" + folder_name + new_folder
        shutil.copytree(directory, new_path)
        return new_path

def remove_directories(directoris: List[str]):
    for directory in directoris:
        shutil.rmtree(directory)