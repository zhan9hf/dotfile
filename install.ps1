Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

choco install 7zip

choco install git

choco install visualstudio2017buildtools

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

choco install rustup.install

oh-my-posh font install meslo # Meslo LGM NF

npm install -g neovim

sudo cpanm -n Neovim::Ext

sudo pip install --user --upgrade pynvim

pip install cmakelang

sudo pip install conan==1.60.2

pip3 install gersemi

sudo gem install neovim