#!/bin/bash
#Backup Profile - 12/31/2020
#Copies .bash_profile, bash scripts, PICO-8 carts, Brew Caskfile, and Brewfile to GitHub directory
#Copies dotfiles to iCloud

#.bash_profile copy
echo "Copying .bash_profile..."
cp ~/.bash_profile ~/Github/Terminal_Settings/Terminal/
echo "Complete"

#.zshrc copy
echo "Copying .zshrc..."
cp ~/.zshrc ~/Github/Terminal_Settings/Terminal/
echo "Complete"

#Bash scripts copy
echo "Copying bash scripts.."
cp -R ~/Documents/scripts ~/Github/bash
echo "Complete"

#PICO-8 carts copy
#echo "Copying PICO-8 carts.."
#cp -R ~/Library/Application\ Support/pico-8/carts/games ~/Github/PICO-8
#echo "Complete"

#Homebrew Brewfile
echo "Creating Brewfile..."
cd ~/GitHub/Terminal_Settings/Terminal
brew list --formula > preBrewfile
awk '$0=""$0' preBrewfile > Brewfile
echo "Cleaning up..."
rm preBrewfile
cd ~
echo "Complete"

#Homebrew Caskfile
echo "Creating Brew Caskfile..."
cd ~/GitHub/Terminal_Settings/Terminal
brew list --cask > preCaskfile
awk '$0=""$0' preCaskfile > Caskfile
echo "Cleaning up..."
rm preCaskfile
cd ~
echo "Complete"

#Dotfiles
echo "Copying dotfiles..."
cp -R ~/.balena ~/Documents/Dotfiles
cp -R ~/.bash_history ~/Documents/Dotfiles
cp -R ~/.bash_profile ~/Documents/Dotfiles
cp -R ~/.config ~/Documents/Dotfiles
cp -R ~/.cordless ~/Documents/Dotfiles
cp -R ~/.gem ~/Documents/Dotfiles
cp -R ~/.gitconfig ~/Documents/Dotfiles
cp -R ~/.mono ~/Documents/Dotfiles
cp -R ~/.mputils ~/Documents/Dotfiles
cp -R ~/.msf4 ~/Documents/Dotfiles
cp -R ~/.mume ~/Documents/Dotfiles
cp -R ~/.rainbow_config.json ~/Documents/Dotfiles
cp -R ~/.rainbow_oauth ~/Documents/Dotfiles
cp -R ~/.rbenv ~/Documents/Dotfiles
cp -R ~/.runelite ~/Documents/Dotfiles
cp -R ~/.ssh ~/Documents/Dotfiles
cp -R ~/.viminfo ~/Documents/Dotfiles
cp -R ~/.vscode ~/Documents/Dotfiles
cp -R ~/.zshrc ~/Documents/Dotfiles
cp -R ~/.zshrc.pre-oh-my-zsh ~/Documents/Dotfiles
echo "Complete"