#!/bin/bash
#guion para automatizar la instalacion de spotify tras la instalacion de un sistema unix
#ejecutar como su o con sudo ./<nombre_guion>

#autor Rafael Leyva Ruiz
#Actualizado: 11/2/15

add-apt-repository "deb http://repository.spotify.com stable non-free"
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59
apt-get update
apt-get -y install spotify-client
