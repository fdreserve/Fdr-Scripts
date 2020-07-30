#!/bin/bash
# Script done by LoulouCrypto
# https://www.louloucrypto.fr
CONFIGFOLDER='/home/$USER/.fdreserve'
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
#apt-get update > /dev/null 2>&1
#apt-get upgrade -y > /dev/null 2>&1
  echo -e "Download $COIN_NAME update"
  cd ~/
  TMP_FOLDER=$(mktemp -d)
  cd $TMP_FOLDER
  wget --progress=bar:force $BOOTSTRAP_TGZ > /dev/null 2>&1
  mv bootstrap.dat /home/$USER/.fdreserve
  sleep 2
  echo -e "Stoping your $COIN_NAME Nodes"
  $COIN_CLI stop > /dev/null 2>&1
  echo -e "Updating $COIN_NAME"
  rm -rf /home/$USER/.fdreserve/blocks /home/$USER/.fdreserve/chainstate /home/$USER/.fdreserve/db.log /home/$USER/.fdreserve/peers.dat /home/$USER/.fdreserve/debug.log /home/$USER/.fdreserve/fee_estimates.dat /home/$USER/.fdreserve/mncache.dat  
  cd ~/ >/dev/null
  rm -rf $TMP_FOLDER >/dev/null 2>&1
  rm update-multi-2-1-4.sh

$COIN_DAEMON -daemon > /dev/null 2>&1 && sleep 10
  echo -e "Update Done"
$COIN_CLI getinfo
exit
# If you want to support me
# fdr wallet : 
# fYWa6E3gthATUF2rThr7TtBaVGa1dm7vR8