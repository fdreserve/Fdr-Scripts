#!/bin/bash
# Script done by LoulouCrypto
# https://www.louloucrypto.fr
CONFIGFOLDER='/root/.fdreserve'
COIN_PATH='/usr/local/bin/'
#64 bit only
COIN_TGZ='https://github.com/fdreserve/fdr-blockchain/releases/download/2.1.4/fdr-v2.1.4-linux64.tar.gz'
COIN_PATHPART='fdr-v2.1.4-linux/bin'
BOOTSTRAP_TGZ='https://github.com/fdreserve/bootstrap/releases/download/2/bootstrap.dat'
COIN_DAEMON="fdreserved"
COIN_CLI="fdreserve-cli"
COIN_NAME='FDReserve'

#update lunch
  echo -e "Updating your System"
apt-get update > /dev/null 2>&1
apt-get upgrade -y > /dev/null 2>&1
  echo -e "Prepare to download $COIN_NAME update"
  cd ~/
  TMP_FOLDER=$(mktemp -d)
  cd $TMP_FOLDER
  wget --progress=bar:force $COIN_TGZ
  wget --progress=bar:force $BOOTSTRAP_TGZ
  COIN_ZIP=$(echo $COIN_TGZ | awk -F'/' '{print $NF}')
  tar zxf $COIN_ZIP
  chmod +x $COIN_DAEMON $COIN_CLI
  mv bootstrap.dat $CONFIGFOLDER
  sleep 2
  echo -e "Stoping your $COIN_NAME Nodes"
$COIN_CLI stop > /dev/null 2>&1
echo -e "Updating $COIN_NAME"
  killall $COIN_DAEMON > /dev/null 2>&1 
  cp -p $COIN_DAEMON $COIN_CLI $COIN_PATH
  rm -rf $CONFIGFOLDER/blocks $CONFIGFOLDER/chainstate $CONFIGFOLDER/db.log $CONFIGFOLDER/peers.dat $CONFIGFOLDER/debug.log $CONFIGFOLDER/fee_estimates.dat $CONFIGFOLDER/mncache.dat 
  $COIN_CLI stop > /dev/null 2>&1
  killall $COIN_DAEMON > /dev/null 2>&1 
  rm -f $COIN_ZIP >/dev/null 2>&1
  cd ~/ >/dev/null
  rm -rf $TMP_FOLDER >/dev/null 2>&1
  update-2-1-4.sh

$COIN_DAEMON -daemon > /dev/null 2>&1 && sleep 10
  echo -e "Update Done"
$COIN_CLI getinfo
exit
# If you want to support me
# fdr wallet : 
# fYWa6E3gthATUF2rThr7TtBaVGa1dm7vR8
