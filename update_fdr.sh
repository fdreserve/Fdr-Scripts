#!/bin/bash
# Script done by LoulouCrypto
# https://www.louloucrypto.fr
CONFIGFOLDER='/root/.fdreserve'
COIN_PATH='/usr/local/bin/'
#64 bit only
COIN_TGZ='https://github.com/fdreserve/fdr-blockchain/releases/download/V2.2.1/2021-02-09_fdreserve-qt_v221_linux64.zip'
#COIN_PATHPART='fdr-v2.1.4-linux/bin'
COIN_DAEMON="fdreserved"
COIN_CLI="fdreserve-cli"
COIN_TX="fdreserve-tx"
COIN_NAME='FDReserve'

#update lunch
  echo -e "Updating your System"
apt-get update > /dev/null 2>&1
apt-get upgrade -y > /dev/null 2>&1
apt-get install unzip
  echo -e "Prepare to download $COIN_NAME update"
  cd ~/
  TMP_FOLDER=$(mktemp -d)
  cd $TMP_FOLDER
  wget --progress=bar:force $COIN_TGZ 2>&1
  COIN_ZIP=$(echo $COIN_TGZ | awk -F'/' '{print $NF}')
  echo -e "Updating $COIN_NAME"
  unzip $COIN_ZIP >/dev/null 2>&1
  chmod +x $COIN_DAEMON $COIN_CLI $COIN_TX
  echo -e "Stoping your Fdr Nodes"
  systemctl stop FDR*
  sleep 5
$COIN_CLI stop > /dev/null 2>&1
sleep 2
killall $COIN_DAEMON > /dev/null 2>&1 
echo -e "Updating $COIN_NAME"
  cp -p $COIN_DAEMON $COIN_CLI $COIN_TX $COIN_PATH/
  rm -f $COIN_ZIP fdreserve-qt >/dev/null 2>&1
  cd ~/ >/dev/null
  rm -rf $TMP_FOLDER >/dev/null 2>&1
  rm update_fdr.sh
  cd $CONFIGFOLDER
  rm debug.log db* peers.dat fee* mnc*
  cd ~/

cat << EOF >> $CONFIGFOLDER/fdreserve.conf
#New SeedNodes
addnode=161.97.167.197
addnode=161.97.167.201
addnode=144.91.95.43
addnode=144.91.95.44
addnode=167.86.119.223
addnode=164.68.96.160
addnode=167.86.124.134
EOF

  echo -e "Starting Fdr"
systemctl start FDReserve && sleep 30
  echo -e "Update Done"
$COIN_CLI getinfo
exit
# If you want to support me
# fdr wallet : 
# fYWa6E3gthATUF2rThr7TtBaVGa1dm7vR8
