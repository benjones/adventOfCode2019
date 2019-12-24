import numpy as np
import scipy.sparse as sps
from numpy.linalg import matrix_power

inp = '59704176224151213770484189932636989396016853707543672704688031159981571127975101449262562108536062222616286393177775420275833561490214618092338108958319534766917790598728831388012618201701341130599267905059417956666371111749252733037090364984971914108277005170417001289652084308389839318318592713462923155468396822247189750655575623017333088246364350280299985979331660143758996484413769438651303748536351772868104792161361952505811489060546839032499706132682563962136170941039904873411038529684473891392104152677551989278815089949043159200373061921992851799948057507078358356630228490883482290389217471790233756775862302710944760078623023456856105493'*10000
#inp = '80871224585914546619083218645595'

inpvec = np.array([ int(x) for x in inp])
inpvec = np.reshape(inpvec, (inpvec.shape[0], 1))
N = inpvec.shape[0];
print(inpvec.shape)
print(N)

offset = int(inp[:7])

mat = sps.lil_matrix((N,N), dtype='int')

for r in range(N):
    start = r
    while(start < N):
        for add in range(r + 1):
            if start + add < N:
                mat[r, start + add] = 1
            if start + 2*(r+1) + add < N:
                mat[r, start + 2*(r+1) + add] = -1
        start += 4*(r +1)

print("filled in mat")
mat = mat.tocsr()
print("mat is now CSR")


x = inpvec
for i in range(100):
    x = mat*x
    for j in range(x.shape[0]):
        x[j,0] = abs(x[j,0]) % 10
    print("finished iter ", i)


'''
print(mat.shape)
mat100 = mat ** 100
print(mat100.shape)
ans = mat100*inpvec
print(ans.shape)

ansd = ans[0:8, 0]
print(ansd)'''



ret = ""
for i in range(8):
    ret = ret + str(x[offset + i,0])

print(ret)


