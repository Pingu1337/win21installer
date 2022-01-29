#!/bin/bash
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt install nodejs -y && sudo apt install npm -y
npm install jsdoc

code --install-extension Tobermory.es6-string-html --force 
code --install-extension abusaidm.html-snippets --force 
code --install-extension bashmish.es6-string-css --force 
code --install-extension pranaygp.vscode-css-peek --force
code --install-extension ritwickdey.live-sass --force
code --install-extension syler.sass-indented --force
code --install-extension dbaeumer.jshint --force
code --install-extension zjcompt.es6-string-javascript --force
code --install-extension eamodio.gitlens --force
code --install-extension esbenp.prettier-vscode --force
code --install-extension ms-dotnettools.csharp --force
code --install-extension ritwickdey.LiveServer --force
code --install-extension formulahendry.auto-rename-tag --force
echo Installation complete! 
