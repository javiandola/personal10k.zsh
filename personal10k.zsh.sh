#!/bin/bash

#Colores
verde="\e[0;32m\033[1m"
rojo="\e[0;31m\033[1m"
azul="\e[0;34m\033[1m"
amarillo="\e[0;33m\033[1m"
morado="\e[0;35m\033[1m"
turquesa="\e[0;36m\033[1m"
gris="\e[0;37m\033[1m"
fin="\033[0m\e[0m"

path=$(readlink -e $0)
ruta=$(dirname $path)

#instalar powerlevel10k en la ruta del usuario
usuario=$(whoami)
cd /home/$usuario/
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
clear
echo -e "${amarillo}La configuracion del${fin} ${verde}$usuario${fin} ${amarillo}va a empezar en 5 segundos...${fin}"
sleep 5
zsh

#Sustituir el archivo de configuracion
rm -f .p10k.zsh
cp $ruta/.p10k.zsh_user /home/$usuario/.p10k.zsh


#instalar powerlevel10k en la ruta root
sudo bash $ruta/personal10k.zsh_root.sh
