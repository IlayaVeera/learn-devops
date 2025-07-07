a=[1,2,3,4,5,6,7,8]

output=filter(lambda x: x%2==0, a)
print(list(output))

# with named fuct
def even(n):
    return n%2==0

output=filter(even, a)
print(list(output))


output=filter(lambda x: x%3==2, a)
print(list(output))