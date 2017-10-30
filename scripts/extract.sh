#! /bin/bash

# Config

 VALID="ok3.txt"
 ERROR="nok3.txt"

 SRCDIR=/var/www/limesurvey2.72.1+171012.tar.gz
 DESTDIR=/var/www/

# Methods

extract(){

        #EXTRACT

        if [ -z "${1}" ]; then
               
	cmd="cd / && tar -xvf ${SRCDIR}"
        echo "Extracting ${SRCDIR} : ${cmd}"

                else cmd="cd / && tar -xvf ${SRCDIR}${1}"
                echo "Extracting ${SRCDIR}${1} : ${cmd}"
        fi
        
        eval ${cmd}
        if [ $? -eq 0 ]
        then
          echo "Successfully created file" >> ${VALID}
        else
          echo "Could not create file" >&2 >> ${ERROR}
        fi

        
        echo "END"
}

# Main


if [ -e "${VALID}" ]; then 
        rm -f ${VALID}
fi

if [ -e "${ERROR}" ]; then
        rm -f ${ERROR}
fi

extract

