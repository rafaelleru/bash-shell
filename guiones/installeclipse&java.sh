#!/bin/bash
#guion para instalar java 8 y eclipse luna en sistemas linux
#como requisito habra que tener descargado el archivo de eclipse comprimido desde su pagina
#y pegar lo siguiente en la entrada que se abre en el editor de textos:
#[Desktop Entry]
#Name=Eclipse 4
#Type=Application
#Exec=/opt/eclipse/eclipse
#Terminal=false
#Icon=/opt/eclipse/icon.xpm
#Comment=Integrated Development Environment
#NoDisplay=false
#Categories=Development;IDE;
#Name[en]=Eclipse

su

apt-get purge openjdk*
add-apt-repository ppa:webupd8team/java
apt-get update
apt-get install oracle-java8-installer

cd /opt/ &&  tar -zxvf ~/Descargas/eclipse*.tar.gz

gedit /usr/share/applications/eclipse.desktop &
