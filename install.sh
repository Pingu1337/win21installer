#!/bin/bash
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install nodejs -y && sudo apt-get install npm -y
npm install jsdoc

code --user-data-dir --install-extension Tobermory.es6-string-html --force 
code --user-data-dir --install-extension abusaidm.html-snippets --force 
code --user-data-dir --install-extension bashmish.es6-string-css --force 
code --user-data-dir --install-extension pranaygp.vscode-css-peek --force
code --user-data-dir --install-extension ritwickdey.live-sass --force
code --user-data-dir --install-extension syler.sass-indented --force
code --user-data-dir --install-extension dbaeumer.jshint --force
code --user-data-dir --install-extension zjcompt.es6-string-javascript --force
code --user-data-dir --install-extension eamodio.gitlens --force
code --user-data-dir --install-extension esbenp.prettier-vscode --force
code --user-data-dir --install-extension ms-dotnettools.csharp --force
code --user-data-dir --install-extension ritwickdey.LiveServer --force
code --user-data-dir --install-extension formulahendry.auto-rename-tag --force
echo Installation complete! 
