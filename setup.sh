echo "1. Setup Brew"
echo -ne | eval "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew doctor
brew update

echo "2. Install Brew packages"
brew install --cask iterm2

echo "3. Setup oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo "4. Setup p10k fonts for oh-my-zsh"
fontsLink=(
    "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf"
    "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf"
    "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf"
    "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf"
)
fontsName=(
    "MesloLGS NF Regular.ttf"
    "MesloLGS NF Bold.ttf"
    "MesloLGS NF Italic.ttf"
    "MesloLGS NF Bold Italic.ttf"
)
fontsLen=${#fontsName[@]}

for i in "${!fontsLink[@]}"; do
    (cd ~/Library/Fonts/ && curl -L -o "${fontsName[i]}" ${fontsLink[i]})
done

echo "5. Setup p10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# TODO backup old files
echo "5. Remove old dotfiles"
rm -rf ~/.zshrc
rm -rf ~/.gitconfig
rm -rf ~/.p10k.zsh
rm -rf ~/Library/Application\ Support/Code/User/settings.json

echo "6. Setup symlinks"
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.p10k.zsh ~/.p10k.zsh
ln -sf ~/dotfiles/settings.json ~/Library/Application\ Support/Code/User/settings.json

zsh