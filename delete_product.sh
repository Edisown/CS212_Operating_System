#!/bin/bash
#===============================================
# Name: Jhorone Lance M. Roxas
# Date: Oct 15, 2024 
# TODO: To Create a delete Method for the
# InventoryManagementSystem.
#===============================================
source ./my_funcs
products=~/res/products.txt

delete_product(){
    # Prompt the user for the product name to delete
    read -p "$(center_text 'Enter the Name of the Product to Delete: ')" product_name
    # Search for the product in the file
    record=$(grep "$product_name" "$products")

    if [ -z "$record" ]; then
        center_text "No record found for $product_name."
        return
    fi

    # Extract fields from the record
    product_id=$(echo "$record" | cut -d':' -f1)
    product_name=$(echo "$record" | cut -d':' -f2)
    product_category=$(echo "$record" | cut -d':' -f3)
    product_supplier=$(echo "$record" | cut -d':' -f4)
    product_price=$(echo "$record" | cut -d':' -f5)
    product_quantity=$(echo "$record" | cut -d':' -f6)
    product_sales=$(echo "$sales" | cut -d':' -f7)

   
    # Display formatted output
    center_text "========================================== <Y/>="
    center_text "Product ID:         $product_id"
    center_text "Product Name:       $product_name"
    center_text "Category:           $product_category"
    center_text "Supplier:           $product_supplier"
    center_text "Price:              $product_price"
    center_text "Quantity:           $product_quantity"
    center_text "Sales:              $product_sales"
    center_text "=========================================="

    # Confirm deletion
    read -p "$(center_text 'Do you want to delete this product? <Y/N>: ')" proceed

    # Proceed with deletion if confirmed
    if [[ "$proceed" == "Y" || "$proceed" == "y" ]]; then
        # Delete the record by filtering out the product from the file
        grep -v "$product_name" "$products" > temp && mv temp "$products"
        center_text "Product deleted successfully."
    else
        center_text "Product deletion canceled."
    fi
}

