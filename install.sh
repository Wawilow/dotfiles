#!/bin/bash
# repo -> system
echo "DANGEROUS, IT COULD NUKE YOUR SHIT"

if [[ -f "bash/tmux.conf" ]]; then
  read -p "install tmux conf [y/n]? " ans
  if [[ "$ans" == "y" ]]; then
    cp bash/tmux.conf "$HOME/.tmux.conf"
    echo "success tmux conf"
    echo ""
  fi
fi

if [[ -f "bash/zshrc" ]]; then
  read -p "install zshrc [y/n]? " ans
  if [[ "$ans" == "y" ]]; then
    cp bash/zshrc "$HOME/.zshrc"
    echo "success zshrc"
    echo ""
  fi
fi

if [[ -d "nvim/" ]]; then
  read -p "install nvim [y/n]? " ans
  if [[ "$ans" == "y" ]]; then
    [[ -d "$HOME/.config/nvim/" ]] && rm -rf "$HOME/.config/nvim"
    cp -r nvim/ "$HOME/.config/nvim/"
    echo "success nvim"
    echo ""
  fi
fi
