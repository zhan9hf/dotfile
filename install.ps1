Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

choco install 7zip

choco install git

choco install visualstudio2017buildtools

choco install visualstudio2022community

choco install googlechrome

choco install neovim

choco install cmake

choco install powershell-core --pre

choco install llvm

choco install python

choco install ruby

choco install nodejs

choco install strawberryperl

choco install ripgrep

choco install fd

choco install lazygit

choco install oh-my-posh

choco install zoxide

choco install gsudo

choco install fzf

choco install everything

choco install msys2

choco install sed

choco install golang

choco install rustup.install

#choco install sqlitebrowser

choco install temurin17

choco install workflowy

choco install wireshark

choco install vscode

choco install dependencies

choco install neovide

choco install geekuninstaller

choco install rufus

choco install nerd-fonts-jetbrainsmono

choco install sysinternals

choco install github-desktop

choco install dingtalk

choco install wechat

choco install tencentqq

choco install x64dbg.portable

choco install cppcheck

choco install openssh

#choco install explorersuite

#choco install winscp

#choco install docker-desktop

#choco install nutstore

refreshenv

oh-my-posh font install meslo # Meslo LGM NF

npm install -g neovim

sudo cpanm -n Neovim::Ext

sudo pip install --user --upgrade pynvim

sudo gem install neovim

sudo pip install cmakelang

sudo pip install conan==1.60.2

