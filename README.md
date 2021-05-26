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
No   | Title
---- | ----
1.   | [Security.txt](#securitytxt)
2.   | [Robots.txt](#robotstxt)
3.   | [404 Not Found](#404-not-found-page)
4.   | [Directory Listing (Index of)](#directory-listing-index-of)
5.   | [Interesting Directories](#interesting-directories)
6.   | [Bruteforce Directories](#bruteforce-directories)


### Security.txt
Untuk memudahkan bagi para security researchers untuk melakukan pentest pada website, contohnya scope yang dapat dilakukan pentest, policy, contact, etc.
source [securitytxt.org](https://securitytxt.org/), [](https://en.wikipedia.org/wiki/Security.txt)
> /.well-known/security.txt

### Robots.txt
Digunakan untuk memberitahu web spiders bagaimana cara untuk scraping website tersebut, source [Robots Exclusion Standard](https://en.wikipedia.org/wiki/Robots_exclusion_standard)
> /robots.txt

### 404 Not Found Page
Cari tau bagaimana website mengatasi page yang not found mungkin saja ada informasi bocor pada website tersebut, cara ini digunakan sebelum kita bruteforce directory. 
> 404/Not Found

### Directory Listing (index of)
Pada sebuah website hal yang pertama kali ditampilkan adalah `index` dari website tersebut, sedangkan jika `index` itu tidak ditemukan maka akan tampil `directory listing` yang dimana biasanya menyimpan informasi penting. **untuk menemukan directory listing kita buka source codenya kemudian cari directory tempat menyimpan sebuah file**. source [Directory Listing Information Disclosure](https://www.acunetix.com/blog/articles/directory-listing-information-disclosure/)
> Directory Listing

### Interesting Directories
Check beberapa directory yang menarik sebelum melakukan bruteforcing, seperti `/admin/`
> Interesting directories

### Bruteforce Directories
Gunakan [FFUF](https://github.com/ffuf/ffuf), [Wfuzz](https://github.com/xmendez/wfuzz), dan tools sejenisnya untuk bruteforce directories webserver, saya disini menggunakan [FFUF](https://github.com/ffuf/ffuf) berikut penggunaan sederhananya :

```Bash
ffuf -w /path/to/wordlist.txt -u http://127.0.0.1:8080/FUZZ -o output.txt -replay-proxy http://127.0.0.1:8080/

> -w : untuk memanggil wordlist
> -u : target host dan FUZZ merupakan parameter untuk bruteforce
> -o : untuk output
> -replay-proxy : untuk mereplay proxy
```

cara menggunakan FFUF : [InsiderPhD](https://www.youtube.com/watch?v=aN3Nayvd7FU) </br>
wordlist : [SecList](https://github.com/danielmiessler/SecLists)

