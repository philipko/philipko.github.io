Command Note
=======

ubuntu 14.04防火牆
----------

```
sudo ufw enable // 啟動防火牆，reboot還是存在直到關閉。
sudo ufw disable // 停用防火牆，reboot還是存在直到再度開啟。

sudo ufw default allow // 接收所以連線
sudo ufw default deny // 關閉所有連線

sudo ufw allow ssh  // 使用服務名稱來允許連入，服務名稱請參考 /etc/services 檔案 
sudo ufw allow  in 8080  // 指定 Port 號來允許連入 
sudo ufw deny out 4662  // 指定 Port 號來拒絕連出到別台電腦的指定 Port 號 
sudo ufw deny in 4662/udp  // 指定 Port 號來拒絕接受指定 Port 號的 UDP 連入要求

sudo ufw status numbered //查詢規則代碼
sudo ufw delete [規則代碼]

sudo ufw logging on 啟動工作日誌

sudo ufw status //檢視規則狀態
sudo ufw status verbose  //檢視規則狀態

```

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
