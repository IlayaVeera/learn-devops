word="new line"

with open('storyfile.txt','r') as s2:
    if word in s2:
        print(word)