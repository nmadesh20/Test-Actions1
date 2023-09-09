#!/bin/bash
function1() {
        echo "this is function 1 $1"
        global cluster = 1000
        #function2 $(($1+1))
}
 
function2() {
        function1 $(($1+1))
        echo "This is function 2 $cluster"
}
 
function2 5