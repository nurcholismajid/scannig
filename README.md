# Scannig

to get subdomain :
```Bash
curl -s https://crt.sh/?Identity=%.domain.com | grep ">*.domain.com" | sed 's/<[/]*[TB][DR]>/\n/g' | grep -vE "<|^[\*]*[\.]*domain.com" | sort -u | awk 'NF'
```

to get headers from each subdomain :
```Bash
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


## Recon

untuk memudahkan bagi para security researchers untuk melakukan pentest pada website, contohnya scope yang dapat dilakukan pentest, policy, contact, etc.
source [securitytxt.org](https://securitytxt.org/), [](https://en.wikipedia.org/wiki/Security.txt)
> /.well-known/security.txt

digunakan untuk memberitahu web spiders bagaimana cara untuk scraping website tersebut, source [Robots Exclusion Standard](https://en.wikipedia.org/wiki/Robots_exclusion_standard)
> /robots.txt

cari tau bagaimana website mengatasi page yang not found mungkin saja ada informasi bocor pada website tersebut, cara ini digunakan sebelum kita bruteforce directory. 
> 404/Not Found

pada sebuah website hal yang pertama kali ditampilkan adalah `index` dari website tersebut, sedangkan jika `index` itu tidak ditemukan maka akan tampil `directory listing` yang dimana biasanya menyimpan informasi penting. **untuk menemukan directory listing kita buka source codenya kemudian cari directory tempat menyimpan sebuah file**. source [Directory Listing Information Disclosure](https://www.acunetix.com/blog/articles/directory-listing-information-disclosure/)
> Directory Listing

check beberapa directory yang menarik sebelum melakukan bruteforcing, seperti `/admin/`
> Interesting directories

