#!/bin/bash
printf "
#############################
#  Ubuntu Script Installer  #
#############################
#################################
#This script MUST be run as root#
#################################
##############################################################
# Welcome, This script will install scipts for you and stuff #
##############################################################\n\n"
function questions() {
read -p "Would you like to install updated sources? [y/n] " answerUpdateSources
read -p "Do you want to download clamavinstaller? [y/n] " answerInstallClamavInstaller
read -p "Would you like to update path? [y/n] " answerUpdatePath
}
questions

if [[ $answerUpdateSources = y ]] ; then
  cat /etc/apt/sources.list > /root/oldsources.list
  echo "deb http://old-releases.ubuntu.com/ubuntu/ hardy main restricted universe multiverse\n deb http://old-releases.ubuntu.com/ubuntu/ hardy-updates main restricted universe multiverse\n deb http://old-releases.ubuntu.com/ubuntu/ hardy-security main restricted universe multiverse\n deb http://old-releases.ubuntu.com/ubuntu/ hardy-backports main restricted universe multiverse\n > /etc/apt/sources.list
fi  

if [[ $answerInstallClamavInstaller = y ]] ; then
  wget raw.githubusercontent.com/DragonDefenders/ubuntuupdater/master/clamavinstaller.sh --no-check-certificate -O /root/clamavinstaller.sh
fi

if [[ $answerUpdatePath = y ]] ; then
  PATH=$PATH /sbin/
fi

function pause () {
read -p "$*"
}
pause '
press [Enter] key to exit...
'
