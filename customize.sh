#!/bin/bash
set -e   # quit on error
set -x   # echo all commands

# install security updates
cat <<EOF >/etc/apt/sources.list
deb http://security.ubuntu.com/ubuntu/ xenial-security main restricted universe multiverse
EOF
 
apt update

apt remove --purge -y \
	thunderbird \
	firefox-locale-de firefox-locale-es firefox-locale-fr firefox-locale-it firefox-locale-pt firefox-locale-ru firefox-locale-zh-hans \
	ubiquity \
	$(dpkg-query -W --showformat='${Package}\n' | grep language-pack | egrep -v '\-en') \
;

apt dist-upgrade -y
apt dist-upgrade -y

# enable main & security repositories for installing extra packages
cat <<EOF >/etc/apt/sources.list
deb http://archive.ubuntu.com/ubuntu/ xenial main restricted universe multiverse
deb http://security.ubuntu.com/ubuntu/ xenial-security main restricted universe multiverse
EOF

cat <<EOF >/etc/apt/sources.list.d/cubic-wizard-ubuntu-release-xenial.list
deb http://ppa.launchpad.net/cubic-wizard/release/ubuntu xenial main
EOF

cat <<EOF >/etc/apt/sources.list.d/webupd8team-ubuntu-java-xenial.list
deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main
EOF

cat <<EOF >/etc/apt/sources.list.d/oracle-virtualbox.list
deb http://download.virtualbox.org/virtualbox/debian xenial contrib
EOF

cat <<EOF >/etc/apt/sources.list.d/google-chrome.list
deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main
EOF

cat <<EOF >/etc/apt/sources.list.d/google-talk.list
deb http://dl.google.com/linux/talkplugin/deb/ stable main
EOF

# Google Public (two keys)
cat <<EOF |apt-key add -
-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v1

mQGiBEXwb0YRBADQva2NLpYXxgjNkbuP0LnPoEXruGmvi3XMIxjEUFuGNCP4Rj/a
kv2E5VixBP1vcQFDRJ+p1puh8NU0XERlhpyZrVMzzS/RdWdyXf7E5S8oqNXsoD1z
fvmI+i9b2EhHAA19Kgw7ifV8vMa4tkwslEmcTiwiw8lyUl28Wh4Et8SxzwCggDcA
feGqtn3PP5YAdD0km4S4XeMEAJjlrqPoPv2Gf//tfznY2UyS9PUqFCPLHgFLe80u
QhI2U5jt6jUKN4fHauvR6z3seSAsh1YyzyZCKxJFEKXCCqnrFSoh4WSJsbFNc4PN
b0V0SqiTCkWADZyLT5wll8sWuQ5ylTf3z1ENoHf+G3um3/wk/+xmEHvj9HCTBEXP
78X0A/0Tqlhc2RBnEf+AqxWvM8sk8LzJI/XGjwBvKfXe+l3rnSR2kEAvGzj5Sg0X
4XmfTg4Jl8BNjWyvm2Wmjfet41LPmYJKsux3g0b8yzQxeOA4pQKKAU3Z4+rgzGmf
HdwCG5MNT2A5XxD/eDd+L4fRx0HbFkIQoAi1J3YWQSiTk15fw7RMR29vZ2xlLCBJ
bmMuIExpbnV4IFBhY2thZ2UgU2lnbmluZyBLZXkgPGxpbnV4LXBhY2thZ2VzLWtl
eW1hc3RlckBnb29nbGUuY29tPohjBBMRAgAjAhsDBgsJCAcDAgQVAggDBBYCAwEC
HgECF4AFAkYVdn8CGQEACgkQoECDD3+sWZHKSgCfdq3HtNYJLv+XZleb6HN4zOcF
AJEAniSFbuv8V5FSHxeRimHx25671az+uQINBEXwb0sQCACuA8HT2nr+FM5y/kzI
A51ZcC46KFtIDgjQJ31Q3OrkYP8LbxOpKMRIzvOZrsjOlFmDVqitiVc7qj3lYp6U
rgNVaFv6Qu4bo2/ctjNHDDBdv6nufmusJUWq/9TwieepM/cwnXd+HMxu1XBKRVk9
XyAZ9SvfcW4EtxVgysI+XlptKFa5JCqFM3qJllVohMmr7lMwO8+sxTWTXqxsptJo
pZeKz+UBEEqPyw7CUIVYGC9ENEtIMFvAvPqnhj1GS96REMpry+5s9WKuLEaclWpd
K3krttbDlY1NaeQUCRvBYZ8iAG9YSLHUHMTuI2oea07Rh4dtIAqPwAX8xn36JAYG
2vgLAAMFB/wKqaycjWAZwIe98Yt0qHsdkpmIbarD9fGiA6kfkK/UxjL/k7tmS4Vm
CljrrDZkPSQ/19mpdRcGXtb0NI9+nyM5trweTvtPw+HPkDiJlTaiCcx+izg79Fj9
KcofuNb3lPdXZb9tzf5oDnmm/B+4vkeTuEZJ//IFty8cmvCpzvY+DAz1Vo9rA+Zn
cpWY1n6z6oSS9AsyT/IFlWWBZZ17SpMHu+h4Bxy62+AbPHKGSujEGQhWq8ZRoJAT
G0KSObnmZ7FwFWu1e9XFoUCt0bSjiJWTIyaObMrWu/LvJ3e9I87HseSJStfw6fki
5og9qFEkMrIrBCp3QGuQWBq/rTdMuwNFiEkEGBECAAkFAkXwb0sCGwwACgkQoECD
D3+sWZF/WACfeNAu1/1hwZtUo1bR+MWiCjpvHtwAnA1R3IHqFLQ2X3xJ40XPuAyY
/FJG
=Quqp
-----END PGP PUBLIC KEY BLOCK-----
EOF

