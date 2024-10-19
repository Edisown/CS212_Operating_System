#!bin/bash
#====================================================
# Script Name	:	InventoryManagementSystem.sh
# By		:	Xymond Louisse M. Alcazar
# Group		:	Team Lemar
# Purpose	:	The main menu of the inventory
#			management system program.
#=====================================================

#center_text function
source ./res/my_funcs
while true
do
	clear
	echo -e "\n\n\n\n\n"
	center_text "-- Inventory Management System --"
	center_text "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
	echo ""
	center_text "[A] - Add Product Information"
	center_text "[D] - Display All Products"
	center_text "[M] - Modify Product Details"
	center_text "[R] - Remove Product"
	center_text "[S] - Search for Product"
	center_text "[P] - Product Properties"
	center_text "[X] - Exit Program"
	echo ""
	read -p "$(center_text 'CHOICE: ')" choice

	if [[ "$choice" =~ ^[Xx]$ ]]
	then
		clear;exit
	fi

	case "$choice" in
	[Aa])
		bash add_product.sh;;
	[Dd])
		bash show_product.sh;;
	[Mm])
		bash update_product.sh;;
	[Rr])
		bash delete_product.sh;;
	[Ss])
		bash search_product.sh;;
	[Pp])
		bash extract_info.sh;;
	*)
		echo "Invalid Entry, Choose the corresponding letter of the function."
		continue;;
	esac
done
