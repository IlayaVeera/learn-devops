import pandas
import json

file=open("sample.json",'r')

output=json.load(file)

jsonfile=output['emp_details']

data=pandas.DataFrame(jsonfile)

data.to_csv("csvfile.csv")
print("")
print(data)

#filter data
profile=data[data['job_profile']=='intern']
print("")
print(profile)