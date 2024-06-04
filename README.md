## Develop

Run this to apply changes

```sh
darwin-rebuild switch --flake ".#aarch64"
```

## Configure secrets

You can add secrets to `./config/zsh/.secret.zsh` however be aware that you should not commit secrets to a public repo and flake is git aware so you'll need to do some trickery.

This is what I did:

1. `git add --intent-to-add ./config/zsh/.secret.zsh`
2. `git update-index --assume-unchanged ./config/zsh/.secret.zsh`
