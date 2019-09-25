Tool Note
=======

universal-ctags
----------

```
sudo apt install software-properties-common
sudo add-apt-repository ppa:hnakamur/universal-ctags
sudo apt update
sudo apt install universal-ctags
```

[Ubuntu16.04安裝配置和使用ctags](https://www.itread01.com/content/1532971656.html)
[universal-ctagsのUbuntu 18.04 LTS用debパッケージをビルドした](https://hnakamur.github.io/blog/2018/06/08/build-universal-ctags-deb-for-ubuntu-18.04-lts/)

vimrc
----------

```
git clone https://philipkotw@bitbucket.org/philipkotw/tools.git

```

```
"先git clone vundle.vim
"git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
syntax on
set nu
set nocompatible              " 去除VI一致性,必須
filetype off                  " 必須

" 設置包括vundle和初始化相關的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 另一種選擇, 指定一個vundle安裝插件的路徑
"call vundle#begin('~/some/path/here')

" 讓vundle管理插件版本,必須
Plugin 'VundleVim/Vundle.vim'
" 你的所有插件需要在下面這行之前
"Plugin 'fatih/vim-go'
Plugin 'minibufexpl.vim'
Plugin 'taglist.vim'
"Plugin 'fatih/vim-go'

call vundle#end()            " 必須
filetype plugin indent on    " 必須 加載vim自帶和插件相應的語法和文件類型相關腳本
" 忽視插件改變縮進,可以使用以下替代:
"filetype plugin on
"
" 簡要幫助文檔
" :PluginList       - 列出所有已配置的插件
" :PluginInstall    - 安裝插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地緩存
" :PluginClean      - 清除未使用插件,需要確認; 追加 `!` 自動批准移除未使用插件
"
" 查閱 :h vundle 獲取更多細節和wiki以及FAQ
" 將你自己對非插件片段放在這行之後
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let Tlist_Use_Right_Window   = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_version_warning = 0
"let g:go_fmt_command = "goimports"
"colorscheme molokai
colorscheme torte
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }


```

ASCII art tools
----------

  * [ASCIIFLOW](http://asciiflow.com/)

  * [textart.io ](https://textart.io/sequence)

  * [activity-diagram](http://plantuml.com/zh/activity-diagram-beta )

  * [draw.io](https://www.draw.io)

Swagger
----------

  * [Swagger 就能夠產生出最新的 API 說明文件](https://medium.com/@kodofish/swagger-codegen-%E8%87%AA%E5%8B%95%E7%94%A2%E7%94%9F%E6%96%87%E4%BB%B6%E7%9A%84%E5%B7%A5%E5%85%B7-a01369046cce)
  * [Swagger一個終端和後臺開發對api介面管理工具](https://www.itread01.com/content/1548683464.html)

Cacti
----------

  * [MRTG再進化──多功能的Cacti](http://www.rl-tech.com.tw/zh-tw/article_info.php?id=44)

Minio
----------
  * [Minio 是一個基于 golang 語言開發的 AWS S3 存儲協議的開源實現，可以通過 Minio 搭建私人的兼容 AWS S3 協議的存儲服務器](https://www.itread01.com/articles/1474594578.html)


LibreNMS
----------
  * [開源網路裝置管理系統 - LibreNMS](http://blog.jason.tools/2017/06/librenms-networkmanager-good.html)

WEB tools
----------

  * [自己的行事曆和通訊錄自己管： nextcloud 安裝、 行事曆、 備份及手機連線](http://newtoypia.blogspot.com/2019/04/nextcloud.html#more)
  * [Adminator is a easy to use and well design admin dashboard template for web apps, websites, services](https://github.com/puikinsh/Adminator-admin-dashboard)
  * [Web based File Manager in single PHP file](https://tinyfilemanager.github.io/docs/)
  * [Insomnia 是近期出現的一個HTTP Client，它具備好看的圖形化介面、跨平台的特性](https://insomnia.rest/)
  * [使用 Docker 搭建你的Wiki](https://blog.csdn.net/weixin_33881050/article/details/87948518)
  * [開源網路儲存伺服器：FreeNAS (一)](https://ithelp.ithome.com.tw/m/articles/10219068)

Video tools
----------

  * [OpenShot 視訊編輯器](https://www.openshot.org/zh-hant/)
  * [Shotcut is a free, open source, cross-platform video editor](https://www.shotcut.org/)

Remote to linux desktop tools
----------
  * [Ubuntu 安裝可讓 Windows 遠端桌面登入的 xrdp](https://www.ichiayi.com/wiki/tech/ubuntu_xrdp)
  * [Windows 遠端桌面連線到 Ubuntu 16.04](http://honglung.pixnet.net/blog/post/167257893-windows-%E9%81%A0%E7%AB%AF%E6%A1%8C%E9%9D%A2%E9%80%A3%E7%B7%9A%E5%88%B0-ubuntu-16.04)
  * [How to setup an xRDP server on Ubuntu 18.04](https://medium.com/@vivekteega/how-to-setup-an-xrdp-server-on-ubuntu-18-04-89f7e205bd4e)
  * [Remmina is a remote desktop client written in GTK+, aiming to be useful for system administrators and travellers](https://remmina.org/)

System
----------

  * [SSHFS：透過 SSH 掛載遠端 Linux 伺服器上的硬碟（適用於 Windows、Mac OS X 與 Linux）](https://blog.gtwang.org/linux/sshfs-ssh-linux-windows-mac-os-x/)

