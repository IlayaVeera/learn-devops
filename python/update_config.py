
def update_config(filepath, key, value):
    with open(filepath,"r") as file:
        lines=file.readlines()
    with open(filepath,"w") as file:
        for line in lines:
            if key in line:
                file.write(key+'='+value+"\n")
            else:
                file.write(line)

key= input('Enter proprty name :')
Value= input('Enter value :')

update_config('server.conf',key,Value)