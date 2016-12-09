#!/bin/bash
set -e   # quit on error
set -x   # echo all commands

BASE=/media/ubuntu/data
mkdir $BASE/livesrc
sudo mount -o loop $BASE/ubuntu-16.04.1-desktop-amd64.iso $BASE/livesrc

mkdir $BASE/livedst
mkdir $BASE/livedst/cd
rsync --exclude=/casper/filesystem.squashfs -a $BASE/livesrc $BASE/livedst/cd

mkdir $BASE/livedst/squashfs
mkdir $BASE/livedst/custom
sudo mount -t squashfs -o loop $BASE/livesrc/casper/filesystem.squashfs $BASE/livedst/squashfs/
sudo cp -a $BASE/livedst/squashfs/* $BASE/livedst/custom


