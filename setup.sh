#!/usr/bin/env bash
# Andrew Park's setup script for MacOS

echo "1. Create .zshrc"
touch ~/.zshrc

echo "2. Display hidden files"
defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder

echo "3. Xcode CLI"
xcode-select --install

echo "4. Homebrew"
if test ! $(which brew); then
	echo "Installing Homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"	
fi

echo "5. Create .zprofile"
touch ~/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "6. Update Homebrew"
brew update

echo "7. Git"
brew install git

echo "8. Git config"
git config --global user.name "Chanoe Andrew Park"
git config --global user.email chanoepark@gmail.com

echo "9. Casks"
CASKS=(
	discord
	firefox
	notion
	slack
	spotify
	steam
	visual-studio-code
	# wireshark
	zoom
)
brew install --cask --appdir="/Applications" ${CASKS[@]}

echo "Setup completed!"
