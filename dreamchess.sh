#!/bin/bash

# Actualizar lista de paquetes
sudo apt update

# Instalar Cmake
sudo apt install -y cmake

# Instalar Bison
sudo apt install -y bison

# Instalar Flex
sudo apt install -y flex

# Instalar Gettext
sudo apt install -y gettext

# Instalar SDL 2.0
sudo apt install -y libsdl2-dev

# Instalar SDL Image 2.0
sudo apt install -y libsdl2-image-dev

# Instalar SDL Mixer 2.0
sudo apt install -y libsdl2-mixer-dev

# Instalar Expat
sudo apt install -y libexpat1-dev

# Instalar GLEW
sudo apt install -y libglew-dev

# Instalar Freetype
sudo apt install -y libfreetype6-dev

# Limpiar la lista de paquetes
sudo apt clean

echo "Instalación completa de todas las herramientas y bibliotecas."

