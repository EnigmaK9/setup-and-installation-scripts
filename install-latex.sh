#!/bin/bash

# Actualizar la lista de paquetes
sudo apt update

# Instalar texlive y texlive-full
sudo apt install -y texlive texlive-full

# Instalar otros paquetes útiles para LaTeX
sudo apt install -y texlive-latex-extra texlive-fonts-recommended texlive-fonts-extra texlive-science

# Instalar pdflatex
sudo apt install -y texlive-latex-base

# Instalar otras herramientas necesarias
sudo apt install -y latexmk biber

# Verificar la instalación
echo "Verificando la instalación..."
pdflatex --version
latexmk --version
biber --version

echo "La instalación de LaTeX y herramientas relacionadas ha finalizado."

# Finalizar
echo "¡Listo! Todo debería estar instalado correctamente."

