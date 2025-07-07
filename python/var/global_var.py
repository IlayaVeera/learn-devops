a="hello" 
b="world"

def f():
 #   global b   #overtiting global var 
    b="new world"

    print(a)
    print(b)

f()
print(b)