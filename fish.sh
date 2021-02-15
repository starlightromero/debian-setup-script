#!/bin/bash
# upgrade full system
sudo apt-get -y full-upgrade
# install packages to allow apt to use a repository over HTTPS
sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    git-all
# add keys
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | apt-key add -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
# add repositories
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo add-apt-repository -y ppa:libreoffice/ppa
sudo add-apt-repository -y ppa:pinta-maintainers/pinta-stable
sudo add-apt-repository -y ppa:qbittorrent-team/qbittorrent-stable
sudo add-apt-repository -y ppa:phoerious/keepassxc
sudo add-apt-repository -y https://cli.github.com/packages
# docker
sudo su
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
su starlight
# Fish
sudo add-apt-repository -y ppa:fish-shell/release-3
sudo apt-get -y update && apt-get -y upgrade
sudo apt-get -y install fish
mkdir ~/.config/fish
mv ./config.fish ~/.config/fish/
# Set fish as default shell
chsh -s /usr/bin/fish
fish
