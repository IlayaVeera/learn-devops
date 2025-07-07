import fileinput
 
with fileinput.input(files=('text.txt','course.txt')) as f:
    for line in f:
        print(line)