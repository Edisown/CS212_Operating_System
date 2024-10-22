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
	center_text "[PCC] - Product Count per Category"
	center_text "[TSP] - Top Selling Products"
	center_text "[DPC] - Display Product by Category"
	center_text "[DPS] - Display Product by Status"
	echo ""
	center_text "(Press [Q] to quit)"
	echo ""
	read -p "$(center_text 'CHOICE: ')" choice

	if [[ "$choice" =~ ^[Qq]$ ]]
	then
		clear;exit
	fi

	case "$choice" in
	[Pp][Cc][Cc])
		bash ./prod_quant_per_cat;;
	[Tt][Ss][Pp])
		bash ./top_selling_products;;
	[Dd][Pp][Cc])
		bash ./disp_prod_by_cat;;
	[Dd][Pp][Ss])
		bash ./display_prod_by_status;;
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
