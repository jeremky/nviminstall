# nviminstall

Ce script permet l'installation de [Neovim](https://neovim.io/) dans sa dernière version sur un système Debian et dérivé. Il est compatible x64 et arm64.

Il va également procéder à l'installation de LazyVim, ainsi que les dépendances suivantes : 

- curl
- fd-find
- git
- nodejs
- npm
- ripgrep

## Installation

```bash
git clone https://github.com/jeremky/nviminstall
cd nviminstall
./nviminstall.sh
```

## Configuration

Certains plugins par défaut de LazyVim sont désactivés par la configuration fournie. Pour les réactiver, éditez le fichier suivant :

```bash
nvim ~/.config/nvim/lua/plugins/disabled.lua
```
