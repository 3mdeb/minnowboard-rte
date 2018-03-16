#/bin/bash

if [ $# != 2 ]; then

	echo "Incorrect number of arguments."
	echo "Correct syntax:"
	echo "	./start.sh <RTE_IP> <ROM_FILE_NAME>"

fi 

rte_ip=$1
rom_file=$2

robot -b debug.log -L TRACE -v rte_ip:$rte_ip -v ROM_file:$rom_file rom_flash.robot 

