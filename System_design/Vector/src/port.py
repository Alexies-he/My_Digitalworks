for item in range(1,5):
    print('mul_addtree U%d(.x(a%d),.y(b%d),.out(mulout%d));'%(item,item,item,item))
for item in range(1,5):
    print("assign out%d = y[%d]?{%d'b0,y[3:0],%d'b0}:8'b0;"%(item,4-item,item,4-item))
