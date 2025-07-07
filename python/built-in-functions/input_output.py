

#getting input
name=input("enter your name:")
print("my name is "+name)
print(f"my name is {name}")

#convert input to int
age=int(input("enter your age:"))
print(f"my age is {age}")
print(f"after 10 years my age is {age+10}")

#getting multiple input
day,mon,year=input("enter day, mon and year of the birth:").split()
print("DOB", end=":")
print(day, mon, year,sep="/")

daysoftheweek=input("enter the days of the week separated by space:").split()
print(daysoftheweek)

monoftheyear=input("enter the mon of the year separated by comma:").split(",")
print(monoftheyear)

