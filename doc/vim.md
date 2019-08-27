VIM Note
=======

Vim 搜尋關鍵字、刪除符合條件的列
----------

```
/中油

#找出關鍵字所在的位置之外，還想把這些含有關鍵字的列都一並刪除
:g/中油/d

```

[Vim 搜尋關鍵字、刪除符合條件的列](https://blog.gtwang.org/linux/vim-delete-all-lines-containing-a-pattern-tutorial/)


delete between parentheses in vi/vim
----------

```

d%


With your cursor on the first opening bracket ([), press V, followed by %. This will select the block which you then can join J, followed by di[.


```


[Delete everything between two brackets in Vim, including newlines](https://stackoverflow.com/questions/40209074/delete-everything-between-two-brackets-in-vim-including-newlines/40209145)
[Can you grab or delete between parentheses in vi/vim?](https://stackoverflow.com/questions/405415/can-you-grab-or-delete-between-parentheses-in-vi-vim)
