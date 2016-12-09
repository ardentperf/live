#!/bin/bash

cat <<EOF >/etc/apt/sources.list
deb http://archive.ubuntu.com/ubuntu/ xenial main restricted universe multiverse
deb http://security.ubuntu.com/ubuntu/ xenial-security main restricted universe multiverse
deb http://archive.ubuntu.com/ubuntu/ xenial-updates main restricted universe multiverse
EOF

cat <<EOF >/etc/apt/sources.list.d/cubic-wizard-ubuntu-release-xenial.list
deb http://ppa.launchpad.net/cubic-wizard/release/ubuntu xenial main
EOF

apt update

apt remove --purge -y thunderbird firefox-locale-de firefox-locale-es firefox-locale-fr firefox-locale-it firefox-locale-pt firefox-locale-ru firefox-locale-zh-hans ubiquity $(dpkg-query -W --showformat='${Package}\n' | grep language-pack | egrep -v '\-en')


