#!/bin/sh

# TODO: Change terminal to Homebrew default (update /Library/Preferences/com.apple.Terminal.plist)
# TODO: Script setup of new SSH keys (upload to Github?)
# TODO: git autocompletion
# TODO: add Ubersicht widgets automatically?

# OSX command line developer tools
xcode-select --install

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew update
brew tap homebrew/cask-versions

# Java
brew tap adoptopenjdk/openjdk
brew install --cask adoptopenjdk8
brew install --cask adoptopenjdk11

echo "export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)" >> ~/.bash_profile
echo "export JAVA_11_HOME=$(/usr/libexec/java_home -v11)" >> ~/.bash_profile
echo "export JAVA_HOME=$JAVA_8_HOME" >> ~/.bash_profile # default to Java8

echo "alias java8='export JAVA_HOME=$JAVA_8_HOME'" >> ~/.bash_profile
echo "alias java11='export JAVA_HOME=$JAVA_11_HOME'" >> ~/.bash_profile

# Node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
nvm install 16
brew install npm
brew install bower

# Build Tools
brew install gradle
brew install maven

# Docker
brew install —-cask docker
open /Applications/Docker.app

# Ubersicht
curl -OJ http://tracesof.net/uebersicht/releases/Uebersicht-1.6.69.app.zip
mv Übersicht.app /Applications 

# Text Editors
brew install --cask sublime-text
brew install --cask intellij-idea
brew install --cask visual-studio-code

# Personal Apps
brew install --cask google-chrome
brew install --cask vlc
brew install --cask plex
brew install --cask postman
brew install --cask spotify
brew install --cask slack

# Organisation
brew install --cask calibre
brew install --cask macdown
brew install --cask notion

# BitTorrent
curl -OJ https://btweb-assets.bittorrent.com/installer/BitTorrentWeb.dmg
sudo hdiutil attach BitTorrentWeb.dmg 
sudo cp -R /Volumes/BitTorrent\ Web/BitTorrent\ Web.app/ /Applications/
sudo hdiutil attach BitTorrentWeb.dmg 
rm BitTorrentWeb.dmg 
