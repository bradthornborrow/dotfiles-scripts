#!/usr/bin/env bash

set -euo pipefail

# Show arguments if none entered
if [ $# -eq 0 ]; then
    echo "Usage: `basename $0` domain_name"
    exit 0
fi

types=(
  A AAAA AFSDB APL CAA CDNSKEY CDS CERT CNAME CSYNC DHCID DLV DNAME DNSKEY DS
  EUI48 EUI64 HINFO HIP HTTPS IPSECKEY KEY KX LOC MX NAPTR NS NSEC NSEC3
  NSEC3PARAM OPENPGPKEY PTR RP RRSIG SIG SMIMEA SOA SRV SSHFP SVCB TA TKEY TLSA
  TSIG TXT URI ZONEMD
)

for type in ${types[@]}; do
  dig @1.1.1.1 +noall +answer +multiline "$1" $type
done
