import subprocess
import os

paths_file = "/etc/nixos/dotfiles/dotfiles_management/managed_files_list.txt"


def the_copying(location1, location2, backup, debug_mode_boone):
    if backup:
        source = location1
        destination = location2
    else:
        source = location2
        destination = location1


    dest_split = destination.split("/")
    src_split = source.split("/")
    

    filename = dest_split[len(dest_split)-1]
    filename_length = len(filename)

    if filename == "":
        filename = dest_split[len(dest_split)-2]
        filename_length = len(filename) + 1
    
    if debug_mode_boone:
        print(f"Filename: {filename}")
   

    in_root = True 
    
    if "home" in dest_split or "home" in src_split:
        in_root = False

    if dest_split[0] == "":
        path = "/"

    else:
        path = ""


    for j in range(1, len(destination) - filename_length):
        path = path + destination[j]
    
    #print(f"Path: {path}")
    #print(f"Destination: {destination}")
    
    # making sure there are no spaces:
    path = path.replace(" ", "")
    source = source.replace(" ", "")

    if in_root:
        result = subprocess.run(["sudo", "mkdir", "-p", path], capture_output=True, text=True)
    else:
        result = subprocess.run(["mkdir", "-p", path], capture_output=True, text=True)

    if result.returncode != 0:
        print("Error:", result.stderr)
    else:
        pass
        #print("W:", result.stdout)

    if in_root:
        result = subprocess.run(["sudo", "cp", "-rf", source, path], capture_output=True, text=True)
    
    else:
        result = subprocess.run(["cp", "-rf", source, path], capture_output=True, text=True)
    
    if debug_mode_boone:
        print(f"Copying: {source} to {path}")

    
    if result.returncode != 0:
        print("Error:", result.stderr)
    else:
        if debug_mode_boone:
            print("Big W!")
        else:
            pass
    

def get_instructions(copyable_files):
    answer = input("Copy from system 1 (Default), override system configs 2: ")
    if answer == "1" or answer == "":
        backup = True
    elif answer == "2":
        backup = False
    else:
        print("Input not found")
        quit()
    
    list_format_files = copyable_files.split(",")

    for i in range(0, len(list_format_files)):
        print(f"{i+1} {list_format_files[i].rstrip()}; ")

    answer = input("Please write the things you want to copy (empty=all, format=\"1,2,4,13\"): ")
    
    relevant_items = []
    
    if answer == "":
        for i in range(0, len(list_format_files) + 1):
            relevant_items.append(i)
    
    else:
        relevant_items_str = answer.split(",")
        
        for j in relevant_items_str:
            try:
                relevant_items.append(int(j))
            except:
                pass
    answer = input("Do you want to enable debug mode? Yes = 1, No = 2 (default): ")
    if answer == 2 or answer == "":
        debug_mode = False
    else:
        debug_mode = True


    return (backup, relevant_items, debug_mode)


with open(paths_file, "r") as f:
    lines = f.readlines()

for i in range(0, len(lines)):
    
    line = lines[i].rstrip("\n")
    
    if i == 0:
        instructions = get_instructions(line)
        print(instructions)
        continue

    if i in instructions[1]:
        lct1_lct2 = line.split("&")
        the_copying(lct1_lct2[0], lct1_lct2[1], instructions[0], instructions[2])
        lct1_lct2.clear()
    
    else:
        pass


