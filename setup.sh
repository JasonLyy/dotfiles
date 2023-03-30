echo "1. Setup Brew"
echo -ne | eval "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew doctor
brew update

echo "2. Install Brew packages"
brew install --cask iterm2

echo "2. Setup oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo "3. Setup p10k fonts for oh-my-zsh"
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

# TODO backup old files
echo "4. Remove old dotfiles"
rm -rf ~/.zshrc
rm -r ~/.gitconfig

echo "5. Setup symlinks"
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

zsh