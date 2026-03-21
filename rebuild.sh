#!/usr/bin/env bash

install_if_missing() {
  if ! command -v "$1" &> /dev/null; then
    echo "${1^} not found. Installing..."
    sudo apt install -y "$1"
  else
    echo "${1^} is aleady installed."
  fi
}

set -e

clear
echo -e "Getting latest package updates....\n"
sudo apt update

clear
echo -e "==============================================\n"
echo -e "  Initialising Phoenix-GATZorKA Bootstrap...\n"
echo -e "==============================================\n"

install_if_missing "git"
install_if_missing "ansible"
install_if_missing "curl"

REPO_DIR="Phoenix_GATZorKA"

if [[ "$1" == "force" ]]; then
  echo -e  "\nForce mode: Deleting $REPO_DIR to start fresh..."
  sudo rm -rf "$REPO_DIR" 
fi

if [ ! -d "Phoenix_GATZorKA/.git" ]; then
  echo -e "\nCloning the full automation suite...."
  git clone https://github.com/abarrett-mbcs/Phoenix_GATZorKA.git
  #  cd Phoenix_GATZorKA
  #  ls -a
else
  echo -e "Repository already exists.\n"
fi

echo -e "\nInitialisation complete.\n"

echo -e "\nRunning Ansible Playbook.\n"
ansible-playbook Phoenix_GATZorKA/init/test-playbook.yml --ask-become-pass

