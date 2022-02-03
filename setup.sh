apt-get update -y
apt-get dist-upgrade -y
apt-get upgrade -y
gzip -d /usr/share/wordlists/rockyou.txt.gz
wget -c https://github.com/danielmiessler/SecLists/archive/master.zip -O /usr/share/wordlists/SecList.zip \
    && unzip /usr/share/wordlists/SecList.zip -y \
    && rm -f /usr/share/wordlists/SecList.zip
wget -c https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_10.1.2_build/ghidra_10.1.2_PUBLIC_20220125.zip -O /usr/share/ghidra_10.1.2_PUBLIC_20220125.zip \
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
wget -c https://code.visualstudio.com/docs/?dv=linux64_deb -O /home/Downloads/vs-code.deb \
    && dpkg -i /home/Downloads/vs-code.deb
git clone https://github.com/longld/peda.git /home/peda \
    && echo "source /home/peda/peda.py" >> /home/.gdbinit \
    && echo "DONE! debug your program with gdb and enjoy"
systemctl start postgresql \
    && msfdb init
apt-get install exploitdb -y
mkdir /home/binaries
wget -c https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy64 -O /home/binaries/pspy64 \
    && chmod +x /home/binaries/pspy64
wget -c https://github.com/carlospolop/PEASS-ng/releases/download/20220203/linpeas_linux_amd64 -O /home/binaries/linpeas \
    && chmod +x /home/binaries/linpeas
wget -c https://github.com/carlospolop/PEASS-ng/releases/download/20220203/winPEASx64.exe -O /home/binaries/winPEAS.exe
wget -c https://github.com/andrew-d/static-binaries/raw/master/binaries/linux/x86_64/ncat -O /home/binaries/ncat \
    && chmod +x /home/binaries/ncat
wget -c https://github.com/int0x33/nc.exe/raw/master/nc64.exe -O /home/binaries/ncat.exe
