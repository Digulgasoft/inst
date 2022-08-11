#!/bin/bash

apt install curl -Y
clear
function msg {
  BRAN='\033[1;37m' && RED='\e[31m' && GREEN='\e[32m' && YELLOW='\e[33m'
  BLUE='\e[34m' && MAGENTA='\e[35m' && MAG='\033[1;36m' && BLACK='\e[1m' && SEMCOR='\e[0m'
  case $1 in
  -ne) cor="${RED}${BLACK}" && echo -ne "${cor}${2}${SEMCOR}" ;;
  -ama) cor="${YELLOW}${BLACK}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -verm) cor="${YELLOW}${BLACK}[!] ${RED}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -azu) cor="${MAG}${BLACK}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -verd) cor="${GREEN}${BLACK}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -bra) cor="${RED}" && echo -ne "${cor}${2}${SEMCOR}" ;;
  -nazu) cor="${COLOR[6]}${BLACK}" && echo -ne "${cor}${2}${SEMCOR}" ;;
  -gri) cor="\e[5m\033[1;100m" && echo -ne "${cor}${2}${SEMCOR}" ;;
  esac
}
function fun_bar {
  comando="$1"
  _=$(
    $comando >/dev/null 2>&1
  ) &
  >/dev/null
  pid=$!
  while [[ -d /proc/$pid ]]; do
    echo -ne " \033[1;33m["
    for ((i = 0; i < 20; i++)); do
      echo -ne "\033[1;31m##"
      sleep 0.5
    done
    echo -ne "\033[1;33m]"
    sleep 1s
    echo
    tput cuu1
    tput dl1
  done
  echo -e " \033[1;33m[\033[1;31m########################################\033[1;33m] - \033[1;32m100%\033[0m"
  sleep 1s
}
function print_center {
  if [[ -z $2 ]]; then
    text="$1"
  else
    col="$1"
    text="$2"
  fi

  while read line; do
    unset space
    x=$(((54 - ${#line}) / 2))
    for ((i = 0; i < $x; i++)); do
      space+=' '
    done
    space+="$line"
    if [[ -z $2 ]]; then
      msg -azu "$space"
    else
      msg "$col" "$space"
    fi
  done <<<$(echo -e "$text")
}

function title {
  clear
  msg -bar
  if [[ -z $2 ]]; then
    print_center -azu "$1"
  else
    print_center "$1" "$2"
  fi
  msg -bar
}

function stop_install {
  [[ ! -e /bin/pweb ]]  && {
    title "INSTALAÇÃO CANCELADA"
    clear
    exit;
 } || {
    title "INSTALAÇÃO CANCELADA"
    clear
    exit;
}
}

function os_system {
  system=$(cat -n /etc/issue | grep 1 | cut -d ' ' -f6,7,8 | sed 's/1//' | sed 's/      //')
  distro=$(echo "$system" | awk '{print $1}')

  case $distro in
  Debian) vercion=$(echo $system | awk '{print $3}' | cut -d '.' -f1) ;;
  Ubuntu) vercion=$(echo $system | awk '{print $2}' | cut -d '.' -f1,2) ;;
  esac
}
function dependencias {
  soft="python bc screen sshpass at nano unzip lsof netstat net-tools dos2unix nload jq curl figlet python3 python-pip cron"
   for i in $soft; do
    leng="${#i}"
    puntos=$((21 - $leng))
    pts="."
    for ((a = 0; a < $puntos; a++)); do
      pts+="."
    done
    msg -nazu "    INSTALANDO $i$(msg -ama "$pts")"
    if apt install $i -y &>/dev/null; then
      msg -verd " INSTALADO"
    else
      msg -verm2 " ERRO"
      sleep 2
      tput cuu1 && tput dl1
      print_center -ama "APLICANDO FIX A $i"
      dpkg --configure -a &>/dev/null
      sleep 2
      tput cuu1 && tput dl1

      msg -nazu "    INSTALANDO $i$(msg -ama "$pts")"
      if apt install $i -y &>/dev/null; then
        msg -verd " INSTALADO"
      else
        msg -verm2 " ERRO"
      fi
    fi
  done
}
apt install curl -y
echo "America/Sao_Paulo" > /etc/timezone
ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime > /dev/null 2>&1
dpkg-reconfigure --frontend noninteractive tzdata > /dev/null 2>&1
apt install figlet -y
clear
echo -e "\E[44;1;37m    INSTALANDO BOT WHATSAPP    \E[0m"
echo ""
echo -e "PLAY CONECT" | figlet
echo -e "                              \033[1;31mBy @play_conect\033[1;36m"
echo ""
chave=$(curl -sSL "https://raw.githubusercontent.com/Digulgasoft/inst/main/chave") &>/dev/null

read -p "DIGITE A CHAVE DE INSTALAÇÃO: " key
    
         if [[ "$key" = "$chave" ]]
          then
               echo -e "[*] VALIDANDO A CHAVE DE INSTALAÇÃO"
                sleep 2
                echo $key > /bin/chave_inst
                echo -e "[*] CHAVE ACEITA"
                sleep 2
            else
            echo "[-] ESSA CHAVE NÃO É VÁLIDA!"
            sleep 3
            clear
            cat /dev/null > ~/.bash_history && history -c
            rm /bin/ubuinst* > /dev/null 2>&1
            exit;
          fi
clear
msg -bar
echo -e 'by: @play_conect' >/usr/lib/telegram
echo -e "\e[1;97m           \e[5m\033[1;100m   INSTALADOR BOT WHATSAPP PLAY CONECT    \033[1;37m"
echo -e "\033[1;37m┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓\033[0m"
echo -e "\033[1;37m┃[ ! ] ESTA INSTALAÇÃO FORNECE UM CONJUNTO DE FERRAMENTAS PARA\033[38;5;197m\033[38;5;197m\033[1;37m ┃\E[0m"
echo -e "\033[1;37m┃[ ! ] GESTÃO E IMPLEMENTAÇÃO DO BOT WHATSAPP PARA UBUNTU 18\033[38;5;197m\033[38;5;197m\033[1;37m   ┃\E[0m"
echo -e "\033[1;37m┃[ ! ] O USUÁRIO É RESPONSAVEL A QUALQUER DANO/MÁ UTILIZAÇÃO.\033[38;5;197m\033[38;5;197m\033[1;37m  ┃\E[0m"
echo -e "\033[1;37m┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛\033[0m"
  msg -ne "┗━┫ VAMOS INICIAR? [S/N]: "
  read opcion
  [[ "$opcion" != @(s|S) ]] && stop_install
  clear && clear
  os_system
  msg -bar


curl -sL https://deb.nodesource.com/setup_18.x -o /tmp/nodesource_setup.sh
sudo bash /tmp/nodesource_setup.sh
clear
node -v
npm -v
sudo apt install build-essential -y
apt install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source ~/.bashrc
clear
nvm ls
nvm install v16.15.1
nvm install v18.3.0
nvm install v14.19.2
nvm alias default v16.15.1
nvm alias default v18.3.0
nvm alias default v14.19.2
nvm use v18.3.0
nvm use v14.19.2
nvm use v16.15.1
export NVM_DIR="$HOME/.nvm
nvm reinstall-packages v16.14.2
nvm ls
npm ls -g --depth=0.
npm outdated -g --depth=0.
npm update -g
npm rebuild
nvm ls-remote
nvm install v16.13.1 -y
clear
nvm use v16.13.1
node -v
nvm ls
nvm alias default 16.13.1
nvm use default
npm install express -y
npm install -g express -y
~/.nvm/versions/node/16.13.1/lib/node_modules/express
clear
npm link express
nvm help
apt update
apt upgrade
clear
apt install git -y
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
~/.bash_profile, ~/.zshrc, ~/.profile, or ~/.bashrc
bash
. ~/.nvm/nvm.sh
nvm
apt-get install ruby -y
apt-get install lolcat -y
apt install libwebp-dev -y
apt install ffmpeg -y
apt install wget -y
apt install tesseract-ocr
apt install graphicsmagick
apt install imagemagick -y
apt install curl
sudo apt update
sudo apt install nodejs -y
clear
node -v
sudo apt install npm -y
apt install nvm -y
nvm list-remote
nvm install v16.14.0
nvm install lts/fermium -y
clear
node -v
cd ~
clear
curl -sL https://deb.nodesource.com/setup_18.x | sudo bash -
sudo bash nodesource_setup.sh
clear
node -v
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh
apt install nvm -y
nvm list-remote
nvm install v16.14.0
nvm install lts/fermium
clear
node -v
sudo apt install nodejs -y
node -v
sudo apt install npm -y
cd ~
sudo bash nodesource_setup.sh
clear
node -v
sudo bash nodesource_setup.sh
sudo apt install nodejs
apt install nvm -y
nvm list-remote
nvm install v16.14.0
nvm install lts/fermium
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh
clear
node -v
sudo bash nodesource_setup.sh
sudo apt install nodejs -y
clear
wget http://93.188.166.246/conexaozapssh.zip > /dev/null 2>&1
clear
apt-get install unzip > /dev/null 2>&1
unzip conexaozapssh.zip > /dev/null 2>&1
clear
cd conexaozapssh
apt-get install install.sh -y
sh start.sh
