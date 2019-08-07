Tool Note
=======



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


LibreNMS
----------
  * [開源網路裝置管理系統 - LibreNMS](http://blog.jason.tools/2017/06/librenms-networkmanager-good.html)

WEB tools
----------

  * [Adminator is a easy to use and well design admin dashboard template for web apps, websites, services](https://github.com/puikinsh/Adminator-admin-dashboard)
  * [Web based File Manager in single PHP file](https://tinyfilemanager.github.io/docs/)

Video tools
----------

  * [OpenShot 視訊編輯器](https://www.openshot.org/zh-hant/)
