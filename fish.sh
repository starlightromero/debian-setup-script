# Fish
add-apt-repository -y ppa:fish-shell/release-3
apt-get -y update && apt-get -y upgrade
apt-get -y install fish
mkdir /home/starlight/.config/fish
mv ./config.fish /home/starlight/.config/fish/
# Set fish as default shell
chsh -s /usr/bin/fish
fish
