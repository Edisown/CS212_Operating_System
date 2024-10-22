#!/bin/bash
#==========================================================
#Author		: 	Espartinas, Carl Angelo B.
#File Name 	: 	search_product.sh
#Purpose	: 	Allow User to search for specified 
#			product in the inventory
#==========================================================

DATA_FILE=./res/IPSdataset.txt

source ./res/my_funcs
clear
echo -e "\n\n\n\n\n"
# Check if the data file exists
if [ ! -f "$DATA_FILE" ]; then
    echo "Data file not found!"
    read -p "$(center_text 'Press [ENTER] to Continue...')" # Only waits for ENTER key
    exit 1
fi

<<<<<<< Updated upstream
# Prompt user for search input
read -p "$(center_text 'Enter search term (Product ID/Product Name/Category/Supplier): ')" search_term

# Search and display matching products
center_text "Searching for '$search_term'..."
=======
    # Prompt user for search input
    center_text "============================================================"
    center_text "---------------------  Search Product  ---------------------"
    center_text "============================================================"
    echo ""
    read -p "$(center_text 'Enter search term (Product ID, Name, Category, or Supplier): ')" search_term

    # Search and display matching products
    echo ""
    center_text "Searching for '$search_term'..."
    echo ""
>>>>>>> Stashed changes

# Use grep to search for matching entries (case insensitive)
results=$(grep -i "$search_term" "$DATA_FILE")

<<<<<<< Updated upstream
if [ -z "$results" ]; then
    center_text "No matching products found."
else
    center_text "==========================================="
    center_text "             Matching Products             "
    center_text "==========================================="
    echo "$results" | while IFS=':' read -r product_id name category supplier price quantity sales allotment; do
        center_text "Product ID    : $product_id"
        center_text "Name          : $name"
        center_text "Category      : $category"
        center_text "Supplier      : $supplier"
        center_text "Price         : $price"
        center_text "Quantity      : $quantity"
        center_text "Sales         : $sales"
        center_text "---------------------------------------"
    done
fi
=======
    if [ -z "$results" ]; then
	center_text "---------------------------"
        center_text "No matching products found."
	center_text "---------------------------"
    else
	center_text "==========================================="
        center_text "		  Matching products:"
	center_text "==========================================="
        echo "$results" | while IFS=':' read -r product_id name category supplier price quantity sales; do
	    center_text "Product ID		: $product_id"
            center_text "Name		: $name"
            center_text "Category		: $category"
            center_text "Supplier		: $supplier"
            center_text "Price		: $price"
            center_text "Quantity		: $quantity"
            center_text "Sales		: $sales"
            center_text "---------------------------------------"
        done
    fi
>>>>>>> Stashed changes

echo ""
read -p "$(center_text 'Press [ENTER] to Continue...')"
