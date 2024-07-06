#!/bin/bash

# Crear directorio para scripts si no existe
mkdir -p ~/setup_and_installation_scripts

# Instalar curl
sudo apt install curl -y

# Descargar e instalar la clave GPG para Brave Browser
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

# Añadir el repositorio de Brave Browser
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

# Actualizar los repositorios
sudo apt update

# Instalar Brave Browser
sudo apt install brave-browser -y

# Instalar i3
sudo apt install i3 -y

# Instalar bumblebee-status
sudo apt install bumblebee-status -y

# Descargar e instalar la clave GPG para Brave Browser (repetido)
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

# Añadir el repositorio de Brave Browser (repetido)
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

# Instalar Vim
sudo apt-get install vim -y

# Instalar Neovim
sudo apt-get install neovim -y

# Instalar Git
sudo apt-get install git -y

# Actualizar los repositorios (repetido)
sudo apt update

# Instalar Brave Browser (repetido)
sudo apt install brave-browser -y

# Instalar Rofi
sudo apt-get install rofi -y

# Instalar Node.js y npm para desarrollo en JavaScript
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs

# Instalar Python y pip
sudo apt-get install -y python3 python3-pip

# Instalar entornos virtuales para Python
sudo apt-get install -y python3-venv

# Instalar Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env

# Instalar Go
wget https://golang.org/dl/go1.16.4.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.16.4.linux-amd64.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.profile
source ~/.profile

# Limpiar archivos descargados
rm go1.16.4.linux-amd64.tar.gz

# Instalar Visual Studio Code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt update
sudo apt install code -y

# Instalar Docker
# Agregar la clave GPG oficial de Docker
sudo apt-get update
sudo apt-get install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Agregar el repositorio a las fuentes de Apt
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo usermod -aG docker $USER

# Instalar herramientas adicionales
sudo apt-get install -y build-essential
sudo apt-get install -y tmux
sudo apt-get install -y htop
sudo apt-get install -y tree

# Instalar netifaces para Python
pip3 install netifaces

# Instalar Powerline y el tema Dracula
pip3 install powerline-status
git clone https://github.com/dracula/powerline.git ~/.config/powerline/themes/dracula

# Configurar Powerline con el tema Dracula
mkdir -p ~/.config/powerline
echo "
{
    \"ext\": {
        \"shell\": {
            \"theme\": \"dracula\"
        },
        \"tmux\": {
            \"theme\": \"dracula\"
        },
        \"vim\": {
            \"theme\": \"dracula\"
        }
    }
}
" > ~/.config/powerline/config.json

# Instalar Anaconda
curl -O https://repo.anaconda.com/archive/Anaconda3-2022.05-Linux-x86_64.sh
bash Anaconda3-2022.05-Linux-x86_64.sh -b
source ~/.bashrc

# Crear y activar un entorno con conda
conda create --name myenv python=3.8 -y
conda activate myenv

# Instalar paquetes en el entorno conda
conda install numpy pandas matplotlib -y

# Instalar picom, feh, xprintidle, redshift, compton, flameshot, simplescreenrecorder
sudo apt-get install -y picom feh xprintidle redshift compton flameshot simplescreenrecorder

# Instalar snapd y corregir dependencias
sudo apt-get install -y squashfs-tools ibus
sudo apt --fix-broken install -y
sudo apt-get install -y snapd

# Instalar oh-my-zsh
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Confirmar instalaciones
echo "Instalación completada. Las versiones de los programas instalados son:"
brave-browser --version
i3 --version
vim --version
nvim --version
git --version
node --version
npm --version
python3 --version
pip3 --version
rustc --version
cargo --version
go version
code --version
docker --version
tmux -V
htop --version
tree --version
conda --version
picom --version
feh --version
xprintidle --version
redshift -V
compton --version
flameshot --version
simplescreenrecorder --version
zsh --version

