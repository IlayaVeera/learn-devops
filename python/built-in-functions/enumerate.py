#enumerate() function adds a counter to each item in a list 

list=['hi', 'hello', 'world']


for index, i in enumerate(list,start=1):
    print (index, i)

for index, i in enumerate(list):
    print (index, i)