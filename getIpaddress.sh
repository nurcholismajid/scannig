#!/bin/bash

for i in `cat $1`; do
   echo `dig +short $i` $i
done
