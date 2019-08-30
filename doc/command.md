Command Note
=======

crontab
----------


```
在ubuntu下安装crontab后，系统默认的是不开启crontab的日志记录，如何开始crontab的日志
修改rsyslog文件，将/etc/rsyslog.d/50-default.conf 文件中的#cron.*前的#删掉
重启rsyslog服务service rsyslog restart；
重启cron服务service cron restart；

如果在日志文件中出现：No MTA installed, discarding output
那么就是说，crontab执行脚本时是不会直接错误的信息输出，而是会以邮件的形式发送到你的邮箱里

在每条定时脚本后面加入:
>/dev/null 2>&1


```

[UBUNTU开启CRONTAB日志记录及解决NO MTA INSTALLED, DISCARDING OUTPUT问题](https://blog.csdn.net/disappearedgod/article/details/43191693)


curl 
----------

```
curl 
-X/--request [GET|POST|PUT|DELETE|PATCH]  使用指定的 http method 來發出 http request
-H/--header                           設定 request 裡所攜帶的 header
-i/--include                          在 output 顯示 response 的 header
-d/--data                             攜帶 HTTP POST Data 
-v/--verbose                          輸出更多的訊息方便 debug
-u/--user                             攜帶使用者帳號、密碼
-b/--cookie                           攜帶 cookie（可以是參數或是檔案位置）

#use post upload file (obama2.jpg)
curl -XPOST -F "file=@obama2.jpg" http://127.0.0.1:5001


curl -X PUT -H "Content-Type: application/json" -d '{"status" : false }' "http://www.example.com/api/resources"

#POST JSON 資料
curl -X POST -H "Content-Type: application/json" -d '{"status" : false, "name" : "Jack"}' "http://www.example.com/api/resources"


#cookie
curl --cookie "name=Jack" http://www.example.com

```

[Linux Curl Command 指令與基本操作入門教學](https://blog.techbridge.cc/2019/02/01/linux-curl-command-tutorial/)

find 
----------

```
find
-mtime 搜尋檔案的修改時間(天)
-mmin 搜尋檔案的修改時間(分鐘)
-ctime 搜尋檔案的建立時間(天)
-cmin 搜尋檔案的建立時間(分鐘)
-atime 搜尋檔案的最後開啟時間(天)
-amin 搜尋檔案的最後開啟時間(分鐘)

ex:

find ./ -mtime 3 # 在當前目錄下搜尋3天時修改的檔案
find ./ -mtime +3 # 在當前目錄下搜尋3天前修改的檔案
find ./ -mtime -3 # 在當前目錄下搜尋3天內修改的檔案

```

[Linux 使用 find 找出限定修改時間內的檔案](https://blog.longwin.com.tw/2017/08/linux-find-limit-date-time-file-2017/)


rsync
----------




rsync 遠端備份

```
本地端的 myfile.gz 備份至 pi@192.168.1.12 的 /mybackup/ 目錄中
rsync -avzh /mypath/myfile.gz pi@192.168.1.12:/mybackup/

rsync 也可以將遠端的檔案備份至本地端
rsync -avzh pi@192.168.1.12:/mypath/myfile.gz /mybackup/

```

pass password automatically for rsync SSH command

```
sudo apt-get install sshpass
/usr/bin/rsync -ratlz --rsh="/usr/bin/sshpass -p password ssh -o StrictHostKeyChecking=no -l username" src_path  dest_path

sshpass -p "password" rsync -ae "ssh -p remote_port_ssh" /local_dir  remote_user@remote_host:/remote_dirk

```

自訂 SSH 連接埠

```
假設 192.168.1.12 這台伺服器的 ssh 服務連接埠號碼為 12345，以下是透過 rsync 將資料備份資料的範例
rsync -avzh -e 'ssh -p 12345' /mypath/myfile.gz pi@192.168.1.12:/mybackup/
```




[Linux 使用 rsync 遠端檔案同步與備份工具教學與範例](https://blog.gtwang.org/linux/rsync-local-remote-file-synchronization-commands/)
[以 rsync 進行遠端同步備份](http://www.vixual.net/blog/archives/186)
[How to pass password automatically for rsync SSH command?](https://stackoverflow.com/questions/3299951/how-to-pass-password-automatically-for-rsync-ssh-command)





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


Generating a new SSH key
----------

```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```
[Connecting to GitHub with SSH](https://help.github.com/en/articles/connecting-to-github-with-ssh)


system 
----------
sudo systemd-analyze blame

How to know update package after system reboot 
----------

Should I always restart the system when I see “System restart required”

```
more /var/run/reboot-required.pkgs

```
[Should I always restart the system when I see “System restart required”](https://askubuntu.com/questions/258297/should-i-always-restart-the-system-when-i-see-system-restart-required)

How to disable system update
----------

disable updates from command line in Ubuntu 16.04

Edit /etc/apt/apt.conf.d/20auto-upgrades to disable automatic updates from the command line
Once you have the file opened, switch off the Update-Package-Lists directive from 1 to 0 as shown below:

```
APT::Periodic::Update-Package-Lists "0";
APT::Periodic::Unattended-Upgrade "1";

```

[disable updates from command line in Ubuntu 16.04](https://askubuntu.com/questions/1059971/disable-updates-from-command-line-in-ubuntu-16-04)


find remove obsolete ppa repositories ubuntu.
----------


```

sudo apt-get update | grep "Failed"
sudo add-apt-repository --remove ppa:finalterm/daily 


sudo add-apt-repository -r ppa:beineri/opt-qt57-xenial
sudo add-apt-repository -r ppa:beineri/opt-qt57-trusty

```

[How to find and remove obsolete PPA repositories on Ubuntu](http://ask.xmodulo.com/find-remove-obsolete-ppa-repositories-ubuntu.html)
[How can I fix a 403 Forbidden Error when using a PPA or updating my package lists? [duplicate]](http://askubuntu.com/questions/1018341/how-can-i-fix-a-403-forbidden-error-when-using-a-ppa-or-updating-my-package-lis)



How to apt-delete-repository? [duplicate]
----------

```
To remove a repository, you have to do 2 things:

Remove it from sources.list.

If it was added by add-apt-repository then you will find it in its own file in /etc/apt/sources.list.d, not in the main sources.list.

sudo rm /etc/apt/sources.list.d/nemh-systemback-precise.list
Optional: Stop trusting the key

Use apt-key list to list trusted keys. Look for an entry like "Launchpad PPA for Kendek" in this case. Then use apt-key del to delete it:

sudo apt-key del 73C62A1B
```

[How to apt-delete-repository](https://unix.stackexchange.com/questions/219341/how-to-apt-delete-repository)


