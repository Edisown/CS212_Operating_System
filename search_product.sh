#!/bin/bash
#==========================================================
#Author		: 	Espartinas, Carl Angelo B.
#File Name 	: 	search_product.sh
#Purpose	: 	Allow User to search for specified 
#			product in the inventory
#==========================================================

products=~/res/IPdataset.txt

source ./my_funcs
clear

center_text "Enter the Product ID you want to search forr: "
read number
echo
grep $ProductID $products | tr ':' ' '
echo
center_text "Press ENTER to continue..."
read contnue
