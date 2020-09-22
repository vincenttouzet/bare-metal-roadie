# Git

This roles installs the git tool and configure some git options:

```ini
[core]
autocrlf = True
pager = less

[color]
diff = auto
status = auto
branch = auto

[alias]
ci = commit
co = checkout
st = status
br = branch
spull = git stash && git pull && git stash pop
oops = commit --amend --no-edit
lg = log --graph --date=relative --pretty=tformat:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%an %ad)%Creset'

[pull]
rebase = preserve

[push]
default = upstream

[tag]
sort = version:refname
```
