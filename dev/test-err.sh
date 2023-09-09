#!/bin/bash
# Call func function on exit

# Read the files and folders of the current directory list using for loop
for i  in *
do
  echo "error $i
done

err_report() {
  echo "errexit on line $(caller)" >&2
}

trap err_report ERR