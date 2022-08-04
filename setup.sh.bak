#! /bin/bash

apt-get remove --autoremove burpsuite -y \
    && apt-get purge burpsuite -y
apt-get autoremove -y
apt-get update -y
apt-get full-upgrade -y
apt-get install open-vm-tools open-vm-tools-desktop zsh zsh-autosuggestions -y
systemctl start postgresql \
    && msfdb init
wget "https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.5.1&type=Linux" -O /home/parrot/Downloads/burpsuite.sh \
    && chmod +x /home/parrot/Downloads/burpsuite.sh \
    && /home/parrot/Downloads/burpsuite.sh
gzip -d /usr/share/wordlists/rockyou.txt.gz
wget -c https://github.com/danielmiessler/SecLists/archive/refs/tags/2022.2.zip -O /usr/share/wordlists/SecList.zip \
    && unzip /usr/share/wordlists/SecList.zip -d /usr/share/wordlists/ \
    && mv /usr/share/wordlists/SecLists-2022.2 /usr/share/wordlists/SecLists \
    && rm -f /usr/share/wordlists/SecList.zip
wget -c https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_10.1.4_build/ghidra_10.1.4_PUBLIC_20220519.zip -O /usr/share/ghidra_10.1.4_PUBLIC_20220519.zip \
    && unzip /usr/share/ghidra_10.1.4_PUBLIC_20220519.zip -d /usr/share/ghidra_10.1.4_PUBLIC_20220519 \
    && rm -f /usr/share/ghidra_10.1.4_PUBLIC_20220519.zip
wget -c https://out7.hex-rays.com/files/idafree77_linux.run -O /home/parrot/Downloads/idafree77_linux.run
chmod +x /home/parrot/Downloads/idafree77_linux.run
/home/parrot/Downloads/idafree77_linux.run
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - \
    && apt-get install apt-transport-https -y \
    && echo "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list \
    && apt-get update -y \
    && apt-get install sublime-text -y
apt-get autoremove --purge -y gdb \
    && rm -rf /usr/share/gdb \
    && git clone https://github.com/pwndbg/pwndbg /home/parrot/pwndbg \
    && chown -R parrot:parrot /home/parrot/pwndbg \
    && sudo -H -u parrot /home/parrot/pwndbg/setup.sh
mkdir /home/parrot/binaries
chown -R parrot:parrot /home/parrot/binaries
wget -c https://github.com/DominicBreuker/pspy/releases/latest/download/pspy64 -O /home/parrot/binaries/pspy64 \
    && chmod +x /home/parrot/binaries/pspy64
wget -c https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas_linux_amd64 -O /home/parrot/binaries/linpeas \
    && chmod +x /home/parrot/binaries/linpeas
wget -c https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEASx64.exe -O /home/parrot/binaries/winPEAS.exe
wget -c https://github.com/andrew-d/static-binaries/raw/master/binaries/linux/x86_64/ncat -O /home/parrot/binaries/ncat \
    && chmod +x /home/parrot/binaries/ncat
wget -c https://github.com/int0x33/nc.exe/raw/master/nc64.exe -O /home/parrot/binaries/ncat.exe
wget -c https://github.com/jpillora/chisel/releases/latest/download/chisel_1.7.7_linux_amd64.gz -O /home/parrot/binaries/chisel_1.7.7_linux_amd64.gz \
    && gzip -d /home/parrot/binaries/chisel_1.7.7_linux_amd64.gz \
    && mv /home/parrot/binaries/chisel_1.7.7_linux_amd64 /home/binaries/chisel \
    && chmod +x /home/parrot/binaries/chisel
wget -c https://github.com/jpillora/chisel/releases/latest/download/chisel_1.7.7_windows_amd64.gz -O /home/parrot/binaries/chisel_1.7.7_windows_amd64.gz \
    && gzip -d /home/parrot/binaries/chisel_1.7.7_windows_amd64.gz \
    && mv /home/parrot/binaries/chisel_1.7.7_windows_amd64 /home/binaries/chisel.exe
mkdir -p /home/parrot/.local/share/fonts
wget -c https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -O "/home/parrot/.local/share/fonts/MesloLGS NF Bold Italic.ttf"
wget -c https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -O "/home/parrot/.local/share/fonts/MesloLGS NF Italic.ttf"
wget -c https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -O "/home/parrot/.local/share/fonts/MesloLGS NF Bold.ttf"
wget -c https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -O "/home/parrot/.local/share/fonts/MesloLGS NF Regular.ttf"
mkdir -p /home/parrot/.config/terminator
wget -c https://raw.githubusercontent.com/ZGlydHl4/Parrot-OS-Setup/master/config -O /home/parrot/.config/terminator/config
wget -c https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O /home/parrot/Downloads/install.sh \
    && chmod +x /home/parrot/Downloads/install.sh \
    && sed -i 's/RUNZSH=${RUNZSH:-yes}/RUNZSH=${RUNZSH:-no}/g' /home/parrot/Downloads/install.sh \
    && sudo -H -u parrot /home/parrot/Downloads/install.sh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-/home/parrot/.oh-my-zsh/custom}/themes/powerlevel10k \
    && sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' /home/parrot/.zshrc \
    && wget -c https://raw.githubusercontent.com/ZGlydHl4/Parrot-OS-Setup/master/.p10k.zsh -O /home/parrot/.p10k.zsh \
    && chown -R parrot:parrot /home/parrot/.p10k.zsh \
    && rm /home/parrot/.zshrc \
    && wget -c https://raw.githubusercontent.com/ZGlydHl4/Parrot-OS-Setup/master/.zshrc -O /home/parrot/.zshrc \
    && chown -R parrot:parrot /home/parrot/.zshrc
