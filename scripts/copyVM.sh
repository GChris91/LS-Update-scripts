#! /bin/bash

# Config

# VALID="ok1.txt"
# ERROR="nok.txt"

 SRCDIR=/var/www/
 DESTDIR=/home/gchris/Bureau/test/
 FILENAME1=limesurvey.tar.gz
 FILENAME2=limesurvey/application/config/
 FILENAME3=limesurvey/upload/


# Methods

copyVM(){

	#COPY
		
	cmd="scp -r ${SRCDIR}${FILENAME1} ${SRCDIR}${FILENAME2} ${SRCDIR}${FILENAME3} gchris@192.168.56.1:${DESTDIR}"
	echo "Copying files : ${cmd}"
	
	eval ${cmd}
#	if [ $? -eq 0 ]
#	then
#	  echo "Successfully created file" >> ${VALID}
#	else
#	  echo "Could not create file" >&2 >> ${ERROR}
#	fi

	
	echo "END"
}

# Main


# if [ -e "${VALID}" ]; then 
# 	rm -f ${VALID}
# fi
 
# if [ -e "${ERROR}" ]; then
#         rm -f ${ERROR}
# fi

copyVM

