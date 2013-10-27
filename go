echo "Installing portal things..."
sudo mkdir -p /opt/boxen
sudo chown ${USER}:staff /opt/boxen
git clone -b mavericks-updates https://github.com/healeyious/our-boxen /opt/boxen/r$
cd /opt/boxen/repo
script/boxen --no-fde
touch ~/.bashrc
echo '[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh' | cat > ~/.bashrc
sudo chown ${USER}:staff ~/.bashrc && sudo chmod 755 ~/.bashrc
echo "Installling subversion17..."
brew tap homebrew/versions
brew install subversion17
echo "Installling vagrant-vbguest..."
vagrant plugin install vagrant-vbguest
echo "Installling nodejs..."
brew tap homebrew/versions
brew install node
echo "Installling homebrew..."
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
echo "Installling rbenv and ruby (requires homebrew)..."
brew install rbenv
brew install ruby
