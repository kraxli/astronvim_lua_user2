# AstroNvim User Configuration

My personal user config for AstroVim

## Installation

- Install AstroNvim

```sh
git clone https://github.com/AstroNvim/AstroNvim.git ~/.config/nvim
```

- Install these user settings

```sh
git clone https://github.com/kraxli/astronvim_lua_user ~/.config/nvim/lua/user
```

- Initialize AstroVim

```sh
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
```

# Merge updates of mehalter

## Set-up

cd ~/.config/astronvim/lua/user
git remote add mehalter https://code.mehalter.com/AstroNvim_user

## Update

rm ~/.config/astronvim_sandbox -rf
cp ~/.config/astronvim ~/.config/astronvim_sandbox -r
cd ~/.config/astronvim_sandbox

git fetch mehalter --tags
git merge --allow-unrelated-histories mehalter/master
