--local b=nil
file.open("counter.txt",'r')
b=file.readline()
b=tonumber(b)
print(b)
file.close()
print(b)
if(b==0) then
    dofile("def.lua")
else
    dofile("ap.lua")
end