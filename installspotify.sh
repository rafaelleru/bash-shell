#!/bin/bash
#guion para automatizar la instalacion de spotify tras la instalacion de un sistema unix

sudo add-apt-reposytory "deb http://repository.spotify.com stable non-free"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59
sudo apt-get update
sudo apt-get install spotify-client
