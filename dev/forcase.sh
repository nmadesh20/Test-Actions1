#!/bin/bash
FILE_DIR=/Users/madeshnagaraj/Learn/Develop/Git-work/Test-Actions1/dev/
cd $FILE_DIR
echo $FILE_DIR
for file in $(ls *yml) ; do 
    case $file in
        role.yml)
            if [[ -s $FILE_DIR/role.yml ]];then
            echo "role.yml file is available"
            else
            echo "role.yml file is empty or not available"
            fi
            ;;
        rolebinding.yml)
            if [[ -s $FILE_DIR/rolebinding.yml ]];then
            echo "rolebinding.yml file is available"
            else
            echo "rolebinding.yml file is not available"
            fi
            ;;
        networkpolicy.yml)
            if [[ -s $FILE_DIR/networkpolicy.yml ]];then
            echo "networkpolicy.yml file is available"
            else
            echo "networkpolicy.yml file is not available"
            fi
            ;;
    esac
done