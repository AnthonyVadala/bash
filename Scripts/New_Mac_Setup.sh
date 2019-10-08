#!/bin/bash
#New Mac Setup - 01/31/2018
#Automates the setup of a new Mac using my personal settings and programs

#Adds color to output
RED='\033[0;31m'
GREEN='\033[1;32m'
#Color Reset
NC='\033[0m'

#Install Homebrew
echo "Install Homebrew (Y/N):"
read answer
if [[ $answer == 'Y' || $answer == 'y' ]]
then
	echo "Installing Homebrew..."
	sudo /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew tap homebrew/cask-drivers
	echo -e "${GREEN}Complete...${NC}\n"
else
	echo -e "${RED}Homebrew install skipped${NC}\n"
fi

#Install Terminal Xcode
echo "Install Terminal Xcode (Y/N):"
read answer
if [[ $answer == 'Y' || $answer == 'y' ]]
then
	echo "Installing Terminal Xcode..."
	sudo xcode-select --install
	echo -e "${GREEN}Complete...${NC}\n"
else
	echo -e "${RED}Terminal Xcode install skipped${NC}\n"
fi

#Install Jekyll
echo "Install Jekyll (Y/N):"
read answer
if [[ $answer == 'Y' || $answer == 'y' ]]
then
	echo "Installing Jekyll..."
	sudo gem install jekyll jekyll-paginate
	echo -e "${GREEN}Complete...${NC}\n"
else
	echo -e "${RED}Jekyll install skipped${NC}\n"
fi

#OneDrive symbolic link to Photos
echo "Create a symbolic link to OneDrive (Y/N):"
read answer
if [[ $answer == 'Y' || $answer == 'y' ]]
then
	echo "Creating symbolic link to OneDrive..."
	ln -s ~/OneDrive/Pictures/* ~/Pictures
	echo -e "${GREEN}Complete...${NC}\n"
else
	echo -e "${RED}Create a symbolic link to OneDrive skipped${NC}\n"
fi

#Removes "Other" from login screen
echo "Remove "\""Other"\"" from login screen (Y/N):"
read answer
if [[ $answer == 'Y' || $answer == 'y' ]]
then
	echo "Removing "\""Other"\"" option from login screen"
	sudo defaults write /Library/Preferences/com.apple.loginwindow SHOWOTHERUSERS_MANAGED -bool FALSE
	echo -e "${GREEN}Complete...${NC}\n"
else
	echo -e "${RED}Remove "\""Other"\"" from login screen skipped${NC}\n"
fi

#.bash_profile download
echo "Download and install .bash_profile (Y/N):"
read answer
if [[ $answer == 'Y' || $answer == 'y' ]]
then
	echo "Downloading and installing .bash_profile..."
	cd ~ && { curl -O https://raw.githubusercontent.com/AnthonyVadala/Terminal_Settings/master/Terminal/.bash_profile ; cd -; }
	echo -e "${GREEN}Complete...${NC}\n"
else
	echo -e "${RED}Download and install .bash_profile skipped${NC}\n"
fi

#.zshrc download
echo "Download and install .zshrc (Y/N):"
read answer
if [[ $answer == 'Y' || $answer == 'y' ]]
then
	echo "Downloading and installing .zshrc..."
	cd ~ && { curl -O https://raw.githubusercontent.com/AnthonyVadala/Terminal_Settings/master/Terminal/.zshrc ; cd -; }
	echo -e "${GREEN}Complete...${NC}\n"
else
	echo -e "${RED}Download and install .zshrc skipped${NC}\n"
fi

#Brewfile download and install
echo "Download and install Brewfile (Y/N):"
read answer
if [[ $answer == 'Y' || $answer == 'y' ]]
then
	echo "Downloading and installing Brewfile..."
	cd ~/Downloads && { curl -O https://raw.githubusercontent.com/AnthonyVadala/Terminal_Settings/master/Terminal/Brewfile ;}
	cd ~/Downloads && brew install $(cat Brewfile) && rm Brewfile && cd -
	echo -e "${GREEN}Complete...${NC}\n"
else
	echo -e "${RED}Download and install Brewfile skipped${NC}\n"
fi

#Brew Caskfile download and install
echo "Download and install Brew Caskfile (Y/N):"
read answer
if [[ $answer == 'Y' || $answer == 'y' ]]
then
	echo "Downloading and installing Brew Caskfile..."
	cd ~/Downloads && { curl -O https://raw.githubusercontent.com/AnthonyVadala/Terminal_Settings/master/Terminal/Caskfile ;}
	cd ~/Downloads && brew cask install $(cat Caskfile) && rm Caskfile && cd -
	echo -e "${GREEN}Complete...${NC}\n"
else
	echo -e "${RED}Download and install Brew Caskfile skipped${NC}\n"
fi

#Install Terminal Settings
echo "Download and install Terminal Settings.terminal (Y/N):"
read answer
if [[ $answer == 'Y' || $answer == 'y' ]]
then
	echo "Downloading and installing Terminal Settings.terminal..."
	cd ~/Downloads && { curl -O https://raw.githubusercontent.com/AnthonyVadala/Terminal_Settings/master/Terminal/Terminal%20Settings.terminal ;} && cd ~/Downloads && open Terminal%20Settings.terminal && cd -
	echo -e "${GREEN}Complete...${NC}\n"
	echo "Remember to go to:"
	echo -e ""\""Terminal"\"" -> "\""Preferences"\"" -> "\""Profiles"\"""
	echo -e "Select the "\""Terminal Settings"\"" theme"
	echo -e "Click "\""Default"\""\n"
else
	echo -e "${RED}Download and install Terminal Settings.terminal skipped${NC}\n"
fi

echo -e "${GREEN}Mac Setup Complete!${NC}"