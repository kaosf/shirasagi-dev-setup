sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install software-properties-common
sudo add-apt-repository -y ppa:git-core/ppa
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt-get -y update
sudo apt-get -y install \
  zsh git curl build-essential automake \
  libncurses5-dev libncursesw5-dev \
  libevent-dev libncurses-dev \
  zlib1g-dev libssl-dev libreadline6-dev libffi-dev \
  libsqlite3-dev \
  postgresql-server-dev-9.3 \
  libxslt1-dev libxml2-dev \
  libldap2-dev libsasl2-dev \
  imagemagick libmagickwand-dev \
  lua5.2 liblua5.2-dev luajit libluajit-5.1-2 libluajit-5.1-dev \
  libperl-dev \
  libpython-dev libpython3-dev \
  ruby ruby-dev \
  mongodb-org \

sudo chsh /usr/bin/zsh `whoami`
touch $HOME/.zshrc

mkdir -p $HOME/src

# Vim
cd $HOME/src
git clone https://github.com/vim-jp/vim
cd vim
./configure \
  --enable-perlinterp=yes \
  --enable-pythoninterp=yes \
  --enable-rubyinterp \
  --enable-luainterp=yes \
  --enable-multibyte \
  --enable-fail-if-missing \
  --with-features=huge \
  --with-luajit
make
sudo make install
cd

# Tig
cd $HOME/src
git clone https://github.com/jonas/tig
cd tig
git checkout tig-2.2.1
./autogen.sh
./configure
make
sudo make install
git checkout master
cd

# Tmux
cd $HOME/src
wget http://downloads.sourceforge.net/tmux/tmux-1.9a.tar.gz
tar xzf tmux-1.9a.tar.gz
rm -f tmux-1.9a.tar.gz
cd tmux-1.9a
./configure
make
sudo make install

USERNAME=username_as_you_like
GROUPNAME=groupname_as_you_like
sudo cp -r /etc/skel /home/${USERNAME}
sudo useradd ${USERNAME} -d /home/${USERNAME} -s /usr/bin/zsh -g ${GROUPNAME}
sudo chown ${USERNAME}:${GROUPNAME} -R /home/${USERNAME}
