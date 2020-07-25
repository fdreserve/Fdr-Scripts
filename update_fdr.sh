#!/bin/bash
# Script done by LoulouCrypto
# https://www.louloucrypto.fr
CONFIGFOLDER='/root/.fdreserve'
COIN_PATH='/usr/local/bin/'
#64 bit only
COIN_TGZ='https://github.com/fdreserve/fdr-blockchain/releases/download/v2.1.3/fdr-v2.1.3-linux64.tar.gz'
COIN_PATHPART='fdr-v2.1.3-linux/bin'
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
  wget --progress=bar:force $COIN_TGZ 2>&1
  COIN_ZIP=$(echo $COIN_TGZ | awk -F'/' '{print $NF}')
  echo -e "Updating $COIN_NAME"
  tar zxf $COIN_ZIP >/dev/null 2>&1
  chmod +x $COIN_DAEMON $COIN_CLI
  echo -e "Stoping your Ssx Nodes"
$COIN_CLI stop > /dev/null 2>&1
killall $COIN_DAEMON > /dev/null 2>&1 
echo -e "Updating $COIN_NAME"
  cp -p $COIN_DAEMON $COIN_CLI $COIN_PATH/
  rm -f $COIN_ZIP >/dev/null 2>&1
  cd ~/ >/dev/null
  rm -rf $TMP_FOLDER >/dev/null 2>&1
  rm update_fdr.sh

$COIN_DAEMON -daemon > /dev/null 2>&1 && sleep 10
  echo -e "Update Done"
$COIN_CLI getinfo
exit
# If you want to support me
# fdr wallet : 
# fYWa6E3gthATUF2rThr7TtBaVGa1dm7vR8