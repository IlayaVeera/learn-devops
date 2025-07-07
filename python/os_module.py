import os

print(os.getcwd())

print("")

cwd=os.getcwd()
print(os.listdir(cwd))

print("")
os.chdir("../")
cwd=os.getcwd()
print(os.listdir(cwd))

newdir="test"
path=os.path.join(cwd,newdir)

#os.mkdir(path)
#os.makedirs(path)

print("")
os.chdir(newdir)
cwd=os.getcwd()
print(os.listdir(cwd))


#os.remove(path)
#os.rmdir(path)
#os.rename() 
#os.path.exists()