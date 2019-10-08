#!/bin/bash
#Backup Profile - 10/08/2019
#Copies .bash_profile, bash scripts, PICO-8 carts, Brew Caskfile, and Brewfile to GitHub directory

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
brew list > preBrewfile
awk '$0=""$0' preBrewfile > Brewfile
echo "Cleaning up..."
rm preBrewfile
cd ~
echo "Complete"

#Homebrew Caskfile
echo "Creating Brew Caskfile..."
cd ~/GitHub/Terminal_Settings/Terminal
brew cask list > preCaskfile
awk '$0=""$0' preCaskfile > Caskfile
echo "Cleaning up..."
rm preCaskfile
cd ~
echo "Complete"