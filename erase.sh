#!/bin/bash
cd ~
killall fdreserved
sleep 2
rm -rf .fdreserve
sleep 2
rm -f /usr/local/bin/fdres*