cat <<EOF |apt-key add -
-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v1

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
/n/CsdO0365yqDO/ADscehlVqdAupVv2
=dmoF
-----END PGP PUBLIC KEY BLOCK-----
EOF

# PJ Singh Public
cat <<EOF |apt-key add -
-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v1

mQINBFY6z6ABEAC29n7wp1rk3FqJKNS29PP5+bfWxy1PZ3ZFeGOu6bgLH2Swu2bF
kwn8gV2CESS5VZ90JGFpubZmFB94HhKedOLdPAVFzwbyTjx0xiEkRE7OrdwckyNt
SOLTIVB8RGHBZRF0aJ4bCH7dO2w4kP+j1AJBj1VBHRmQOpcgzEtuRevOnzywopR4
iECq/YYvUievYGMASYNwC8y2RV0Blj6amoXZZJG2lMdGVjcFaSeTwCgzlTGUrfOi
DNj4zQrzSsD7s76lPEAEp3tT1Yaa9d/E99YBXVhipNoQ3Kw0fkkmBKIbWjVIy5J3
zuG6HJrAu1Fut09QS7QJ+TSt08oZ1Wd/wQaR+o9Fj0i2ZR1R95BA/c6j3PjRkzQQ
g97cmyqdhuakoLNyv3/jGeImkGpvvCs5rMFuArcEBj+CzC1D/krkjpaPyYxLdk+w
0Q4pdKThFVtRhH2dHSZb+abMJvIT7KyrGChcCWl4UeHXRivisXyD/CcK9e001rrT
sUbVcUC+wgJWartgzn70Y2v9vuw95WIKPhiwKS/mq2MpeU2UvgYhOtmDQoIVNKV3
yc+cN4tmhNDhqP/dF5LHxFpkzgkeJsWjx2zja9vJTHBhfOl37sTMJjqyyf80fCXv
739Nokps59QcAKBHTspAfqKRI9FI3skqRUToYRhnOghbVBCiNm0smUYljwARAQAB
tBpMYXVuY2hwYWQgUFBBIGZvciBQSiBTaW5naIkCOAQTAQIAIgUCVjrPoAIbAwYL
CQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQCBUl4rTxKDs3ow/+Mu+DKCnU6U6G
iH/UujVAeg4QqxJpEEMY3sqD7Oe3lh+dte7mqrBtqa/IvkoQWCh9BJswXDMY+GHz
vqnvF720l3vm68s7Q6Ig6vwvp9JpqU+e+VQS4Oek4rxuDm9yxACzfv9ci1JqxXyy
Tr5PInTCMaWqsWovze9EH6/qdjfCwp3X6wIWd1UgMxOqGplIC2zW1GVNQBEXgXF/
NydgdIMpquICOtLb7NkLzdnKqCJ75xEMqR+tCp0I6shN+O+DKSp4PMGCTpqomtNT
JzvhPbfE2dEPsMh213NNtgI9LXZR3i/HsWsR4/Z5TXj+s0Z9aLsk7uuHYImVBW4q
uH/m2Bm/Pgp5+Es7D8Qzl0yVZmHRaq+kfG9UvsGkU/dKMN8h6QNr0KHO5cf+KkW2
58ta7DJ1PD7sE5PWUOtelmdXJdbkd+YxGb1+Zf4Kr3JK9TJG3boK3tQrvcT25OU0
TLQfoZVIm7RaSC67t33rgAkiyMjMvPFs/48UgAWjdr7NLJVTfvRMhQZb70QONf4V
S+8H3Es6dFcubsteLkNo40uFrA6ipVVuz1TrW7Wqsl+YY0W0D+JkXSgv/VjNIIOi
ZSLKm5lPqMFBl3OtH9XHRIt9vDBGs5VJvQCudycXrlSJE2OR9ejK65f3zoVTUhzi
hq1TyPom3oEpHan9kU2aoli1MX8oTic=
=Kw08
-----END PGP PUBLIC KEY BLOCK-----
EOF

