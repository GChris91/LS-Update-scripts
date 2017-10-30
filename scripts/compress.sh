#! /bin/bash

# Config

 VALID="ok1.txt"
 ERROR="nok.txt"

# SRCDIR=/var/www/
# DESTDIR=/var/www/
 FILENAME="limesurvey.tar.gz"

# Methods

archive(){

	#ARCHIVAGE

	if [ -z "${1}" ]; then
		
	cmd="tar -zcvf ${FILENAME} /var/www/limesurvey"
	echo "Backing up ${FILENAME} to ${DESTDIR} : ${cmd}"

		else cmd="tar -zcvf ${FILENAME} ${1}"
		echo "Backing up ${FILENAME} to ${DESTDIR} : ${cmd}"
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

archive

