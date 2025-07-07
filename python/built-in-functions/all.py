# if any one value is false then retrn false else true

#list
list= [1,2,3]
print (all(list))

list= [0,1,2,3]
print (all(list))

list= []
print (all(list))



#string

s="Hello world"
print (all(s))

s="00"
print (all(s))

s=""
print (all(s))



# dictionary 
d = {1: "Hello", 2: "Hi"}
print(all(d))