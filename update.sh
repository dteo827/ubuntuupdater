#!/bin/bash
cp /etc/apt/sources.list /etc/apt/sources.list.bak
echo ## EOL Upgrade sources.list  > /etc/apt/sources.list

echo deb http://archive.ubuntu.com/ubuntu/ hardy main restricted universe multiverse >> /etc/apt/sources.list
echo deb http://archive.ubuntu.com/ubuntu/ hardy-updates main restricted universe multiverse >> /etc/apt/sources.list
echo deb http://security.ubuntu.com/ubuntu/ hardy-security main restricted universe multiverse >> /etc/apt/sources.list

echo deb http://archive.ubuntu.com/ubuntu/ hardy-backports main restricted universe multiverse >> /etc/apt/sources.list
echo deb http://archive.ubuntu.com/ubuntu/ hardy-proposed main restricted universe multiverse >> /etc/apt/sources.list

sudo aptitude update && sudo aptitude safe-upgrade

sudo do-release-upgrade
