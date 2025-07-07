import json

file=open("sample.json",'r')

output=json.load(file)

print(output['emp_details'])

print("")
for i in output['emp_details']:
    print(i)

print("")

print(output['emp_details'][0])

print("")
for i in range(len(output['emp_details'])):
#    print(output['emp_details'][i]['emp_name'])
    print(output['emp_details'][i]['emp_name']+"-"+output['emp_details'][i]['job_profile'])

