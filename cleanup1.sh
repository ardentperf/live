#!/bin/bash
set -x

BASE=/media/ubuntu/data
sudo umount $BASE/livedst/custom/proc
sudo umount $BASE/livedst/custom/sys
sudo umount $BASE/livedst/squashfs/
sudo umount $BASE/livesrc
sudo rm -rf $BASE/livedst
rmdir $BASE/livesrc

