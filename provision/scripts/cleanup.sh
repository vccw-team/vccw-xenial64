#!/bin/sh -eux

# Delete all Linux headers
dpkg --list \
  | awk '{ print $2 }' \
  | grep 'linux-headers' \
  | xargs apt-get -y purge;

# Remove specific Linux kernels, such as linux-image-3.11.0-15-generic but
# keeps the current kernel and does not touch the virtual packages,
# e.g. 'linux-image-generic', etc.
dpkg --list \
    | awk '{ print $2 }' \
    | grep 'linux-image-3.*-generic' \
    | grep -v `uname -r` \
    | xargs apt-get -y purge;

# Delete Linux source
dpkg --list \
    | awk '{ print $2 }' \
    | grep linux-source \
    | xargs apt-get -y purge;

# Delete development packages
# dpkg --list \
#     | awk '{ print $2 }' \
#     | grep -- '-dev$' \
#     | xargs apt-get -y purge;

# Delete X11 libraries
# apt-get -y purge libx11-data xauth libxmuu1 libxcb1 libx11-6 libxext6;

# Delete obsolete networking
apt-get -y purge ppp pppconfig pppoeconf;

# Delete oddities
apt-get -y purge popularity-contest;

aptitude -y purge ri
aptitude -y purge installation-report landscape-common wireless-tools wpasupplicant ubuntu-serverguide
aptitude -y purge python-dbus libnl1 python-smartpm python-twisted-core libiw30
aptitude -y purge python-twisted-bin libdbus-glib-1-2 python-pexpect python-pycurl python-serial python-gobject python-pam python-openssl libffi5
apt-get purge -y linux-image-3.0.0-12-generic-pae

apt-get -y autoremove;
apt-get -y clean;

rm -f VBoxGuestAdditions_*.iso VBoxGuestAdditions_*.iso.?;
rm -rf /usr/src/vboxguest*
rm -rf /usr/share/doc
find /var/cache -type f -exec rm -rf {} \;

rm -rf /usr/share/locale/{af,an,am,ar,ary,as,ast,az,bal,be,bg,bn,bn_IN,bo,br,bs,byn,ca,ca@valencia,ckb,cr,crh,cs,csb,cv,cy,da,de,de_AT,dv,dz,el,en_AU,en_CA,en_GB,eo,es,et,et_EE,eu,fa,fa_AF,fi,fil,fo,fr,frp,fur,fy,ga,gd,gez,gl,gu,gv,haw,he,hi,hr,ht,hu,hy,id,is,it,ja,jv,ka,kk,km,kn,ko,kok,ku,ky,lb,lg,ln,lt,lo,lv,mg,mhr,mi,mk,ml,mn,mr,ms,mt,my,nb,nds,ne,nl,nn,no,nso,oc,or,os,pa,pam,pl,ps,pt,pt_BR,qu,ro,ru,rw,sc,sd,shn,si,sk,sl,so,sq,sr,sr*latin,sv,sw,ta,te,th,ti,tig,tk,tl,tr,trv,tt,ug,uk,ur,urd,uz,ve,vec,vi,wa,wal,wo,xh,zh,zh_HK,zh_CN,zh_TW,zu}

unset HISTFILE
rm -f /root/.bash_history
rm -f /home/vagrant/.bash_history
find /var/log -type f | while read f; do echo -ne '' > $f; done;
