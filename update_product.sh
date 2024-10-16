#!bin/bash
#==================================================
# Script Name:		updateProduct.sh
# By:			Edison M. Malasan
# Purpose:		a method that update the quantity of a certain product
#
#Command Line:		update_product.sh
#==================================================
source ./my_funcs
products=~/res/products.txt

update_product(){
   read -p "$(center_text 'Enter the  of the Product: ')" product_id
   record=$(grep "$product_id""$products")

   if[-z "$record" ]; then
     center_text "No record found for $product_name."
     return
   fi

  #Extract fields from the record
  product_id=$(echo "$record" | cut -d':' -f1)
  product_name=$(echo "$record" | cut -d':' -f2)
  product_category=$(echo "$record" | cut -d':' -f3)
  product_supplier=$(echo "$record" | cut -d':' -f4)
  product_price=$(echo "$record" | cut -d':' -f5)
  product_quantity=$(echo "$record" | cut -d':' -f6)
  product_sales=$(echo "$record" | cut -d':' -f7)


  # Display formatted output
  center_text
  "==================================================================="
    center_text "Product ID":      $product_id"
    center_text "Product Name:     $product_name"
    center_text "Category:         $product_category"
    center_text "Supplier:         $product_supplier"
    center_text "Price:            $product_price"
    center_text "Quantity:         $product_quantity"
    center_text "Sales:            $product_sales"
    center_text "==============================================================="

  read -p "$(center_text 'Do you want to edit the quantity of the product?<Y/N>: ')" proceed
if [[!"$proceed"=1^[Yy]$]]; then
   return
fi

# Input the new quantity of the product
read -p "$(center_text 'New Quantity: ')" new_quantity

# Update the quantity record in the list
sed -i "s|\(^$product_id:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:\)[^:]*|\1$new_quantity|" "$products"
sed -i "s|\(^$phone_number:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:\)[^:]*|\1$new_status|" "$products"

  center_text
  "==================================================================="
                      New Update of The Product
  "==================================================================="
    center_text "Product ID":      $product_id"
    center_text "Product Name:     $product_name"
    center_text "Quantity:         $new_quantity"
    center_text "Sales:            $product_sales"
    center_text "==============================================================="


}
