#!/bin/bash
#==========================================================
# Author        : Roxas, Jhorone Lance M.
# File Name     : delete_product.sh
# Purpose       : Allow the user to search and delete a 
#                 specific product from the inventory.
#==========================================================

DATA_FILE=./res/IPSdataset.txt  # Path to the dataset file

source ./res/my_funcs  # Load external functions (e.g., center_text)
clear
echo -e "\n\n\n\n\n"

# Check if the data file exists
if [ ! -f "$DATA_FILE" ]; then
    center_text "Data file not found!"
    exit 1
fi

# Prompt user for a search term to find products to delete
read -p "$(center_text 'Enter search term (Product ID, Name, Category, Supplier, etc.): ')" search_term

# Search for matching products using grep (case-insensitive)
results=$(grep -i "$search_term" "$DATA_FILE")

if [ -z "$results" ]; then
    center_text "No matching products found."
    exit 0
else
    center_text "===================================================================="
    center_text "                         Matching Products:                         "
    center_text "===================================================================="
    
    # Display matching products with numbering for selection
    echo "$results" | nl -w2 -s'. ' | while read -r num line; do
        # Split the line into variables using ':' as the delimiter
        IFS=':' read -r product_id name category supplier price quantity sales maximum_Threshhold_capacity Status <<< "$line"
        center_text "[$num] "
        center_text "                    Product ID    : $product_id"
        center_text "                    Name          : $name"
        center_text "                    Category      : $category"
        center_text "                    Supplier      : $supplier"
        center_text "                    Price         : $price"
        center_text "                    Quantity      : $quantity"
        center_text "                    Sales         : $sales"
        center_text "     Maximum Threshhold capacity  : $maximum_Threshhold_capacity"
        center_text "                    Status        : $Status"
        center_text "----------------------------------------------------------------"
    done

    # Loop until a valid product number or 'Q/q' is entered
    while true; do
        read -p "$(center_text 'Enter the product number to delete (or press Q to quit): ')" choice


       # Check if the user wants to quit
       if [[ "$choice" =~ ^[Qq]$ ]]; then
           center_text "Exiting deletion process. No products were deleted."
           exit 0 
        fi

       # Check if the input is blank or non-numeric
       if [[ -z "$choice" ||! "$choice" =~ ^[0-9]+$ ]]; then
           center_text "Invalid input. Please enter a valid product number."
           continue # prompt the user again
       fi

     # Extract the selected product
       selected=$(echo "$results" | sed -n "${choice}p")

       if [ -z "$selected"]; then
           center_text "No product found for the selected number."
      else
         break #valid selection; proceed to confirmation
        fi
     done

    # Confirm deletion
    center_text "------------------------------------------------------------"
    center_text "You selected:"
    IFS=':' read -r product_id name category supplier price quantity sales maximum_Threshhold_capacity Status <<< "$selected"
    center_text "Product ID                   : $product_id"
    center_text "Name                         : $name"
    center_text "Category                     : $category"
    center_text "Supplier                     : $supplier"
    center_text "Price                        : $price"
    center_text "Quantity                     : $quantity"
    center_text "Sales                        : $sales"
    center_text "Maximum Threshhold capacity  : $maximum_Threshhold_capacity"
    center_text "Status                       : $Status" 
    center_text "------------------------------------------------------------"

    read -p "$(center_text 'Do you really want to delete this product? <Y/N>: ')" confirm

    if [[ "$confirm" =~ ^[Yy]$ ]]; then
        # Delete the product from the data file using sed
        sed -i "/^$product_id:/d" "$DATA_FILE"
        center_text "Product '$name' has been successfully deleted."
    else
        center_text "Deletion canceled."
    fi
fi
