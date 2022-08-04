#! /bin/bash

echo "[1/34] Initialization"
apt-get -qq -qq update > /dev/null 2>&1
apt-get -qq upgrade -y > /dev/null 2>&1
apt-get -qq autoremove --purge -y > /dev/null 2>&1
apt-get -qq autoremove --purge -y burpsuite > /dev/null 2>&1
mkdir -p /tmp/tmp_downloads/
mkdir -p /opt/binaries/
mkdir -p /home/parrot/.local/share/fonts/
mkdir -p /home/parrot/.config/terminator
systemctl --quiet start postgresql && msfdb init > /dev/null 2>&1

echo "[2/34] Searching for latest releases"
ghidra_url=$(curl -Ls "https://github.com/NationalSecurityAgency/ghidra/releases/latest/" | grep "ghidra/releases/download" | cut -d '"' -f 2)
secLists_url=$(curl -Ls "https://github.com/danielmiessler/SecLists/releases/latest" | grep "/SecLists/archive/refs/tags/" | grep "tar.gz" | cut -d '"' -f 2)
pspy64_url=$(curl -Ls "https://github.com/DominicBreuker/pspy/releases/latest" | grep 'pspy64"' | cut -d '"' -f 2)
winPEASx64_exe_url=$(curl -Ls "https://github.com/carlospolop/PEASS-ng/releases/latest" | grep "/carlospolop/PEASS-ng/releases/download/" | grep "winPEASx64.exe" | cut -d '"' -f 2)
winPEAS_bat_url=$(curl -Ls "https://github.com/carlospolop/PEASS-ng/releases/latest" | grep "/carlospolop/PEASS-ng/releases/download/" | grep "winPEAS.bat" | cut -d '"' -f 2)
linpeas_url=$(curl -Ls "https://github.com/carlospolop/PEASS-ng/releases/latest" | grep "/carlospolop/PEASS-ng/releases/download/" | grep "linpeas.sh" | cut -d '"' -f 2)
chisel_linux_url=$(curl -Ls "https://github.com/jpillora/chisel/releases/latest" | grep "/jpillora/chisel/releases/download/" | grep "linux_amd64" | cut -d '"' -f 2)
chisel_windows_url=$(curl -Ls "https://github.com/jpillora/chisel/releases/latest" | grep "/jpillora/chisel/releases/download/" | grep "windows_amd64" | cut -d '"' -f 2)

echo "[3/34] Downloading additionnals packages"
apt-get -qq install -y --allow-downgrades open-vm-tools open-vm-tools-desktop zsh zsh-autosuggestions nfs-common default-mysql-client dnsenum libssl-dev libkrb5-dev libffi-dev python-dev-is-python3 build-essential jq exploitdb colortest ftp snmp hashid > /dev/null 2&>1

echo "[4/34] Downloading SecLists"
wget -q https://github.com$secLists_url -O /tmp/tmp_downloads/SecLists.tar.gz

echo "[5/34] Downloading Ghidra"
wget -q https://github.com$ghidra_url -O /tmp/tmp_downloads/ghidra.zip

echo "[6/34] Downloading chisel_linux"
wget -q https://github.com$chisel_linux_url -O /tmp/tmp_downloads/chisel_linux.gz

echo "[7/34] Downloading chisel_windows"
wget -q https://github.com$chisel_windows_url -O /tmp/tmp_downloads/chisel_windows.gz

echo "[8/34] Downloading pspy"
wget -q https://github.com$pspy64_url -O /opt/binaries/pspy

echo "[9/34] Downloading winPEAS.exe"
wget -q https://github.com$winPEASx64_exe_url -O /opt/binaries/winPEASx64.exe

echo "[10/34] Downloading winPEAS.bat"
wget -q https://github.com$winPEAS_bat_url -O /opt/binaries/winPEAS.bat

echo "[11/34] Downloading linpeas"
wget -q https://github.com$linpeas_url -O /opt/binaries/linpeas

echo "[12/34] Downloading terminator's config"
wget -q https://raw.githubusercontent.com/ZGlydHl4/Parrot-OS-Setup/master/config -O /home/parrot/.config/terminator/config

echo "[13/34] Downloading oh-my-zsh fonts"
wget -q https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -O "/home/parrot/.local/share/fonts/MesloLGS NF Bold Italic.ttf"
wget -q https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -O "/home/parrot/.local/share/fonts/MesloLGS NF Italic.ttf"
wget -q https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -O "/home/parrot/.local/share/fonts/MesloLGS NF Bold.ttf"
wget -q https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -O "/home/parrot/.local/share/fonts/MesloLGS NF Regular.ttf"

