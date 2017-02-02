wifi.setmode(wifi.SOFTAP)
print("Connecting to NEW AP...")

file.open("password.txt",'r')
 
x=(file.readline())
c=(file.readline())
l=string.len (x)
n=string.len (c)
print(l)
print(n)

ssid = string.format("%s",string.sub(x,7,(l-2)))
password =string.format("%s",string.sub(c,11,(n-2)))



cfg={}
cfg.ssid=ssid;
cfg.pwd=password;
wifi.ap.config(cfg)
print("ESP8266 SSID is: " .. ssid .. " and PASSWORD is: " .. password)
print(wifi.ap.getip())
   --  cfg={}
   --  cfg.ip="192.168.4.1";
   --  cfg.netmask="255.255.255.0";
    -- cfg.gateway="192.168.4.1";
   --  wifi.ap.setip(cfg);


print("ESP8266 SSID is: " .. ssid .. " and PASSWORD is: " .. password)
ap_mac = wifi.ap.getmac()

sv=net.createServer(net.TCP,30)
sv:listen(80,function(c)
c:on("receive", function(c, pl)
print(pl)
print(string.len(pl))

c:send("<!DOCTYPE html> ")
c:send('<html lang="en">')
c:send("<body> ")
c:send("<h1>SSID AND PASSWORD CHANGED</h1> ")
c:send("<h3>You are on your new ssid and password</h3> ")
c:send("</body> </html>")
end)
end)
