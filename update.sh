#!/bin/bash
echo "system configs -> repo"
sleep 2

if [[ -s "$HOME/.tmux.conf" ]]; then
  echo "sync tmux conf"
  [[ -f "bash/tmux.conf" ]] && rm "bash/tmux.conf"
  cp "$HOME/.tmux.conf" bash/tmux.conf
  echo "success tmux conf"
  echo ""
fi

if [[ -s "$HOME/.zshrc" ]]; then
  echo "sync zshrc"
  [[ -f "bash/zshrc" ]] && rm "bash/zshrc"
  cp "$HOME/.zshrc" bash/zshrc
  echo "success zshrc"
  echo ""
fi

if [[ -d "$HOME/.config/nvim/" ]]; then
  echo "sync nvim"
  [[ -d "nvim/" ]] && rm -rf "nvim"
  cp -r "$HOME/.config/nvim/" .
  echo "success nvim"
  echo ""
fi
