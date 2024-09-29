Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

scoop config proxy 127.0.0.1:7890
scoop bucket add versions https://mirrors.nju.edu.cn/git/scoop-versions.git/
scoop bucket rm main
scoop bucket add main https://mirrors.nju.edu.cn/git/scoop-main.git/
scoop bucket add extras https://mirrors.nju.edu.cn/git/scoop-extras.git/
scoop bucket add java https://mirrors.nju.edu.cn/git/scoop-java.git/
scoop bucket add nirsoft https://mirrors.nju.edu.cn/git/scoop-nirsoft.git/
scoop bucket add nerd-fonts https://mirrors.nju.edu.cn/git/scoop-nerd-fonts.git/
scoop update

scoop install versions/pwsh-beta
scoop install main/7zip
scoop install main/cmake
scoop install main/cppcheck
scoop install extras/dependencies
scoop install main/fd
scoop install main/fzf
scoop install extras/psfzf
scoop install main/gsudo
scoop install extras/lazygit
scoop install main/neovim
scoop install main/python
scoop install main/ripgrep
scoop install extras/rufus
scoop install main/sed
scoop install extras/sysinternals
scoop install main/zoxide
scoop install extras/sqlitebrowser
scoop install extras/everything
scoop install java/temurin17-jdk
scoop install extras/everything
scoop install extras/powertoys
scoop install extras/sumatrapdf
scoop install extras/geekuninstaller
scoop install extras/snipaste
scoop install extras/windows-terminal
scoop install nerd-fonts/Hack-NF
scoop install extras/ghidra
scoop install main/ninja
scoop install main/nodejs

# others
# scoop install extras/foxmail
# scoop install extras/googlechrome
# scoop install extras/clash-verge-rev
# scoop install extras/qq
# scoop install extras/winscp
# scoop install extras/wireshark
# scoop install extras/x64dbg
# scoop install extras/wechat
# scoop install extras/ccleaner
# github desktop/navicat/rustup/vs/workflowy/dingtalk/huorong/腾讯会议/微信输入法/windbg