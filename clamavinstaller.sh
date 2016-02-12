#!/bin/bash
printf "
#############################
#  Ubuntu Clamav Installer  #
#############################
#################################
#This script MUST be run as root#
#################################
##############################################################
# Welcome, This script will install scipts for you and stuff #
##############################################################\n\n"
function questions() {
  read -p "Would you like to install Clamav? [y/n] " answerInstallClamav
  read -p "Would you like to a run clamav scan? [y/n] " answerRunClamavScan
}
questions

if [[ $answerInstallClamav = y ]] ; then
  apt-get update
  apt-get install clamav
  freshclam
fi

if [[ $answerRunClamavScan = y ]] ; then
  clamscan -r /tmp /root /etc /home
fi

function pause () {
read -p "$*"
}
pause '
press [Enter] key to exit...
'

  
