echo "1. Setup Brew"
echo -ne | eval "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew doctor
brew update

echo "2. Setup oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# TODO backup old files
echo "3. Remove old dotfiles"
rm -rf ~/.zshrc
rm -r ~/.gitconfig

echo "4. Setup symlinks"
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

zsh