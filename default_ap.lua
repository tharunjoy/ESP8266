wifi.setmode(wifi.SOFTAP)
--set ap ssid and pwd
cfg={}
cfg.ssid="ESP8266"
cfg.pwd="12345678"
wifi.ap.config(cfg)

    -- cfg={}
    -- cfg.ip="192.168.1.4";
    -- cfg.netmask="255.255.255.0";
    -- cfg.gateway="192.168.1.4";
    -- wifi.ap.setip(cfg);

print(wifi.ap.getip())

--  http server
srv=net.createServer(net.TCP)
srv:listen(80,function(conn)
    conn:on("receive",function(conn,payload)
        print(payload)
        conn:send("<h1> Hello, NodeMcu.</h1>")
        setstate="..."
        k=string.find(payload,"ssid")
        if k then
            str=string.sub(payload,k)
            print(str)
            m=string.find(str,"&")
            --print(m)
            strssid='ssid='..'"'..string.sub(str,6,(m-1))..'"'
            print(strssid)
            strpass='password="'..string.sub(str,(m+10))..'"'
            print(strpass)
            

            
            file.open("password.txt","w+")
            file.writeline(strssid)
            file.writeline(strpass)
            file.close()

            setstate="OK"
            print("store ok")
          -- file.open("password.txt","r")
            --print(file.readline())
           --print(file.readline())
           --file.close()

            a=1
            
            b=1
            file.open("counter.txt","w")
            file.writeline(b)
            file.close() 
            
            file.open("counter.txt","r")
            print(file.readline(b))
            file.close() 
            
            file.close()
            if(a==1) then
            node.restart()
            end
        end

        -- html-output
        conn:send("HTTP/1.0 200 OK\r\nContent-type: text/html\r\nServer: ESP8266\r\n\n")
        conn:send("<html><head></head><body>")
        conn:send("Served from ESP8266-".. node.chipid().." - NODE.HEAP: ".. node.heap().." ")

        conn:send("<font color=\"red\">")
        conn:send("<h1> connect your router "..setstate.."</h1></font>")   --"..setstate.."
        conn:send("<FORM action=\"\" method=\"POST\">")
        conn:send("SSID:<input type=\"test\" name=\"ssid\">")
        conn:send("<br></br>")
        conn:send("Password<input type=\"text\" name=\"password\">")
        conn:send("<br></br>")
        conn:send("<input type=\"submit\" value=\"Submit\">")
        conn:send("</form>")
        conn:send("</body>")
        conn:send("</html>")

    end)
end)
