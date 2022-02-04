apt-get update -y
apt-get dist-upgrade -y
apt-get upgrade -y
apt-get install exploitdb wpscan sshuttle -y
systemctl start postgresql \
    && msfdb init
apt-get install
gzip -d /usr/share/wordlists/rockyou.txt.gz
wget -c https://github.com/danielmiessler/SecLists/archive/master.zip -O /usr/share/wordlists/SecList.zip \
    && unzip /usr/share/wordlists/SecList.zip -y \
    && rm -f /usr/share/wordlists/SecList.zip
wget -c https://github.com/NationalSecurityAgency/ghidra/releases/latest/download/ghidra_10.1.2_PUBLIC_20220125.zip -O /usr/share/ghidra_10.1.2_PUBLIC_20220125.zip \
    && unzip /usr/share/ghidra_10.1.2_PUBLIC_20220125.zip \
    && rm -f /usr/share/ghidra_10.1.2_PUBLIC_20220125.zip
wget -c https://out7.hex-rays.com/files/idafree77_linux.run -O /home/Downloads/idafree77_linux.run
chmod +x /home/Downloads/idafree77_linux.run
/home/Downloads/idafree77_linux.run
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - \
    && apt-get install apt-transport-https \
    && echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list \
    && apt-get update -y \
    && apt-get install sublime-text -y
git clone https://github.com/longld/peda.git /home/peda \
    && echo "source /home/peda/peda.py" >> /home/.gdbinit \
    && echo "DONE! debug your program with gdb and enjoy"
mkdir /home/binaries
wget -c https://github.com/DominicBreuker/pspy/releases/latest/download/pspy64 -O /home/binaries/pspy64 \
    && chmod +x /home/binaries/pspy64
wget -c https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas_linux_amd64 -O /home/binaries/linpeas \
    && chmod +x /home/binaries/linpeas
wget -c https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEASx64.exe -O /home/binaries/winPEAS.exe
wget -c https://github.com/andrew-d/static-binaries/raw/master/binaries/linux/x86_64/ncat -O /home/binaries/ncat \
    && chmod +x /home/binaries/ncat
wget -c https://github.com/int0x33/nc.exe/raw/master/nc64.exe -O /home/binaries/ncat.exe
wget -c https://github.com/jpillora/chisel/releases/latest/download/chisel_1.7.7_linux_amd64.gz -O /home/binaries/chisel_1.7.7_linux_amd64.gz \
    && gzip -d /home/binaries/chisel_1.7.7_linux_amd64.gz \
    && mv /home/binaries/chisel_1.7.7_linux_amd64 /home/binaries/chisel \
    && chmod +x /home/binaries/chisel
wget -c https://github.com/jpillora/chisel/releases/latest/download/chisel_1.7.7_windows_amd64.gz -O /home/binaries/chisel_1.7.7_windows_amd64.gz \
    && gzip -d /home/binaries/chisel_1.7.7_windows_amd64.gz \
    && mv /home/binaries/chisel_1.7.7_windows_amd64 /home/binaries/chisel.exe
mkdir -p $HOME/.local/share/fonts
wget -c https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -O "$HOME/.local/share/fonts/MesloLGS NF Bold Italic.ttf"
wget -c https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -O "$HOME/.local/share/fonts/MesloLGS NF Italic.ttf"
wget -c https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -O "$HOME/.local/share/fonts/MesloLGS NF Bold.ttf"
wget -c https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -O "$HOME/.local/share/fonts/MesloLGS NF Regular.ttf"
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -e 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k/powerlevel10k"' $HOME/.zshrc
mkdir -p $HOME/.config/terminator
wget -c https://raw.githubusercontent.com/ZGlydHl4/Parrot-OS-Setup/master/config -O $HOME/.config/terminator/config