# Ruby
git clone https://github.com/sstephenson/rbenv.git $HOME/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> $HOME/.zshenv
echo 'eval "$(rbenv init -)"' >> $HOME/.zshenv
exec $SHELL -l
mkdir -p $HOME/.rbenv/plugins
git clone https://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build
git clone https://github.com/ianheggie/rbenv-binstubs.git $HOME/.rbenv/plugins/rbenv-binstubs
rbenv install 2.2.2
rbenv global 2.2.2
rbenv rehash
gem install bundler --no-ri --no-rdoc
rbenv rehash

# Node.js
curl -L git.io/nodebrew | perl - setup
echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> $HOME/.zshenv
export PATH=$HOME/.nodebrew/current/bin:$PATH
nodebrew install-binary 0.12
nodebrew use latest

# Shirasagi
git clone https://github.com/shirasagi/shirasagi
cd shirasagi
bundle install
