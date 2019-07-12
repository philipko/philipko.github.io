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
