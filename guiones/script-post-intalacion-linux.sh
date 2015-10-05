#Autor Rafa Layva Ruiz
#https://github.com/rafaelleru
#licencia GNU

!#/bin/bash

#el script debe ser ejecutado como root
if [[ ! $(whoami) = "root" ]]; then
    echo "Por favor ejecutame como root."
    exit 1
fi

mkdir /instalacion && cd instalacion

case $(cut -d ' ' -f 1 /etc/issue | head -n 1) in
  "Fedora")

    #Instala todos los programas basicos tras la instalacion de Fedora 22

    #Primero hace un update completo del sistema
    dnf update

    #ahora instalamos fedy
    bash -c "curl http://folkswithhats.org/fedy-installer -o fedy-installer && chmod +x fedy-installer && ./fedy-installer"

    #ahora procedemos a instalar el cliente de spotify para fedora
    #primero instalamos la utilidad wget para acceder a github
    dnf -y install wget
    #añadimos el repositorio del instalador
    wget -P /etc/yum.repos.d/ https://raw.github.com/kuboosoft/postinstallerf/master/postinstallerf.repo
    #instalamos el cliente
    dnf -y install spotify-client

    #instalamos atom, un editor de texto mas completo que gedit
    wget https://github.com/atom/atom/releases/tag/v1.0.19/atom.x86_64.rpm
    dnf -y install atom.x86_64.rpm

    #instalamos el paquete de herramientas de desarrollo, que trae muchas utilidades
    dnf group install "development tools"

    #instalamos el paquete eclipse
    dnf group install "Fedora Eclipse"

    #instalamos el paquete con las herramientas de ofimatica libreOffice
    dnf group install "LibreOficce"

    #instalamos el gestor de tweaks para GNOME
    dnf install gnome-tweak-tool

    #instalamos el tema Arc
    #cd /etc/yum.repos.d/
    #wget http://download.opensuse.org/repositories/home:Horst3180/Fedora_22/home:Horst3180.repo
    #yum install arc-theme

    #instalar chrome
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
    dnf -y install google-chrome-stable_current_x86_64.rpm
    rm google-chrome-stable_current_x86_64.rpm

    #por si hay un doble icono de chrome
    mv -f /usr/share/applications/google-chrome.desktop /usr/share/applications/google-chrome-stable.desktop

    #Instalar wxMaxima
    dnf -y install wxMaxima
  "Ubuntu")

    git clone https://github.com/rafaelleru/bash-shell.git


    #instalar spotify
    chmod +x ./bash-shell/installspotify.sh
    ./bash-shell/installspotify.sh

    #instalar gcc para compilar programas en c y c++
    apt-get install gcc

    #instalar atom
    wget https://atom.io/download/deb
    dpkg -i  atom*.deb
    rm atom*.deb

    rm -r ./bash-shell

    #instalar eclipse
    echo "por favor descarga el paquete eclipse desde la web: 'www.eclipse.org/downloads'"
    chmod +x ./bash-shell/installeclipse&java.sh
    ./bash-shell/installeclipse&java.sh

    #borrar los archivos temporales
    rm -f ./bash-shell
esac
