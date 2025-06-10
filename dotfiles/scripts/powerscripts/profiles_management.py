import subprocess
import sys


def run_script(option):
    subprocess.call(['sh', f"/home/nick/powerscripts/{option}.sh"])


def cycle(forward):
    cmd = ["powerprofilesctl", "get"]
    output = subprocess.Popen( cmd, stdout=subprocess.PIPE ).communicate()[0].decode("utf-8").lstrip().rstrip()
    
    options = ["power-saver", "balanced", "performance"]

    working_index = options.index(output)
    
    if forward:
        if working_index != 2:
            working_index += 1
        else:
            working_index = 0
    else:
        if working_index != 0:
            working_index -= 1
        else:
            working_index = 2

    run_script(options[working_index])


if __name__ == "__main__":
    try:
        instruction = int(sys.argv[1])
    except:
        print("Bruh.")
        quit()
else:
    print("powerscripts not the main file!")
    quit()



if instruction < 0 or instruction > 4:
    print("Unsupported command!")
    quit()

elif instruction == 0:
    run_script("power-saver")

elif instruction == 1:
    run_script("balanced")

elif instruction == 2:
    run_script("performance")

elif instruction == 3:
    cycle(True)

elif instruction == 4:
    cycle(False)



