#!/bin/bash

#updateFile: lib.sh

############################
#    LimeSurvey Plugin     #
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

#Error Management


############################



############################
#                          #
#         LIBRARY          #
#                          #
############################


#SEND MAIL
mailAlert(){
    
    mail -a "Content-Type: text/plain; charset=UTF-8" -s "${mailSubject}" "${adminMail}" < ${mailContent}

}


#GET DATESTAMP
datestamp(){
 
    date +"%Y.%m.%d"
}


#GET TIMESTAMP
timestamp(){

    date +"%T"
}


#STRING TO STRING
strstr(){
 
    echo $1 | grep --quiet $2
}


#MANAGE ERRORS
error(){

    if [ "${status}" -ne "0" ]; then
        mailContent="Erreur function $myFunction"
        mailAlert
        exit 2;
    fi

}


############################
#                          #
#         UPDATING         #
#                          #
############################


#BACKUP LIMESURVEY FOLDER FROM SERVER
backup(){

myFunction='backup'


    #Compress/Archive LimeSurvey File
#    if [ -z "${1}" ]; then

        cmd="tar -czvf ${backedupFile} ${desDir}limesurvey"
        echo "Backing up ${backedupFile} to ${dstDir} : ${cmd} >> ${log}"
        eval ${cmd} >> ${log} 2>&1
        
#    else
#        cmd="tar -zcvf ${backedupFile} ${1}"
#        echo "Backing up ${backedupFile} to ${dstDir} : ${cmd} >> ${log}"
#        eval ${cmd} >> ${log} 2>&1
#    fi

    
    #Copy File to Host
#    cmd="scp -r ${srcDir}${backupFile} ${srcDir}${configFile} ${srcDir}${uploadFile} gchris@192.168.56.1:${destDir}"
#    echo "Copying files : ${cmd}"


#    status=$?
#    error;

}


#COPY FROM VM TO HOST
copyToHost(){

    cmd="scp ${srcDir}${backedupFile} ${serverUser}@${server}:${backupDir}"
    echo "Copying ${srcDir}${backedupFile} to Host Machine ${backupDir} : ${cmd} >> ${log}"
    eval ${cmd} >> ${log} 2>&1

    cmd="scp -r ${srcDir}${uploadFile}upload/ ${srcDir}${configFile}/config ${serverUser}@${server}:${backupDir}"
    echo "Copying ${srcDir}${uploadFile} and ${srcDir}${configFile} to Host Machine ${backupDir} : ${cmd} >> ${log}"
    eval ${cmd} >> ${log} 2>&1


    status=$?
    error;

}


#REMOVE DIRECTORY
removeDir(){

myFunction='removeDir'

#    if [ -z "${1}" ]; then

        cmd="rm -Rf ${srcDir}limesurvey/"
        echo "Removing ${srcDir}/limesurvey/ directory : ${cmd} >> ${log}"

#    else
#        cmd="rm -Rf ${1}"
#        echo "Removing ${1} : ${cmd}"
#    fi
    eval ${cmd} >> ${log} 2>&1


    if [ $? -eq 0 ]; then
    
        echo "Successfully deleted directory" >> ${log}
    else
        echo "Could not delete directory" >&2 >> ${log}
    fi

}


#CONNECT TO HOST IN SSH
sshHost(){

myFunction='sshHost'

    ssh ${hostUser}@${host}

    
    status=$?
    error;

}


#COPY UPDATE FILE FROM HOST TO SERVER
copyUpdateToServer(){

MyFunction='copyUpdateToServer'

    cmd="scp /home/gchris/Téléchargements/${updateFile} ${serverUser}@${server}:${srcDir}"
    echo "Copying ${updateFile} to Server ${srcDir} : ${cmd} >> ${log}"
    eval ${cmd} >> ${log} 2>&1


    status=$?
    error;

}


#COPY SAVED FILES FROM HOST TO SERVER
copyFilesToServer(){

MyFunction='copyFilesToServer'

    cmd="scp /home/gchris/limesurvey.backups/upload/ ${serverUser}@${server}:${srcDir}/limesurvey"
    echo "Copying upload directory to Server ${srcDir} : ${cmd} >> ${log}"
    eval ${cmd} >> ${log} 2>&1


    cmd="scp /home/gchris/limesurvey.backups/config/ ${serverUser}@${server}:${srcDir}/limesurvey/application"
    echo "Copying config directory to Server ${srcDir} : ${cmd} >> ${log}"
    eval ${cmd} >> ${log} 2>&1


    status=$?
    error;

}


#COPY FROM HOST TO SERVER
copyToServer(){

MyFunction='copyToServer'

    cmd="scp /home/gchris/Téléchargements/${updateFile} ${serverUser}@${server}:${srcDir}"
    echo "Copying ${updateFile} to Server ${srcDir} : ${cmd} >> ${log}"
    eval ${cmd} >> ${log} 2>&1

    #disconnect ssh


    status=$?
    error;

}


#EXTRACT ARCHIVE
extract(){

myFunction='extract'

#    if [ -z "${1}" ]; then

        cmd="tar -xvf ${srcDir}${updateFile}"
        echo "Extracting ${updateFile} to ${srcDir} : ${cmd}"

#    else cmd="cd / && tar -xvf ${SRCDIR}${1}"
#        echo "Extracting ${SRCDIR}${1} : ${cmd}"
#    fi

    eval ${cmd}
    
    
    if [ $? -eq 0 ]; then

        echo "Successfully extracted file {updateFile}" >> ${log}
    else
        echo "Could not extract file ${updateFile}" >&2 >> ${log}
    fi


    status=$?
    error;

}

#REPLACES FILES CONFIG AND UPLOAD
replaceFiles(){

myFunction='replaceFiles'

    cmd="scp /home/gchris/Téléchargements/${updateFile} ${serverUser}@${server}:${srcDir}"
    echo "Copying ${updateFile} to Server ${srcDir} : ${cmd} >> ${log}"
    eval ${cmd} >> ${log} 2>&1

    #disconnect ssh


    status=$?
    error;

}                          


#CALL SCRIPT
callSh(){

#    if [ -z "${1}" ]; then

    cmd="ssh ${hostUser}@${host} 'bash -s' < /home/gchris/limesurvey.backups/sendUpdateFile.sh"
    echo "Calling script ${script} : ${cmd} >> ${log}"
    eval ${cmd} >> ${log} 2>&1


#    else cmd="./${1}"
#        echo "Calling script ${1} : ${cmd}"
#    fi

    eval ${cmd}
    
    if [ $? -eq 0 ]; then
        echo "Successfully started script" >> ${log}
    
    else
        echo "Could not start script" >&2 >> ${log}
    fi

}




############################

############################
#                          #
#         THE END          #
#                          #
############################
