Git Note
=======

commands
----------

```
git config --global user.name <你的Repo.上傳顯示名稱>
git config --global user.email <你的Repo.上傳顯示email名稱>
git config --global core.editor "vim"

```


git branch graphs
----------

```
git log --all --decorate --oneline --graph
```


[Pretty git branch graphs](https://stackoverflow.com/questions/1057564/pretty-git-branch-graphs)



make Git use the editor of my choice for commits?
----------

```
git config --global core.editor "vim"
```

[How do I make Git use the editor of my choice for commits?](https://stackoverflow.com/questions/2596805/how-do-i-make-git-use-the-editor-of-my-choice-for-commits)


Please, oh please, use git pull --rebase
----------

```
git pull --rebase

```

[Able to push to all git remotes with the one command?](https://coderwall.com/p/7aymfa/please-oh-please-use-git-pull-rebase)


commands
----------

```

git cherry-pick 6a498ec --no-commit
git reset HEAD -- <file>   //remove a single file from the staging area
git reset HEAD -- <directoryName> //remove a whole directory (folder) from the staging area

```



Able to push to all git remotes with the one command?
----------

This can be added to your .bashrc or .bash_profile.

```
function GitPush {
  REMOTES=$@

  # If no remotes were passed in, push to all remotes.
  if [[ -z "$REMOTES" ]]; then
    REM=`git remote`

    # Break the remotes into an array
    REMOTES=$(echo $REM | tr " " "\n")
  fi

  # Iterate through the array, pushing to each remote
  for R in $REMOTES; do
    echo "Pushing to $R..."
    git push $R
  done
}
```
Example: Let's say your repo has 3 remotes: rem1, rem2 and rem3.

```
# Pushes to rem1
GitPush rem1

# Pushes to rem1 and rem2
GitPush rem1 rem2

# Pushes to rem1, rem2 and rem3
GitPush
```



```
# git remote add all origin-host:path/proj.git
# git remote set-url --add all nodester-host:path/proj.git
# git remote set-url --add all duostack-host:path/proj.git

The same git push all --all works here as well.
```

[Able to push to all git remotes with the one command](https://stackoverflow.com/questions/5785549/able-to-push-to-all-git-remotes-with-the-one-command)


git rm welcome.html --cached
----------

不管是系統的 rm 或是 git rm 指令，都會真的把這個檔案從工作目錄裡刪掉，
但如果只是「我不是真的想把這個檔案刪掉，只是不想讓這個檔案再被 Git 控管了」的話，可以加上 --cached 參數：
welcome.html 的狀態從原本已經在 Git 目錄裡的 tracked 變成 Untracked 了。

[如何在 Git 裡刪除檔案或變更檔名？](https://gitbook.tw/chapters/using-git/rename-and-delete-file.html)



好用連結
----------
[Git 初學筆記 - 指令操作教學](https://blog.longwin.com.tw/2009/05/git-learn-initial-command-2009/)
