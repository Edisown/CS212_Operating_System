#!bin/bash
#==================================================
# Script Name:		extract_info.sh
# By:			Xymond Louisse M. Alcazar
# Group Name:		Team Lemar
# Purpose:		a method that extracts
#			specific informaiton in the
#			products dataset
#Command Line:		extract_info.sh
#==================================================
products=~/res/products.txt

#to make the display centered
center_text() {
	local text=$1
	local width=$(tput cols)
	local spaces=$((width / 3))
	printf "%${spaces}s%s\n" "" "$text"
}
