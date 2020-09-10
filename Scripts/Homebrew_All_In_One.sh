#Homebrew All In One - 01/31/2018
#Automates Homebrew updates, dependancies, cleanup, and doctor

#Checks for latest version of Homebrew
echo "Checking for Homebrew updates..."
brew update

#Checks for latest versions of formulae
echo "Checking for Homebrew formulae updates..."
brew upgrade

#Checks for lastest versions of Cask installs
echo "Checking for Homebrew Cask updates..."
brew upgrade --cask

#Checks formulae for dependancies
echo "Checking for missing dependancies..."
brew missing

#Deletes dead symlinks and deletes old versions of formulae and left over files
echo "Removing dead symlinks and cleaning up left over files..."
brew cleanup

#Determines if there is any issues with Homebrew
echo "Checking for any issues..."
brew doctor