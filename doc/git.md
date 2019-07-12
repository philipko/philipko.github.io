Git Note
=======

git branch graphs
----------

```
git log --all --decorate --oneline --graph
```


[Pretty git branch graphs](https://stackoverflow.com/questions/1057564/pretty-git-branch-graphs)



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


