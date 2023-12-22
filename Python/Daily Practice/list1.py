list1=[(1,2,3),(2,3,4),(6,7,8)]
for i in list1:
    for j in i:
        if j==2:
            print(j+10)
        else:
            print(j)