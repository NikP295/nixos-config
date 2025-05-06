


with open("test.txt", "r") as f:
    lines = f.readlines()
    #print(len(lines))
text = ""

for i in range(0, len(lines)):
    
    line = lines[i]
    for i in line:
        if i == '~':
            text = text + "/home/nick"
        else:
            text = text + i

print(text)
    

