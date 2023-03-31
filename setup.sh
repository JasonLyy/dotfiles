echo "1. Setup Brew"
echo -ne | eval "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew doctor
brew update

echo "2. Install Brew packages"
brew install --cask iterm2

brew tap homebrew/cask-fonts
brew install font-fira-code
brew install font-meslo-lg

echo "3. Setup zsh antigen"
git clone https://github.com/zsh-users/antigen.git ~/antigen

# TODO backup old files
echo "4. Remove old dotfiles"
rm -rf ~/.zshrc
rm -rf ~/.gitconfig
rm -rf ~/.p10k.zsh
rm -rf ~/Library/Application\ Support/Code/User/settings.json

echo "5. Setup symlinks"
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.p10k.zsh ~/.p10k.zsh
ln -sf ~/dotfiles/settings.json ~/Library/Application\ Support/Code/User/settings.json

zsh