#!/bin/bash 
## iftest.sh - Check file permissions and information
#
echo -n "Enter your file : "
read file
#
## 1. Check if file exists
if [ ! -e "$file" ]; then
    echo "File not found"
        exit 1
        fi

#        # 2. Check Read and Write permission
        if [ -r "$file" ] && [ -w "$file" ]; then
            echo "$file : He has the right to Read and Writing"
            else
                echo "$file : No permission"
                fi
#
#                # 3. Number of links
                links=$(ls -l "$file" | awk '{print $2}')
                echo "Number of links : $links"
                echo "==================================="
#
#                # 4. File Owner
                owner=$(ls -l "$file" | awk '{print $3}')
                echo "this Owner : $owner"
                echo "==================================="
#
#                # 5. File Group
                group=$(ls -l "$file" | awk '{print $4}')
                echo "this group : $group"
                echo "===================================="
#
#                # 6. File Size
                size=$(ls -l "$file" | awk '{print $5}')
                echo "File Size : $size"
                echo "===================================="
#
#                # 7. Date and Time
                date=$(ls -l "$file" | awk '{print $6, $7, $8}')
                echo "Time and Date : $date"
                echo "===================================="

                # 8. Number of lines
                lines=$(wc -l < "$file")
                echo "The number of lines in the file : $lines"
                echo "===================================="

                # 9. Last 5 lines
                echo "The last five lines in the file >>"
                tail -5 "$file" | nl
                echo " <<"
                echo "====================================="
                echo "===================================="

                # 10. Warning if root found inside file
                if grep -q "root" "$file"; then
                    echo "WARNING: Found 'root' inside file"
                    fi
