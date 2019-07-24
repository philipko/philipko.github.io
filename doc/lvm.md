LVM Note
=======

LVM
----------

System Block
----------

![](http://linux.vbird.org/linux_basic/0420quota/lvm.gif)


[邏輯捲軸管理員](https://zh.wikipedia.org/wiki/%E9%82%8F%E8%BC%AF%E6%8D%B2%E8%BB%B8%E7%AE%A1%E7%90%86%E5%93%A1)
[LVM2學習筆記](http://maxubuntu.blogspot.com/2010/05/lvm2.html)

增大 Ubuntu 18.04 上 root lvm volume
----------
步驟大概歸納以下幾點 :

  * 用fdisk新增一個partition
  * 建立新的PV(使用指令pvcreate)
  * 將PV加入到已存在的VG (使用指令vgextend)
  * 增加LV的大小(使用指令lvresize)
  * 確實的將檔案系統容量增加(使用指令resize2fs)

```
sudo hdparm -I /dev/your_device |grep GB
lsblk
cfdisk
sudo vgs
sudo lvs
sudo pvdisplay
sudo lvdisplay
sudo vgdisplay -v
sudo lvresize -L +5G --resizefs  /dev/ubuntu-vg/ubuntu-lv //chang root size
sudo resize2fs /dev/ubuntu-vg/ubuntu-lv

# df -h
Filesystem                         Size  Used Avail Use% Mounted on
udev                               1.7G     0  1.7G   0% /dev
tmpfs                              350M  984K  349M   1% /run
/dev/mapper/ubuntu--vg-ubuntu--lv  3.9G  1.9G  1.8G  52% /
tmpfs                              1.8G     0  1.8G   0% /dev/shm
tmpfs                              5.0M     0  5.0M   0% /run/lock
tmpfs                              1.8G     0  1.8G   0% /sys/fs/cgroup
/dev/loop0                          91M   91M     0 100% /snap/core/6350
/dev/sda2                          976M   76M  834M   9% /boot
/dev/loop1                          89M   89M     0 100% /snap/core/7270
tmpfs                              350M     0  350M   0% /run/user/1000

# lvresize -L +5G --resizefs  /dev/ubuntu-vg/ubuntu-lv
  Size of logical volume ubuntu-vg/ubuntu-lv changed from 4.00 GiB (1024 extents) to 9.00 GiB (2304 extents).
  Logical volume ubuntu-vg/ubuntu-lv successfully resized.
resize2fs 1.44.1 (24-Mar-2018)
Filesystem at /dev/mapper/ubuntu--vg-ubuntu--lv is mounted on /; on-line resizing required
old_desc_blocks = 1, new_desc_blocks = 2
The filesystem on /dev/mapper/ubuntu--vg-ubuntu--lv is now 2359296 (4k) blocks long.

# resize2fs /dev/ubuntu-vg/ubuntu-lv
resize2fs 1.44.1 (24-Mar-2018)
The filesystem is already 2359296 (4k) blocks long.  Nothing to do!

# df -h
Filesystem                         Size  Used Avail Use% Mounted on
udev                               1.7G     0  1.7G   0% /dev
tmpfs                              350M  984K  349M   1% /run
/dev/mapper/ubuntu--vg-ubuntu--lv  8.8G  1.9G  6.5G  23% /
tmpfs                              1.8G     0  1.8G   0% /dev/shm
tmpfs                              5.0M     0  5.0M   0% /run/lock
tmpfs                              1.8G     0  1.8G   0% /sys/fs/cgroup
/dev/loop0                          91M   91M     0 100% /snap/core/6350
/dev/sda2                          976M   76M  834M   9% /boot
/dev/loop1                          89M   89M     0 100% /snap/core/7270
tmpfs                              350M     0  350M   0% /run/user/1000



```

[LVM-LV的容量增減設定(上)](https://ithelp.ithome.com.tw/articles/10081243)
[LVM-LV的容量增減設定(下)](https://ithelp.ithome.com.tw/articles/10081251)
[增大 Ubuntu 18.04 上 root lvm volume](https://blog.moa.tw/2018/12/ubuntu-1804-root-lvm-volume.html)
[增加 VirtualBox 虛擬硬碟大小（使用 GParted 調整分割區）](https://blog.gtwang.org/virtualization/resize-virtualbox-disk-image-manipulate-vdi/)
[Increase partition size on which Ubuntu is installed?](https://askubuntu.com/questions/116351/increase-partition-size-on-which-ubuntu-is-installed)
[SD SIZE 錯誤問題(GPT PMBR size mismatch 錯誤 故先修正錯誤再更改空間)](https://b8807053.pixnet.net/blog/post/348558754-sd-size-%E9%8C%AF%E8%AA%A4%E5%95%8F%E9%A1%8C)
[使用LVM來擴充現有磁碟空間](https://blog.xuite.net/a851401/blog/54020537-%E4%BD%BF%E7%94%A8LVM%E4%BE%86%E6%93%B4%E5%85%85%E7%8F%BE%E6%9C%89%E7%A3%81%E7%A2%9F%E7%A9%BA%E9%96%93+Extends+existing+LV+using+LVM+)
[Use LVM To Manage Storage Devices on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-use-lvm-to-manage-storage-devices-on-ubuntu-18-04#displaying-information-about-physical-volumes,-volume-groups,-and-logical-volumes)


LVM Commands
----------
```
lsblk
sudo lvmdiskscan
sudo lvmdiskscan -l
sudo pvscan
sudo pvs
sudo pvdisplay
sudo pvdisplay -m
sudo vgscan
sudo vgs -o +devices,lv_path
sudo vgdisplay -v
sudo lvresize -L +5G --resizefs LVMVolGroup/test
sudo lvresize -A n -l +100%FREE /dev/ubuntu-vg/ubuntu-lv //chang root size
```


[How To Use LVM To Manage Storage Devices on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-use-lvm-to-manage-storage-devices-on-ubuntu-18-04)
[鳥哥的LVM](http://linux.vbird.org/linux_basic/0420quota.php#lvm)
[Ubuntu LVM 分割槽實戰](https://www.itread01.com/content/1549130614.html)
[Linux LVM (建立、擴充、移除LVM磁區) 操作筆記](https://sc8log.blogspot.com/2017/03/linux-lvm-lvm.html)
[LVM2學習筆記](http://maxubuntu.blogspot.com/2010/05/lvm2.html)
