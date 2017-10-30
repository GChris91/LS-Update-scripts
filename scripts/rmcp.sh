#! /bin/bash

# Config

 VALID="ok3.txt"
 ERROR="nok3.txt"

 PATHEXTRACT=/var/www/

 SRCDIR=/var/www/
# DESTDIR=/var/www/
 FILENAMERM="limesurvey"
 FILENAMECALL="extract.sh"

# Methods

remove(){

	#DELETE DIRECTORY

        if [ -z "${1}" ]; then

        cmd="rm -Rf ${FILENAMERM}"
        echo "Removing ${FILENAMERM}: ${cmd}"

                else cmd="rm -Rf ${1}"
                echo "Removing ${1} : ${cmd}"
        fi

        eval ${cmd}
        if [ $? -eq 0 ]
        then
          echo "Successfully delete file" >> ${VALID}
        else
          echo "Could not delete file" >&2 >> ${ERROR}
        fi


    echo "END"
}


callSh(){

	#CALL SCRIPT

        if [ -z "${1}" ]; then

        cmd="./${FILENAMECALL}"
        echo "Calling script ${FILENAMECALL} : ${cmd}"

                else cmd="./${1}"
                echo "Calling script ${1} : ${cmd}"
        fi

        eval ${cmd}
        if [ $? -eq 0 ]
        then
          echo "Successfully started scrit" >> ${VALID}
        else
          echo "Could not start script" >&2 >> ${ERROR}
        fi


    echo "END"
}


# Main


if [ -e "${VALID}" ]; then
        rm -f ${VALID}
fi

if [ -e "${ERROR}" ]; then
        rm -f ${ERROR}
fi

remove;
callSh;





















 
