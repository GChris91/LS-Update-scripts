#!/bin/bash

#FILENAME: update.sh

############################
#    LimeSurvey Update     #
############################
#  Author   : GChris       #
#  Last Mod : 27/10/2017   #
############################

###########################

############################
#                          #
#         LEFTODO          #
#                          #
############################

#

###########################



############################
#                          #
#         SCRIPTS          #
#                          #
############################


cd /var/www/
. scripts/lib.sh
. scripts/config.sh

#backup
#copyToHost
#removeDir
#sshHost
#copyToServer
#extract
#replaceFiles
callSh

echo Fini >> ${log}

#cat ${log}
#rm -f ${lodg}

exit;



############################

############################
#                          #
#         THE END          #
#                          #
############################

