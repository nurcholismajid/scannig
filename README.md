# Scannig

to get subdomain :
```Bash
curl -s https://crt.sh/?Identity=%.domain.com | grep ">*.domain.com" | sed 's/<[/]*[TB][DR]>/\n/g' | grep -vE "<|^[\*]*[\.]*domain.com" | sort -u | awk 'NF'
```

to get headers from each subdomain :
```
# get an header using
curl -I domain.com

# get headers from each subdomain using
for i in `cat subdomain.txt`; do 
	curl -I -s $i;
done | vim - 
```

to get ip address :
```Bash
# get an ip address
dig +short domain.com

# looping for discover all ip address's subdomain
for i in `cat subdomain.txt`; do
  echo `dig +short $i`, $i
done | vim -
```

usage : 
```Shell
./getSubdomain.sh example.com | vim subdomain.txt
./getHeaders.sh subdomain.txt
```
