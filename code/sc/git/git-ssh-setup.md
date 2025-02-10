# Git SSH setup

```shell
ssh -T git@github.com
ls -al ~/.ssh
ssh-keygen -t ed25519 -C "email on github"
eval "$(ssh-agent -s)"
open ~/.ssh/config => doesn't exist?
```

```shell
touch ~/.ssh/config
open ~/.ssh/config
ssh-add --apple-use-keychain ~/.ssh/generated_key_from_previous_step
```

## SSH Toubleshooting

I've got an error "Support for password authentication was removed on August 13, 2021." means my remote git url to push changes are "https" and it must to change url schema as git@

```shell
git remote -v
origin  https://github.com/your-username/your-repository.git (fetch)
origin  https://github.com/your-username/your-repository.git (push)

git remote set-url origin git@github.com:your-username/your-repository.git
git remote -v

origin  git@github.com:your-username/your-repository.git (fetch)
origin  git@github.com:your-username/your-repository.git (push)

git push -u origin master
git push
```