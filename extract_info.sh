#!bin/bash
#==================================================
# Script Name	:	extract_info.sh
# By		:	Xymond Louisse M. Alcazar
# Group Name	:	Team Lemar
# Purpose	:	a script that extracts
#			specific informaiton in the
#			products dataset.
# Command Line	:	extract_info.sh
#==================================================
products=~/IPSdataset.txt

# script for center_text
source ./my_funcs

while true
do
	clear
	echo -e "\n\n\n\n\n\n"
	center_text "Product Properties"
	center_text "=================="
	center_text "[PC] - Product Quantity per Category"
	center_text "[PS] - Product Count per Status"
	center_text "[CP] - Display Product by Category"
	center_text "[SP] - Display Product by Status"
	center_text "[APC] - Average Product Count per Category"
	center_text "(Press [Q] to quit)"
	read -p "$(center_text 'CHOICE: ')" choice

	if [[ "$choice" =~ ^[Qq]$ ]]
	then
		clear;exit
	fi

	case "$choice" in
	[Pp][Cc])
		bash ./extract_info_util/prod_quant_per_cat;;
	[Pp][Ss])
		bash ./extract_info_util/prod_quant_per_stat;;
	[Cc][Pp])
		bash ./extract_info_util/disp_prod_by_cat;;
	[Ss][Pp])
		bash ./extract_info_util/disp_prod_by_stat;;
	[Aa][Pp][Cc])
		bash ./extract_info_util/avg_prod_quant_per_cat;;
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
