str=" Hi hello this is my first line. This line is about to check the number of word count and number of frequency. This line is about to check the number of word count and number of frequency."

lines=str.split()
print(lines)
word_lenth=len(lines)
print(word_lenth)
count=0
for word in lines:
    if word=="of":
        count=count+1
print(count)
c_This=0
for word in lines:
    if word=="This":
        c_This=c_This+1
print(c_This)