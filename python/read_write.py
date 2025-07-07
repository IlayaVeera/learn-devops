with open("storyfile.txt","r") as input:
    with open("outputfile.txt","a") as output:
        for line in input:
            output.write(line)

input=open("storyfile.txt","r")
with open("outputfile.txt","a") as output:
    output.write(input.read())

