import subprocess
import os

paths_file = "/etc/nixos/dotfiles/dotfiles_management/managed_files_list.txt"


def the_copying(location1, location2, backup):
    if backup:
        source = location1
        destination = location2
    else:
        source = location2
        destination = location1


    dest_split = destination.split("/")
    src_split = source.split("/")

    # from inside outwards: len - 1 = last index, which is used to determine the last chunk, then the lenght of that chunk
    filename_length = len(dest_split[len(dest_split)-1])
    
    in_root = True 
    
    if "home" in dest_split or "home" in src_split:
        in_root = False

    if dest_split[0] == "":
        path = "/"

    else:
        path = ""



    for j in range(1, len(destination) - filename_length):
        path = path + destination[j]



    if in_root:
        subprocess.run(["sudo", "mkdir", "-p", path], capture_output=True, text=True)
    else:
        subprocess.run(["mkdir", "-p", path], capture_output=True, text=True)


    if in_root:
        result = subprocess.run(["sudo", "cp", "-rf", source, destination], capture_output=True, text=True)
    
    else:    
        result = subprocess.run(["cp", "-rf", source, destination], capture_output=True, text=True)
    
    print(f"copied: {source} to {destination}")

    if result.returncode != 0:
        print("Error:", result.stderr)
    else:
        pass
        #print("W:", result.stdout)

    #print(f"This would: c(o)p(y) {source} {destination}")



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
        for i in range(0, len(list_format_files)):
            relevant_items.append(i)
    
    else:
        relevant_items_str = answer.split(",")
        
        for j in relevant_items_str:
            try:
                relevant_items.append(int(j) - 1)
            except:
                pass
    
    return (backup, relevant_items)


with open(paths_file, "r") as f:
    lines = f.readlines()
    #print(len(lines))

for i in range(0, len(lines)):
    
    line = lines[i].rstrip("\n")
    
    if i == 0:
        instructions = get_instructions(line)
        print(instructions)
        continue

    if i-1 in instructions[1]:
        lct1_lct2 = line.split("&")
        the_copying(lct1_lct2[0], lct1_lct2[1], instructions[0])
        lct1_lct2.clear()
    
    else:
        #print("Skipped a line" + str(i))
        pass



