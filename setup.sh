#!/bin/bash
# upgrade full system
apt-get -y full-upgrade
# install packages to allow apt to use a repository over HTTPS
apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
# add keys
apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | apt-key add -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
# add repositories
add-apt-repository -y ppa:libreoffice/ppa
add-apt-repository -y ppa:fish-shell/release-3
add-apt-repository -y ppa:deadsnakes/ppa
add-apt-repository -y ppa:pinta-maintainers/pinta-stable
add-apt-repository -y ppa:qbittorrent-team/qbittorrent-stable
add-apt-repository -y ppa:phoerious/keepassxc
add-apt-repository -y https://cli.github.com/packages
add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
# get packages
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
wget -c https://golang.org/dl/go1.15.8.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.15.8.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
curl -L -o "LibreWolf" "https://gitlab.com/librewolf-community/browser/linux/uploads/cfdd906e663aef41c869573abbd0fb06/LibreWolf-85.0.1-1.x86_64.AppImage"
chmod +x ./LibreWolf
wget "https://discordapp.com/api/download?platform=linux&format=deb" -O discord.deb
dpkg -i discord.deb
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.12.2-amd64.deb
wget https://zoom.us/client/latest/zoom_amd64.deb
curl -L -o "Session" "https://www.getsession.org/linux"
chmod +x ./Session
curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
chmod a+rx /usr/local/bin/youtube-dl
wget https://www.privateinternetaccess.com/installer/pia-nm.sh
# update all packages
apt-get -y update
apt-get -y install -f
apt-get -y install --no-install-recommends yarn \
    make \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    wget \
    curl \
    llvm \
    libncurses5-dev \
    xz-utils \
    tk-dev \
    libxml2-dev \
    libxmlsec1-dev \
    libffi-dev \
    liblzma-dev
apt-get -y install git-all \
    gh \
    gcc \
    docker-ce docker-ce-cli containerd.io \
    tor \
    vim \
    keepassxc \
    terminator \
    qbittorrent \
    vlc \
    virtualbox \
    virtualbox—ext–pack \
    libreoffice \
    pinta \
    ninvaders \
    pacman4console \
    nsnake \
    nudoku \
    tint \
    ./slack-desktop-*.deb \
    ./zoom_amd64.deb
# Remove .deb
rm ./slack-desktop-*.deb
rm ./zoom_amd64.deb
# Fish
apt-get -y install fish
mv ./config.fish ~/.config/fish/
# Private Internet Access
fish pia-nm.sh
# pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo "set --export PYENV_ROOT $HOME/.pyenv" > ~/.config/fish/conf.d/pyenv.fish
set -U fish_user_paths $HOME/.pyenv/bin $fish_user_paths
echo -e '\n\n# pyenv init\nif command -v pyenv 1>/dev/null 2>&1\n  pyenv init - | source\nend' >> ~/.config/fish/config.fish
git clone https://github.com/pyenv/pyenv-virtualenv.git (pyenv root)/plugins/pyenv-virtualenv
echo -e "\n# Enable virtualenv autocomplete\nstatus --is-interactive; and pyenv init - | source\nstatus --is-interactive; and pyenv virtualenv-init - | source\n" >> ~/.config/fish/conf.d/pyenv.fish
pyenv install 3.10-dev
echo "if which pyenv > /dev/null; eval "$(pyenv init -)"; end" >> ~/.profile
# pip3
apt-get -y install python3-pip
# ohmyfish
curl -L https://get.oh-my.fish | fish
# git alias plugin
omf install https://github.com/jhillyerd/plugin-git
# NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
omf install https://github.com/fabioantunes/fish-nvm
omf install https://github.com/edc/bass
echo "function nvm
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end" >> ~/.config/fish/functions/nvm.fish
# Node
nvm install node
nvm use node
# Atom
apt-get -y install atom
# Atom themes and packages
apm install 90s-hack-syntax \
    90s-hack-ui \
    atom-beautify \
    handlebars \
    autocomplete-python \
    block-cursor \
    busy-signal \
    color-picker \
    docker \
    editor-background \
    emmet \
    expressjs \
    flask-snippets \
    highlight-selected \
    intentions \
    language-gemini \
    linter \
    linter-js-standard \
    linter-ui-default \
    markdown-writer \
    pigments \
    platformio-ide-terminal \
    prettier-atom \
    python-autopep8 \
    python-black \
    react \
    smart-gitignore \
    standard-formatter \
    tidy-markdown \
    tool-bar \
    tool-bar-markdown-writer \
    zentabs
# WhiteSur
curl -L "https://raw.githubusercontent.com/vinceliuice/WhiteSur-kde/master/install.sh" | bash
# MesloLGS fonts
curl -L "https://github.com/IlanCosman/tide/blob/assets/fonts/mesloLGS_NF_regular.ttf?raw=true" -o ~/.local/share/fonts/MesloLGS\ NF\ Regular.ttf
curl -L "https://github.com/IlanCosman/tide/blob/assets/fonts/mesloLGS_NF_bold.ttf?raw=true" -o ~/.local/share/fonts/MesloLGS\ NF\ Bold.ttf
curl -L "https://github.com/IlanCosman/tide/blob/assets/fonts/mesloLGS_NF_italic.ttf?raw=true" -o ~/.local/share/fonts/MesloLGS\ NF\ Italic.ttf
curl -L "https://github.com/IlanCosman/tide/blob/assets/fonts/mesloLGS_NF_bold_italic.ttf?raw=true" -o ~/.local/share/fonts/MesloLGS\ NF\ Bold\ Italic.ttf
fc-cache -f -v
# tide
curl -s https://raw.githubusercontent.com/IlanCosman/tide/master/install.fish | source; and tide_install
# Set fish as default shell
chsh -s /usr/bin/fish
