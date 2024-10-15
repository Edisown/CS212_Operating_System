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
products=~/res/IPSdataset.txt

#to make the display centered
center_text=~/my_funcs

while true
do
	clear
	center_text echo "Product Properties"
	center_text echo "======================="
	center_text echo "[PC] - Product Quantity per Category"
	center_text echo "[PS] - Product Count per Status"
	center_text echo "[CP] - Display Product by Category"
	center_text echo "[SP] - Display Product by Status"
	center_text echo "[APC] - Average Product Count per Category"
	center_text echo "(Press [Q] to quit)"
	center_text read -p "CHOICE: " choice

	if [[ "$hoice" =~ ^[Qq]$ ]]
	then
		clear;exit
	fi

	case "$choice" in
	[Pp][Cc])
		bash ~/extract_info_util/prod_quant_per_cat;;
	[Pp][Ss])
		bash ~/extract_info_util/prod_quant_per_stat;;
	[Cc][Pp])
		bash ~/extract_info_util/disp_prod_by_cat;;
	[Ss][Pp])
		bash ~/extract_info_util/disp_prod_by_stat;;
	[Aa][Pp][Cc])
		bash ~/extract_info_util/avg_prod_quant_per_cat;;
	*)
		center_text echo "-- Invalid Entry, Try again --"
		continue;;
	esac

	if test -z "$choice"
	then
		center_text echo "-- No entry, Try again --"
		continue
	fi
done
