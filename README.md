# ESP8266
# Change default ssid and password to custom ssid and password using a mobile in first connect

firmware used: NodeMCU
module:esp-2e

this file contain 3 file
init.lua, 
default_ap.lua,
new_ap.lua

init.lua file checks the counter.txt file and redirect the to the AccessPoint access

On first ON, esp8266 will be in defalut mode
ssid: ESP8266 
password: 12345678

After connecting the mobile to this ssid open a browser, goto 192.168.1.4

you will be open to a page to enter new ssid and password
After entering new ssid and password and finally the submit button the esp8266 will restart broadcasing with the new ssid

Ater connecting to the new ssid with new password and when you goto the IP 192.168.1.4
you will find a message 'You are on your new ssid and password'
