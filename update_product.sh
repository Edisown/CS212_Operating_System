#!/bin/bash
#==================================================
# Script Name:		updateProduct.sh
# By:			Edison M. Malasan
# Purpose:		A method that updates the quantity of a certain product
#
# Command Line:		update_product.sh
#==================================================
source ./res/my_funcs
products=./res/IPSdataset.txt

# Prompt for the product ID
read -p "$(center_text 'Enter the Product ID: ')" product_id

# Find the record in the products file
record=$(grep "^$product_id:" "$products")

# Check if the record exists
if [ -z "$record" ]; then
  center_text "No record found for the Product ID: $product_id."
  return
fi

# Extract fields from the record
product_id=$(echo "$record" | cut -d':' -f1)
product_name=$(echo "$record" | cut -d':' -f2)
product_category=$(echo "$record" | cut -d':' -f3)
product_supplier=$(echo "$record" | cut -d':' -f4)
product_price=$(echo "$record" | cut -d':' -f5)
product_quantity=$(echo "$record" | cut -d':' -f6)
product_sales=$(echo "$record" | cut -d':' -f7)
allotment_for_product=$(echo "$record" | cut -d':' -f8)

# Display current product details
center_text "==================================================================="
center_text "Product ID:      $product_id"
center_text "Product Name:    $product_name"
center_text "Category:        $product_category"
center_text "Supplier:        $product_supplier"
center_text "Price:           $product_price"
center_text "Quantity:        $product_quantity"
center_text "Sales:           $product_sales"
center_text "Allotment:       $allotment_for_product"
center_text "==================================================================="

# Ask if the user wants to update the product quantity
read -p "$(center_text 'Do you want to edit the quantity of the product? (Y/N): ')" proceed
if [[ ! "$proceed" =~ ^[Yy]$ ]]; then
  return
fi

# Input the new quantity of the product
read -p "$(center_text 'New Quantity: ')" new_quantity

# Check if the new quantity is greater than the current quantity
if (( new_quantity > product_quantity )); then
  # Calculate the difference and add it to the sales
  added_sales=$((new_quantity - product_quantity))
  new_sales=$((product_sales + added_sales))
else
  # If new quantity is less or equal, sales remain the same
  new_sales=$product_sales
fi

# Update the 6th field (quantity) in the file using sed
sed -i "s|\(^$product_id:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:\)[^:]*|\1$new_quantity|" "$products"

# Update the 7th field (sales) in the file using sed
sed -i "s|\(^$product_id:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:\)[^:]*|\1$new_sales|" "$products"

# Display updated product details
center_text "==================================================================="
center_text "                      New Update of The Product                    "
center_text "==================================================================="
center_text "Product ID:      $product_id"
center_text "Product Name:    $product_name"
center_text "Quantity:        $new_quantity"
center_text "Sales:           $new_sales"
center_text "Allotment:       $allotment_for_product"
center_text "==================================================================="
