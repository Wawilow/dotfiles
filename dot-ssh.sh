#!/bin/bash
set -e

TARGET_USER=user
SOURCE_DIR="/opt/dot-ssh"
TARGET_DIR="$HOME/.ssh"

if [ ! -d "$SOURCE_DIR" ]; then
  exit 1
fi
if [ -e "$TARGET_DIR" ]; then
  if [ -L "$TARGET_DIR" ]; then
    rm "$TARGET_DIR"
  elif [ -d "$TARGET_DIR" ]; then
    mv "$TARGET_DIR" "${TARGET_DIR}.backup"
  else
    mv "$TARGET_DIR" "${TARGET_DIR}.backup"
  fi
fi
ln -s "$SOURCE_DIR" "$TARGET_DIR"

sudo chown -R "$TARGET_USER:$TARGET_USER" "$SOURCE_DIR"

sudo chmod 700 "$SOURCE_DIR"
find "$SOURCE_DIR" -type f -name "id_*" ! -name "*.pub" -exec sudo chmod 600 {} \;
find "$SOURCE_DIR" -type f -name "*.pub" -exec sudo chmod 644 {} \;
find "$SOURCE_DIR" -type f -name "authorized_keys" -exec sudo chmod 600 {} \;
find "$SOURCE_DIR" -type f -name "config" -exec sudo chmod 600 {} \;
