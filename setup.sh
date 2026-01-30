#!/bin/bash
# this is file to setup fresh system with all my stuff I need for work
# both mac and linux

if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "os: MacOS"
  echo "MacOS is not supported yet"
  exit 0

elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  echo "os: Linux"
  if [ -f /etc/os-release ]; then
    . /etc/os-release

    if [[ "$ID" == "debian" || "$ID" == "ubuntu" ]]; then
      echo "distro: debian"
      echo "Debian is not supported yet"
      exit 0

    elif [[ "$ID" == "fedora" ]]; then
      echo "distro: Fedora"
      sudo dnf upgrade -y
      sudo dnf install -y git curl wget powerline-fonts nvim ping
      sudo dnf install -y --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release
      sudo dnf install -y ghostty
      sudo dnf install -y docker docker-compose kubectl
      sudo dnf config-manager addrepo --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo
      sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
      sudo systemctl enable --now docker
      sudo groupadd docker
      sudo usermod -aG docker $USER
      sudo dnf install -y zsh tmux luarocks python3-neovim ripgrep lazygit gdu fd fzf tree-sitter-cli lua lua5.1
      chsh -s $(which zsh)
    fi
  fi
else
  echo "Unsupported OS Type: $OSTYPE"
  exit 1
fi

echo "Move config files in place"
cp bash/profile ~/.profile
cp bash/tmux.conf ~/.tmux.conf
cp bash/zshrc ~/.zshrc

echo "Move nvim"
cp -r nvim ~/.config/

echo "Move opt stuff"
sudo cp dot-ssh.sh /opt/
sudo cp dot-ssh.service /etc/systemd/system/
sudo chmod +x /opt/dot-ssh.sh
sudo systemctl enable dot-ssh.service
sudo systemctl start dot-ssh.service
sudo systemctl status dot-ssh.service
