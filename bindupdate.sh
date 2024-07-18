#!/bin/bash

WGET=$(which wget)
ECHO=$(which echo)
NSUPDATE=$(which nsupdate)

DnsServer="$DNSSERVER"
Domain="$DOMAIN"
Host="$HOSTNAME"
IP="$IPADDRESS"

$WGET --user $DNSSERVERUSR --password $DNSSERVERPWD $DnsServer:8053/static/$DOMAIN.key -O /tmp/domain.key

$ECHO "server $DnsServer" > /tmp/nsupdate
$ECHO "debug yes" >> /tmp/nsupdate
$ECHO "update delete $Host.$Domain" >> /tmp/nsupdate
#for IP in ${IPs}; do
#    $ECHO "update add $Host.$Domain 60 A $IP" >> /tmp/nsupdate
#done
$ECHO "update add $Host.$Domain 60 A $IP" >> /tmp/nsupdate
$ECHO "send" >> /tmp/nsupdate

$NSUPDATE -k /tmp/domain.key -v /tmp/nsupdate 2>&1
