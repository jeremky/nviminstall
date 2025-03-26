# nviminstall

Ce script permet l'installation de NeoVim dans sa dernière version sur un système Debian et dérivé. Il est compatible x64 et arm64.

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

Certains plugins fournis par défaut par LazyVim sont désactivés dans la configuration associée au script. Si vous souhaitez les réactiver, supprimez les lignes correspondantes dans le fichier suivant :

```txt
~/.config/nvim/lua/plugins/disabled.lua
```
