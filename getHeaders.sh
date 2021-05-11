for i in `cat $1`; do 
	
	curl -I -s $i;

done | vim - 
