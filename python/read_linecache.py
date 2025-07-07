import linecache

data=linecache.getline('storyfile.txt',2)
print(data)


#readlines

data=open("storyfile.txt")
output=data.readlines()

# forst first 4 lines
print(output[0:4])

print("")
#for last two lines
lenth=len(output)
start=lenth-2
for line in output[start:lenth]:
    print(line)
