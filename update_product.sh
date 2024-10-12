#!bin/bash
#==================================================
# Script Name:		updateProduct.sh
# By:			Edison M. Malasan
# Purpose:		a method that update the quantity of a certain product
#
#Command Line:		update_product.sh
#==================================================
products=~/res/products.txt

update_product(){
   read -p "$(center_text 'Enter the Name of the Product: ')" product_name
   record=$(grep "$product_name""$PRODUCTNAME")

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
  product_minStock=$(echo "$record" | cut -d':' -f7)

  # Display formatted output
  center_text
  "============================================================= <Y/=="
    center_text "Last Name:        $product_id"
    center_text "First Name:       $product_name"
    center_text "Middle Initial:   $product_category"
    center_text "Dept#:            $product_supplier"
    center_text "Job Title:        $product_price"
    center_text "Date Hired:       $product_quantity"
    center_text "Job Status:       $product_minStock"
    center_text "==============================================================="

  read -p "$(center_text 'Do you want to proceed?<Y/N>: ')" proceed

}
