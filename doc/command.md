Command Note
=======

ubuntu 14.04防火牆
----------

```
sudo ufw enable // 啟動防火牆，reboot還是存在直到關閉。
sudo ufw disable // 停用防火牆，reboot還是存在直到再度開啟。

sudo ufw default allow // 接收所以連線
sudo ufw default deny // 關閉所有連線

// 默認情況下，UFW設置為拒絕所有傳入連接並允許所有傳出連接
sudo ufw default deny incoming  
sudo ufw default allow outgoing  

sudo ufw allow ssh  // 使用服務名稱來允許連入，服務名稱請參考 /etc/services 檔案 
sudo ufw allow  in 8080  // 指定 Port 號來允許連入 

sudo ufw allow 80 // 允許 80
sudo ufw allow 443 // 允許 443
sudo ufw deny 3389 // 封鎖 3389
sudo ufw deny 21 // 封鎖 21

sudo ufw allow 6000:6007/tcp // 允許 TCP 6000~6007
sudo ufw allow 6000:6007/udp // 允許 UDP 6000~6007

sudo ufw allow from 192.168.11.10 # 允許 192.168.11.10 的所有連線
sudo ufw allow from 192.168.11.0/24 # 允許 192.168.11.1~192.168.11.255 的所有連線
sudo ufw deny from 192.168.11.4 # 封鎖 192.168.11.4 的所有連線

sudo ufw allow from 127.0.0.1 to 127.0.0.1 port 80 proto tcp // Allow port 80 to localhost but only from localhost
sudo ufw allow from 127.0.0.1 to 127.0.0.1 port 11211 proto tcp
sudo ufw allow from 192.168.5.123 to 127.0.0.1 port 11211 proto tcp


sudo ufw allow from 203.0.113.0/24 // 想允許所有的IP地址範圍從203.0.113.1到203.0.113.254
sudo ufw allow from 203.0.113.0/24 to any port 22 // 203.0.113.0/24允許子網連接的用端口22（SSH）


sudo ufw deny out 4662  // 指定 Port 號來拒絕連出到別台電腦的指定 Port 號 
sudo ufw deny in 4662/udp  // 指定 Port 號來拒絕接受指定 Port 號的 UDP 連入要求

sudo ufw status numbered //查詢規則代碼
sudo ufw delete [規則代碼]

sudo ufw logging on 啟動工作日誌

sudo ufw status //檢視規則狀態
sudo ufw status verbose  //檢視規則狀態





```

[如何在Debian 9上使用UFW設置防火牆](https://jujula.org/zh-hant/node/26)
[ufw：簡易防火牆設置](https://noob.tw/ufw/)


防火牆 確認可行無問題的
----------

```
sudo ufw enable // 啟動防火牆，reboot還是存在直到關閉。
sudo ufw allow ssh  // 使用服務名稱來允許連入，服務名稱請參考 /etc/services 檔案 
sudo ufw status
// 默認情況下，UFW設置為拒絕所有傳入連接並允許所有傳出連接
sudo ufw default deny incoming  
sudo ufw default allow outgoing  




~$ sudo ufw status
Status: active

To                         Action      From
--                         ------      ----
22/tcp                     ALLOW       Anywhere
22/tcp (v6)                ALLOW       Anywhere (v6)




lsof
----------

```
# 列出所有網路連線
lsof -i

# 列出所有 TCP 網路連線
lsof -i tcp

# 列出所有 UDP 網路連線
lsof -i udp

# 列出 80 連接埠的網路連線
lsof -i :80

# 列出 SMTP 的網路連線
lsof -i :smtp

# 列出 3642 連接埠的 TCP 連線
lsof -i tcp:3642

# 列出 1 到 1024 連接埠的 TCP 網路連線
lsof -i :1-1024

# 列出所有處於 LISTEN 狀態的 TCP 網路連線
lsof -i TCP -s TCP:LISTEN

# 列出已建立的 TCP 網路連線
lsof -i TCP -s TCP:ESTABLISHED

```

[Linux 列出行程開啟的檔案，lsof 指令用法教學與範例](https://blog.gtwang.org/linux/linux-lsof-command-list-open-files-tutorial-examples/)


Generating a new SSH key
----------

```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```
[Connecting to GitHub with SSH](https://help.github.com/en/articles/connecting-to-github-with-ssh)
