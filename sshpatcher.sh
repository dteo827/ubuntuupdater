#!/bin/bash
#          #############################################
#            openssh tampered package detection script 
#          #############################################
#
#                                        Red Hat, Inc.   August, 2008
#
# This script can be executed to detect whether a package on the local
# system matches one of the tampered OpenSSH packages which were
# signed using the Red Hat signing key.
#
# Please see https://www.redhat.com/security/data/openssh-blacklist.html
#
# This bash script can be executed as a non-root user, or as root.  To
# execute the script after downloading it, run the command:
#
#     $ bash ./openssh-blacklist-1.0.sh
#
# If the script output includes any lines beginning with "ALERT" then
# a malicious package has been found on the system.  Otherwise, if no
# suspect packages were found, the script should produce only a single
# line of output beginning with the word "PASS".
#
# Alternatively, the script can be passed a list of RPM filenames:
#
#     $ bash ./openssh-blacklist-1.0.sh some.i386.rpm other.src.rpm
#
# the signature of each RPM (binary or source) will be checked against
# the blacklist and a "PASS" or "ALERT" message issued accordingly.
#
# The signed tampered packages were:
#
# openssh-3.9p1-8.RHEL4.24 for i386, x86_64 architecture
# openssh-3.9p1-9.el4 for i386, x86_64 architecture
# openssh-4.3p2-26 for x86_64 architecture
# openssh-4.3p2-26.el5 for x86_64 architecture
#
### Ends.

function questions() {
	read -p "Would you like to patchSSH? [y/n] " answerPatchSSH
}
questions

if [[ $answerPatchSSH = y ]] ; then
	echo 'UseRoaming no' | sudo tee -a /etc/ssh/ssh_config
fi

exit ${retval}
