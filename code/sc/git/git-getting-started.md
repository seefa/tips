# Git project initial

## Setup a project and first commit

```shell
git init
git remote add origin git@github.com:your-username/your-repository.git
git remote -v
git add .
git commit -m "Initial commit"
git push -u origin master
git push
```

## Git SSH checking

```shell
ssh -T git@github.com
```

## Create branch

```shell
git branch -M main
git push -u origin main
```

## Checking staged and unstaged changes

```shell
git status
git diff
git diff --staged
git diff --cached
git rm PROJECTS.md
git mv file_from file_to
```

