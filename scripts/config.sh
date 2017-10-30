#!/bin/bash

#FILENAME: config.sh

############################
#    LimeSurvey Update     #
############################
#  Author   : GChris       #
#  Last Mod : 27/10/2017   #
############################

############################

############################
#                          #
#         LEFTODO          #
#                          #
############################

#


############################

############################
#                          #
#         CONFIGS          #
#                          #
############################


#GLOBALES

export server=`hostname -s`
export log=/tmp/${0}.log
export adminMail="christophe.guerreschi@etudiant.univ-nc.nc"

export mailSubject="[$(datestamp)-$(timestamp)] Error: LimeSurvey Update."

#MYSQL

export myHost='vm';
export myUser='root';
export myPassword='password';
export myData='limesurveybdd';
export myTable='limesurvey_user_in_groups';

#Database Connection

export MySQL="mysql -u ${myUser} -p${myPassword} ${myData}"


#FILES

srcDir='/var/www/'
destDir='/var/www/'
backedupFile="[$(datestamp)]limesurvey.backup.tar.gz"
updateFile='limesurvey.Update.tar.gz'
configFile='limesurvey/application/'
uploadFile='limesurvey/'
backupDir="/home/gchris/limesurvey.backups/"



#UPDATE LIMESURVEY

export status="0"
export server='192.168.56.102'
export serverUser='root'
export host='192.168.56.1'
export hostUser='gchris'



#BACKUP

#Liste des fichier a sauvegarder



############################

############################
#                          #
#         THE END          #
#                          #
############################


