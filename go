#!/bin/bash
clear
echo "Installing portal things..."
sudo mkdir -p /opt/boxen
sudo chown ${USER}:staff /opt/boxen
git clone -b mavericks-updates https://github.com/healeyious/our-boxen /opt/boxen/r$
cd /opt/boxen/repo
script/boxen --no-fde
touch ~/.bashrc
echo '[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh' | cat > ~/.bashrc
sudo chown ${USER}:staff ~/.bashrc && sudo chmod 755 ~/.bashrc
