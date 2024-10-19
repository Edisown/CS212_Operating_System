#!bin/bash
#==================================================
# Script Name	:	extract_info.sh
# By		:	Xymond Louisse M. Alcazar
# Group Name	:	Team Lemar
# Purpose	:	a script that extracts
#			specific informaiton in the
#			products dataset.
#==================================================

# script for center_text
source ./res/my_funcs

while true
do
	clear
	echo -e "\n\n\n\n\n\n"
	center_text "Product Properties"
	center_text "=================="
	center_text "[PC] - Product Count per Category"
	center_text "[PS] - Product Count per Status"
	center_text "[CP] - Display Product by Category"
	center_text "[SP] - Display Product by Status"
	center_text "[APC] - Average Product Count per Category"
	echo ""
	center_text "(Press [Q] to quit)"
	echo ""
	read -p "$(center_text 'CHOICE: ')" choice

	if [[ "$choice" =~ ^[Qq]$ ]]
	then
		clear;exit
	fi

	case "$choice" in
	[Pp][Cc])
		bash ./prod_quant_per_cat;;
	[Pp][Ss])
		bash ./prod_quant_per_stat;;
	[Cc][Pp])
		bash ./disp_prod_by_cat;;
	[Ss][Pp])
		bash ./disp_prod_by_stat;;
	[Aa][Pp][Cc])
		bash ./avg_prod_quant_per_cat;;
	*)
		center_text "-- Invalid Entry, Try again --"
		continue;;
	esac

	if test -z "$choice"
	then
		center_text "-- No entry, Try again --"
		continue
	fi
done
