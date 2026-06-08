#!/bin/bash
# this script to quickly sync dotfiles repo with the system

if [[ -s "$HOME/.tmux.conf" ]]; then
  echo "sync tmux conf"
  [[ -f "bash/tmux.conf" ]] && rm "bash/tmux.conf"
  cp "$HOME/.tmux.conf" bash/tmux.conf
  echo "success tmux conf"
  echo ""
fi

if [[ -s "$HOME/.profile" ]]; then
  echo "sync profile"
  [[ -f "bash/profile" ]] && rm "bash/profile"
  cp "$HOME/.profile" bash/profile
  echo "success profile"
  echo ""
fi

if [[ -s "$HOME/.zshrc" ]]; then
  echo "sync zshrc"
  [[ -f "bash/zshrc" ]] && rm "bash/zshrc"
  cp "$HOME/.zshrc" bash/zshrc
  echo "success zshrc"
  echo ""
fi

echo "You would have to copy nvim dir manually for now"
# if [[ -d "$HOME/.config/nvim/" ]]; then
#   echo "sync nvim"
#   [[ -d "nvim/" ]] && rm -rf "nvim"
#   cp -r "$HOME/.config/nvim/" .
#   echo "success nvim"
#   echo ""
# fi
