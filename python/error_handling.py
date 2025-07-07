try:
    values=input("Enter values:").split()
    for value in values:
        value=int(value)
        print(value/2)
        
except ValueError:
        print("invalid value")

finally:
     print("This is value test")