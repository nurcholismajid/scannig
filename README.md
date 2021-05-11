# Scannig

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
