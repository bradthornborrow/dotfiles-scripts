#!/bin/bash

if [ -z "$1" ]
  then
    echo "No argument supplied"
    exit 1
fi

DOMAIN=$1;
echo
echo "Tests common resolvers and calculates average response times by testing each resolver 3 times."

declare -A resolvers=( ["OpenDNS"]="208.67.220.220" ["Level 3"]="4.2.2.2" ["Google"]="8.8.8.8" ["DynDNS"]="216.146.35.35" ["CIRA"]="149.112.121.20" ["Cloudflare"]="1.1.1.1" )
echo
for resolver in "${!resolvers[@]}"; 
do
   ip=${resolvers[$resolver]}
   echo "$resolver: $ip"
   for reps in {1..3}
   do
    dig $DOMAIN @$ip | awk '/time/ {print $4 " ms"}'
    sleep 2
   done | awk '/ms/ {sum+=$1} END {print "Avg time: ",sum/3, " ms"}'
   echo
done
