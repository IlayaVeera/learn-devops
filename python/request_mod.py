import requests
requests=requests.get("https://api.github.com/repos/python/typeshed/pulls")
repo_data=requests.json()
for i in range(len(repo_data)):
    username=repo_data[i]["user"]["login"]
 #   print(username)
    autherinfo=repo_data[i]["author_association"]
 #   print(autherinfo)
    print(username +":"+ autherinfo)