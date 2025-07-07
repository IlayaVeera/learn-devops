
import os

foldernames= input('Type folder name :').split()
print('')
print (foldernames)
print('')
for foldername in foldernames:

    try:
        files=os.listdir(foldername)
    except FileNotFoundError:
        print('')
        print('Given folder '+foldername+' is not found')
        print('')
        continue

    print('')
    print ('########### list of files under folder: '+foldername+' ###########')
    print('')

    for file in files:
        print(file)