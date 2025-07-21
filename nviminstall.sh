#!/bin/bash -e

# Vérification de l'architecture
if [[ "$(uname -m)" = "aarch64" ]]; then
  arch=arm64
else
  arch=x86_64
fi

# Messages en couleur
error()    { echo -e "\033[0;31m====> $*\033[0m" ;}
message()  { echo -e "\033[0;32m====> $*\033[0m" ;}
warning()  { echo ; echo -e "\033[0;33m====> $*\033[0m" ;}

# Vérification du système
if [[ ! -f /usr/bin/sudo && ! -f /usr/bin/apt ]]; then
  error "Système non compatible"
  exit 1
fi

# Installation des dépendances
if [[ -z "$(grep "~/.local/nvim" $HOME/.bashrc)" ]]; then
  warning "Installation des dépendances..."
  sudo apt -y install curl fd-find gcc git ripgrep xclip
  echo 'export PATH="$PATH:'~/.local'/nvim/bin"' >> $HOME/.bashrc
  message "Dépendances installées"
fi

# Téléchargement et installation
mkdir -p ~/.local
warning "Téléchargement de Neovim..."
curl -LOs https://github.com/neovim/neovim/releases/latest/download/nvim-linux-$arch.tar.gz
if [[ -f nvim-linux-$arch.tar.gz ]]; then
  rm -fr ~/.local/nvim
  tar -C ~/.local -xzf nvim-linux-$arch.tar.gz
  mv ~/.local/nvim-linux-$arch ~/.local/nvim
  rm nvim-linux-$arch.tar.gz
else
  error "Problème de téléchargement de Neovim"
  exit 1
fi

# Installation de LazyVim
confdir=$(dirname "$(realpath "$0")")/config
if [[ ! -d ~/.config/nvim ]]; then
  if [[ -d $confdir ]]; then
    cp -Rp $confdir ~/.config/nvim
  else
    git clone https://github.com/LazyVim/starter ~/.config/nvim
    rm -fr ~/.config/nvim/.git
  fi
fi

message "Installation de Neovim terminée"
echo
