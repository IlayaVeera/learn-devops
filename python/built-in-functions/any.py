# if any one value is true then retrn true

list =[1,2,3]
print(any(list))

list =[0,1,2,3]
print(any(list))
print('Any element is true?:',any(list))

list =[0, False]
print(any(list))
print('Any element is true?:',any(list))

list =[]
print(any(list))