# webupd8 team (for java)
cat <<EOF |apt-key add -
-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v1

mI0ES9/P3AEEAPbI+9BwCbJucuC78iUeOPKl/HjAXGV49FGat0PcwfDd69MVp6zU
tIMbLgkUOxIlhiEkDmlYkwWVS8qy276hNg9YKZP37ut5+GPObuS6ZWLpwwNus5Ph
LvqeGawVJ/obu7d7gM8mBWTgvk0ErnZDaqaU2OZtHataxbdeW8qH/9FJABEBAAG0
DUxhdW5jaHBhZCBWTEOImwQQAQIABgUCVsN4HQAKCRAEC6TrO3+B2tJkA/jM3b7O
ysTwptY7P75sOnIu+nXLPlzvja7qH7WnA23itdSker6JmyJrlQeQZu7b9x2nFesk
NYlnhCp9mUGu/kbAKOx246pBtlaipkZdGmL4qXBi+bi6+5Rw2AGgKndhXdEjMxx6
aDPq3dftFXS68HyBM3HFSJlf7SmMeJCkhNRwiLYEEwECACAFAkvfz9wCGwMGCwkI
BwMCBBUCCAMEFgIDAQIeAQIXgAAKCRDCUYJI7qFIhucGBADQnY4V1xKT1Gz+3ERl
y+nBb61BSqRx6KUgvTSEPasSVZVCtjY5MwghYU8T0h1PCx2qSir4nt3vpZL1luW2
xTdyLkFCrbbIAZEHtmjXRgQu3VUcSkgHMdn46j/7N9qtZUcXQ0TOsZUJRANY/eHs
BvUg1cBm3RnCeN4C8QZrir1CeA==
=CziK
EOF

# oracle virtualbox key
cat <<EOF |apt-key add -
-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v1.4.12 (GNU/Linux)

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
=Rv7/
-----END PGP PUBLIC KEY BLOCK-----
EOF

apt update

# libxcb-xtest0 is prereq for zoom
# keepass2: mono-mcs for plugins, xdotool for auto-type
# ubuntu-restricted-extras adds restricted media codecs for firefox etc
# **NOTE: if there are problems here, try below w updates channel before filing bug
apt install -y \
	gimp \
	keepass2 mono-mcs xdotool \
	printer-driver-hpijs \
	secure-delete \
	expect \
	google-chrome-stable \
	git \
	cubic syslinux-utils \
	libxcb-xtest0 \
	libdvd-pkg \
	oathtool \
	handbrake \
	oracle-java8-set-default \
	ubuntu-restricted-extras \
	google-talkplugin \
	virtualbox-5.1 cpu-checker \
	wireshark \
	nethogs \
	iftop \
	aircrack-ng \
	testdisk \
	partimage \
	gddrescue \
	ddrescueview \
	forensics-all \
	games-emulator visualboyadvance-gtk joy2key \
	gcompris \
	tuxpaint \
	quadrapassel \
	supertux \
	extremetuxracer \
	supertuxkart \
	junior-programming \
	junior-games-puzzle \
;

sudo dpkg-reconfigure \
	libdvd-pkg \
;

# enable updates & partner repositories for installing skype
cat <<EOF >/etc/apt/sources.list
deb http://archive.ubuntu.com/ubuntu/ xenial main restricted universe multiverse
deb http://security.ubuntu.com/ubuntu/ xenial-security main restricted universe multiverse
deb http://archive.ubuntu.com/ubuntu/ xenial-updates main restricted universe multiverse
deb http://archive.canonical.com/ubuntu/ xenial partner
EOF

apt update
apt install -y \
	vlc \
;

dpkg --add-architecture i386
apt update
apt install -y \
	skype \
	zsnes \
;

# install zoom
cd /root
wget https://zoom.us/client/latest/zoom_amd64.deb
dpkg -i zoom_amd64.deb
rm -v zoom_amd64.deb

# additional groups for live user
echo 'ADD_EXTRA_GROUPS=1' >>/etc/adduser.conf
echo EXTRA_GROUPS=\"dialout cdrom floppy audio video plugdev users \
	wireshark \
\" >>/etc/adduser.conf

# hide amazon icon from dash
echo Hidden=true >>/usr/share/applications/ubuntu-amazon-default.desktop

# disable ureadahead service (irrelevant on live system, clutters syslog w errors)
systemctl disable ureadahead

# disable all apt repositoriee
for F in /etc/apt/sources.list /etc/apt/sources.list.d/*; do
  sudo sed -i 's/^/# /' $F
done

# cleanup
apt autoremove -y
apt clean -y

# success!
echo 'SUCCESS!'
