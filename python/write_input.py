story=input("enter story:")

with open('storyfile.txt','a') as s:
    s.write("\n"+story)

with open('storyfile.txt','r') as s2:
    print(s2.read())

print(" ")
with open('storyfile.txt','r') as s2:
    file=s2.readlines()
    for line in file:
        print(line.strip())
    
print(" ")
file=open('storyfile.txt','r')
for line in file:
    print(line.strip())

print(" ")
with open('storyfile.txt','r') as file:
    for line in file:
        for word in line.split():
            if word=="new":
                print(word)

