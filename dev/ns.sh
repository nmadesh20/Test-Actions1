#!/bin/bash
on_error(){
  echo "Error occurred on $(caller)" >&2
}
 
trap 'on_error' ERR

kubectl create -f namespace.yml > /dev/null
status=$?