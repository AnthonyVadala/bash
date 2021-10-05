#!/bin/bash
#New Mac Setup - 10/05/2021
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
	sudo /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	echo -e "${GREEN}Complete...${NC}\n"
else
	echo -e "${RED}Homebrew install skipped${NC}\n"
fi

#Install Jekyll
echo "Install Jekyll (Y/N):"
read answer
if [[ $answer == 'Y' || $answer == 'y' ]]
then
	echo "Installing Jekyll..."
	sudo gem install bundler jekyll
	echo -e "${GREEN}Complete...${NC}\n"
else
	echo -e "${RED}Jekyll install skipped${NC}\n"
fi

#Install Oh My Zsh Download
echo "Install Oh My Zsh (Y/N):"
read answer
if [[ $answer == 'Y' || $answer == 'y' ]]
then
	echo "Installing Oh My Zsh..."
	cd ~ && { curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh ; cd -; }
	echo -e "${GREEN}Complete...${NC}\n"
else
	echo -e "${RED}Oh My Zsh install skipped${NC}\n"
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

#Download .bash_profile
echo "Download .bash_profile (Y/N):"
read answer
if [[ $answer == 'Y' || $answer == 'y' ]]
then
	echo "Downloading .bash_profile..."
	cd ~ && { curl -O https://raw.githubusercontent.com/AnthonyVadala/Terminal_Settings/main/Terminal/.bash_profile ; cd -; }
	echo -e "${GREEN}Complete...${NC}\n"
else
	echo -e "${RED}.bash_profile download skipped${NC}\n"
fi

#Download Brewfile
echo "Download Brewfile (Y/N):"
read answer
if [[ $answer == 'Y' || $answer == 'y' ]]
then
	echo "Downloading Brewfile..."
	cd ~/Downloads && { curl -O https://raw.githubusercontent.com/AnthonyVadala/Terminal_Settings/main/Terminal/Brewfile ;}
	cd ~/Downloads && brew install $(cat Brewfile) && rm Brewfile && cd -
	echo -e "${GREEN}Complete...${NC}\n"
else
	echo -e "${RED}Brewfile download skipped${NC}\n"
fi

#Download Brew Caskfile
echo "Download Brew Caskfile (Y/N):"
read answer
if [[ $answer == 'Y' || $answer == 'y' ]]
then
	echo "Downloading Brew Caskfile..."
	cd ~/Downloads && { curl -O https://raw.githubusercontent.com/AnthonyVadala/Terminal_Settings/main/Terminal/Caskfile ;}
	cd ~/Downloads && brew cask install $(cat Caskfile) && rm Caskfile && cd -
	echo -e "${GREEN}Complete...${NC}\n"
else
	echo -e "${RED}Brew Caskfile download skipped${NC}\n"
fi

#Download Terminal Settings
echo "Download Terminal Settings.terminal (Y/N):"
read answer
if [[ $answer == 'Y' || $answer == 'y' ]]
then
	echo "Downloading Terminal Settings.terminal..."
	cd ~/Downloads && { curl -O https://raw.githubusercontent.com/AnthonyVadala/Terminal_Settings/main/Terminal/Terminal%20Settings.terminal ;} && cd ~/Downloads && open Terminal%20Settings.terminal && cd -
	echo -e "${GREEN}Complete...${NC}\n"
	echo "Remember to go to:"
	echo -e ""\""Terminal"\"" -> "\""Preferences"\"" -> "\""Profiles"\"""
	echo -e "Select the "\""Terminal Settings"\"" theme"
	echo -e "Click "\""Default"\""\n"
else
	echo -e "${RED}Terminal Settings.terminal download skipped${NC}\n"
fi

#Download .zshrc
echo "Download .zshrc (Y/N):"
read answer
if [[ $answer == 'Y' || $answer == 'y' ]]
then
	echo "Downloading and installing .zshrc..."
	cd ~ && { curl -O https://raw.githubusercontent.com/AnthonyVadala/Terminal_Settings/main/Terminal/.zshrc ; cd -; }
	echo -e "${GREEN}Complete...${NC}\n"
else
	echo -e "${RED}.zshrc download skipped${NC}\n"
fi

#Remove "Other" from login screen
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

echo -e "${GREEN}macOS Setup Complete!${NC}"