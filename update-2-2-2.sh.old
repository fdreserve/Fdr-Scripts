#!/bin/bash
# Script done by LoulouCrypto
# https://www.louloucrypto.fr
CONFIGFOLDER='/root/.fdreserve'
COIN_PATH='/usr/local/bin/'
#64 bit only
COIN_TGZ='https://github.com/fdreserve/fdr-blockchain/releases/download/V2.2.2/2021-02-23_fdreserve-qt_v222_linux64.zip'
BOOTSTRAP_TGZ='https://fdreserve.com/downloads/snapshot.zip'
COIN_DAEMON="fdreserved"
COIN_CLI="fdreserve-cli"
COIN_TX="fdreserve-tx"
COIN_NAME='FDReserve'

#update lunch
  echo -e "Updating your System"
#apt-get update > /dev/null 2>&1
#apt-get upgrade -y > /dev/null 2>&1
  echo -e "Prepare to download $COIN_NAME update"
  cd ~/
  TMP_FOLDER=$(mktemp -d)
  cd $TMP_FOLDER
  wget --progress=bar:force $COIN_TGZ > /dev/null 2>&1
  COIN_ZIP=$(echo $COIN_TGZ | awk -F'/' '{print $NF}')
  unzip $COIN_ZIP > /dev/null 2>&1
  chmod +x $COIN_DAEMON $COIN_CLI $COIN_TX
  sleep 2
  echo -e "Stoping your $COIN_NAME Nodes"
$COIN_CLI stop > /dev/null 2>&1
echo -e "Updating $COIN_NAME"
  systemctl stop FDR*.service
  killall -w $COIN_DAEMON > /dev/null 2>&1 
  cp -p $COIN_DAEMON $COIN_PATH
  cp -p $COIN_CLI $COIN_PATH
  cp -p $COIN_TX $COIN_PATH
  cd /root/.fdreserve/
  echo -e "Downloading BootStrap"
  wget $BOOTSTRAP_TGZ
  sleep 1
  rm -rf blocks chainstate peers.dat
  sleep 2
  unzip snapshot.zip >/dev/null 2>&1
  rm -f snapshot.zip
  cd ~
  sleep 2
  cd ~/ >/dev/null
  rm -rf $TMP_FOLDER >/dev/null 2>&1
  rm update-2-2-2.sh

systemctl start FDReserve
  echo -e "Update Done"
$COIN_CLI getinfo
exit
# If you want to support me
# fdr wallet : 
# fYWa6E3gthATUF2rThr7TtBaVGa1dm7vR8