echo "[14/34] Downloading oh-my-zsh installer"
wget -q https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O /tmp/tmp_downloads/oh-my-zsh_install.sh

echo "[15/34] Downloading oh-my-zsh config file"
wget -q https://raw.githubusercontent.com/ZGlydHl4/Parrot-OS-Setup/master/.p10k.zsh -O /tmp/tmp_downloads/.p10k.zsh

echo "[16/34] Downloading zsh config file"
wget -q https://raw.githubusercontent.com/ZGlydHl4/Parrot-OS-Setup/master/.zshrc -O /tmp/tmp_downloads/.zshrc

echo "[17/34] Downloading vscode"
wget -q https://code.visualstudio.com/docs/?dv=linux64_deb -O /tmp/tmp_downloads/vscode.deb

echo "[18/34] Downloading pwndbg"
git clone https://github.com/pwndbg/pwndbg /home/parrot/pwndbg > /dev/null 2>&1

echo "[19/34] Downloading CrackMapExec"
git clone https://github.com/Porchetta-Industries/CrackMapExec /home/parrot/CrackMapExec > /dev/null 2>&1

echo "[20/34] Downloading BurpSuite"
wget -q "https://portswigger-cdn.net/burp/releases/download?type=Linux" -O /tmp/tmp_downloads/burpsuite.sh

echo "[21/34] Preparing for installation"
chown -R parrot:parrot /tmp/tmp_downloads

echo "[22/34] Installing rockyou"
gzip -d /usr/share/wordlists/rockyou.txt.gz

echo "[23/34] Installing SecLists"
mkdir -p /opt/wordlists/SecLists \
  && tar xf /tmp/tmp_downloads/SecLists.tar.gz -C /opt/wordlists/SecLists --strip-components 1

echo "[24/34] Installing Ghidra"
unzip /tmp/tmp_downloads/ghidra.zip -d /opt/ > /dev/null 2>&1 \
  && mv /opt/ghidra_* /opt/Ghidra \
  && alias ghidra=/opt/Ghidra/ghidraRun

echo "[25/34] Installing chisel"
gzip -d /tmp/tmp_downloads/chisel_linux.gz \
  && mv /tmp/tmp_downloads/chisel_linux /opt/binaries/chisel_linux

gzip -d /tmp/tmp_downloads/chisel_windows.gz \
  && mv /tmp/tmp_downloads/chisel_windows /opt/binaries/chisel_windows

echo "[26/34] Installing sublime-text"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add - > /dev/null 2>&1 \
  && apt-get -qq install apt-transport-https -y > /dev/null 2>&1 \
  && echo "deb https://download.sublimetext.com/ apt/stable/" > /etc/apt/sources.list.d/sublime-text.list \
  && apt-get -qq update -y > /dev/null 2>&1 \
  && apt-get -qq install sublime-text -y > /dev/null 2>&1

echo "[27/34] Installing vscode"
dpkg -i /tmp/tmp_downloads/vscode.deb > /dev/null 2&>1

echo "[28/34] Installing CrackMapExec"
cd /home/parrot/CrackMapExec; poetry install > /dev/null 2&>1; poetry run crackmapexec > /dev/null 2&>1

echo "[29/34] Installing pwndbg"
apt-get -qq autoremove --purge -y gdb > /dev/null 2&>1 \
  && rm -rf /usr/share/gdb \
  && chown -R parrot:parrot /home/parrot/pwndbg \
  && sudo -H -u parrot /home/parrot/pwndbg/setup.sh > /dev/null 2&>1

echo "[30/34] Installing oh-my-zsh"
chmod +x /tmp/tmp_downloads/oh-my-zsh_install.sh \
  && sed -i 's/RUNZSH=${RUNZSH:-yes}/RUNZSH=${RUNZSH:-no}/g' /tmp/tmp_downloads/oh-my-zsh_install.sh \
  && sudo -H -u parrot /tmp/tmp_downloads/oh-my-zsh_install.sh

echo "[31/34] Downloading powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-/home/parrot/.oh-my-zsh/custom}/themes/powerlevel10k > /dev/null 2>&1

echo "[32/34] Installing powerlevel10k"
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' /home/parrot/.zshrc \
&& mv /tmp/tmp_downloads/.p10k.zsh /home/parrot/.p10k.zsh \
&& rm /home/parrot/.zshrc \
&& mv /tmp/tmp_downloads/.zshrc /home/parrot/.zshrc \

echo "[33/34] Installing BurpSuite"
chmod +x /tmp/tmp_downloads/burpsuite.sh \
  && /tmp/tmp_downloads/burpsuite.sh

echo "[34/34] Finalizing installation"
chown -R parrot:parrot /opt/

echo "[!] Please reboot to make all changes applies !"
