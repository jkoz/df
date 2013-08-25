#-tcpdump {{{1

# Captured Packets in ASCII using tcpdump -A
tcpdump -A -i eth0

# Captured Packets in HEX and ASCII using tcpdump -XX
tcpdump -XX -i eth0

#-tcpdump-capture-file
tcpdump -i eth0 -s 65535 host 192.168.95.227 and port 8080 -w ~/soap

#-tcpdump-view-only-traffic
tcpdump -q -i eth1 tcp dst port 80 and src host 192.168.0.10

#-tcpdump-read-cap-file
/usr/sbin/tcpdump -qns 0 -A -r ~/data.pcap
/usr/sbin/tcpdump -qns 0 -X -r ~/data.pcap
/usr/sbin/tcpdump -tttt -r ~/data.pcap

# Capture packets with IP address using tcpdump -n
tcpdump -n -i eth0

# Capture packets with proper readable timestamp using tcpdump -tttt
tcpdump -n -tttt -i eth0

# Receive only the packets of a specific protocol type
tcpdump -i eth0 arp

# Read packets longer/lesser than N bytes
tcpdump -w g_1024.pcap greater 1024
tcpdump -w l_1024.pcap  less 1024

# basic
tcpdump -nS

# verbose
tcpdump -nnvvS

# deeper
tcpdump -nnvvXS

# heavy packing viewing
tcpdump -nnvvXSs


#-capture-debug-traffic
/usr/sbin/tcpdump -A -s 65535 -i eth0 host 192.168.95.227 and port 5005
/usr/sbin/tcpdump -XX -s 65535 -i eth0 host 192.168.95.227 and port 5005
/usr/sbin/tcpdump -nnvvXS -s 65535 -i eth0 host 192.168.95.227 and port 5005
/usr/sbin/tcpdump -nnvvXS -s 65535 -i eth0 host 192.168.95.227 and port 5005 -w ~/caps
# full ASCII
/usr/sbin/tcpdump -qns 0 -X -r ~/data.pcap
# traffic only
/usr/sbin/tcpdump -tttt -r ~/data.pcap

# 1}}}

#-curl {{{1
#-curl-post-soap
sed  '/<!--/d; /^$/d' ~/soap.xml | \
curl -u nbi:nbi -H "Content-Type: text/xml; charset=utf-8" -d @- -H "SOAPAction: nouse" -X POST http://192.168.95.227:8080/soap/services/ | \
xmllint --format -
#-curl-json
curl http://something/json | python -mjson.tool
#1}}}---------------------------------------------------------------------------

#-sed {{{1
#-sed-xml-tag
sed '/<dependency>/,/<\/dependency>/!d' 
#-sed-delete-break-line
sed -n -e ":a" -e "$ s/\n/ /gp;N;b a"
#-sed-remove-space-tab
sed s'/[ \t]//g'
#-sed-remove-html-xml-tags
sed -e 's/<[^>]*>//g'
#-sed-append-final-line
sed -i '$ a\-Ddeveloper=true' eclipse.ini
#-sed-match-word
echo `ls ~/.vim/bundle/` | sed "s/\(\<[.a-zA-Z-]*\>\)/'\1',\n\\\/g"
#-sed-delete-line-contain-only-number
sed -i "/^\([0-9]\+$\)/d" ~/projects/dotfiles/words
#-sed-print-number-inverse
sed -n '/[()\/]/!{=;p}' ~/projects/dotfiles/words
#-sed-pipe-not-match-tab-then-print-not-contain-/
sed -n '/\t/ !{/\//!{p}}' words
#-sed-groups
echo "2.2.0-rc2" | sed 's/\([^-]*\)-\([a-z]\+\)\([0-9]\+\)/\1-\2-\3/g'
#1}}}---------------------------------------------------------------------------

#-grep {{{1
#-grep-find-jar-sar-archive-ear
grepcmd="grep pattern" && \
pattern=".*jar$|.*ear$|.*sar$|.*.zip" && \
for a in `eval "find -type f -regextype posix-extended -regex \"$pattern\""`; \
do \
  ret=$(jar -tvf $a | exec $grepcmd | awk '{print $8}')
  [ -n "$ret" ] && echo ">>> ${ret} >>> ${a}"; \
done \
#1}}}---------------------------------------------------------------------------

#-find {{{1

#-find-file-current-dir
find /usr/include/ -maxdepth 1 -type f
#1}}}---------------------------------------------------------------------------

#-awk {{{1
#-awk-replace-xml
awk 'BEGIN { FS = "[<|>]" } {if ($2 == "tag") {sub($3, "replaced")} print}'
# 1}}}

#-git-ls {{{1
cd ~/.vim/bundle/ && for e in `ls -d $(pwd)/*/`; do cd $e && pwd && git pull; done

git init
git add README.md
git commit -m "first commit"
git remote add origin https://github.com/jkoz/vim-bundle.git
git push -u origin master
#1}}}---------------------------------------------------------------------------

#-bash-history {{{!
# exe previous cmds
ls ~
!!
# ref 2nd arg of revious cmdt, cmd is 0th
echo 1st 2nd 3rd
echo !!:2
# Event designator '!string' refers to the most recent command starting with 'string'
cd ~/projects/axs/collectors/
ls !c:1
# exe cmd in history
history
!1234
#1}}}---------------------------------------------------------------------------

#-vim {{{1
# debug scripts, then run action to hit breakpoint

vim -D -c "breakadd file *commandline.vim"
#-autocomplete
^x ^l line
^x ^i kw in files
^x ^k dict. Req: set dictionary /usr/share/dict/word
^x ^] tags
^x ^f files
^x ^v viml
^x ^o omni
^x ^s spelling

#-window-vim
^w= equals window size
^w_ maximum window size
^w-
^w+
sp horizontal
vsp vertical 

#-eclim
cd ~/projects/eclim/ && git checkout indigo && \
cd ~/projects/eclim/ && ant -Dvim.files=${HOME}/projects/viml/vim-eclim -Declipse.home=${ECLIPSE_HOME}

${ECLIPSE_HOME}/eclimd

#-ctrlp
# cleanup mru files cache
sed -i '/\/tmp\/bash-fs*/d' ~/.cache/ctrlp/mru/cache.txt

#-unicode
^V u <code> ->  http://www.alanwood.net/unicode/box_drawing.html

#-vim-hex-hexa-dec-decimal
%!xxd -> edit hex (not character) -> %!xxd -r -> wq

#-vim-insert-tab
^v <tab>

#-vim-copy-paste
yt, -> yank from current to before ,
^0 -> paste from yank register (Insert mode)

* -> yank current word
cwnewword -> delete current word & write "newword"
n. -> repeat to replace new match


#-vim-column
^v -> select text in column way

#-vim-sudo
:w !sudo tee % > /dev/null

#-vim-select-word-inside-tag
:vit

#-vim-suround
ve

#1}}}---------------------------------------------------------------------------

#-openbox-menu-maker-mmaker {{{1
mmaker -vf OpenBox3
#1}}}---------------------------------------------------------------------------

#-util-unikey-vietkey {{{1
ps -ef | grep -E "uni|ukxim" | grep -v grep | awk {print } | xargs kill
#1}}}---------------------------------------------------------------------------

#-java {{{!
#-jmap
jmap -d64 -histo:live 25438 | egrep "tl1|#instance" | head -10
jmap -d64 -dump:live,format=b,file=25438.bin 25438
#-jhat
jhat -J-Xmx2560m -J-XX:MaxPermSize=256m -J-XX:-UseBiasedLocking  -stack true -refs true -port 12345 ~/25438.bin
#1}}}---------------------------------------------------------------------------

#-user {{{1
useradd -m -d/home/jkoz -G root  -s /bin/bash jkoz
#1}}}---------------------------------------------------------------------------

#-iwconfig-network-wireless {{{1
iwconfig wlan1 essid "baop-ubuntu" mode "ad-hoc" key "s:passwd"
#1}}}---------------------------------------------------------------------------

#-ifconfig-network {{{1
# interface up
ifconfig eth0:1 192.168.95.45/24 up
# change mac address
ifconfig wlan0 down
ifconfig wlan0 hw ether f2:de:f1:98:12:48
ifconfig wlan0 up
#1}}}---------------------------------------------------------------------------

#-emerge {{{1
# new use
emerge -uD --newuse world
emerge --update --newuse --deep world
# ebuild
ebuild /usr/portage/app-dicts/stardict-tools/stardict-tools-3.0.1.ebuild manifest
#-eselect
eselect profile list
#1}}}---------------------------------------------------------------------------

#-rc-update-service {{{1
rc-update add dictd
#1}}}---------------------------------------------------------------------------

#-date- {{{1
date 080612412012
Mon Aug  6 12:41:00 IST 2012
#1}}}---------------------------------------------------------------------------

#-x {{{1
# xlock
xlock -mousemotion +description -mode blank -bg black -fg grey30
# load Xresouces Xdefault
xrdb -m /home/jkoz/.Xdefaults
#1}}}---------------------------------------------------------------------------

#-tar {{{1
# backup
tar -zcvpf /backups/full.tgz --directory=/ --exclude=proc --exclude=sys --exclude=dev/pts --exclude=backups
#1}}}---------------------------------------------------------------------------

#-mac {{{1
#-dmg2img
dmg2img -i OSX\ Server\ 10.6.dmg -o OSX\ Server\ 10.6.img
#1}}}---------------------------------------------------------------------------

#-mount {{{1
mount -t cifs -o username=jkoz //192.168.95.227/jkoz /mnt/192.168.95.227_jkoz/
#-mount-iso
mount -o loop -t iso9660 wga.iso /mnt/1/
#-mount-hfsplugs
#-mount-curlftpfs
curlftpfs -o user=sadfsdfl:passwd ftp://10.0.0.6/jkoz ~/10.0.0.6_jkoz/
#1}}}---------------------------------------------------------------------------

#-route-network {{{1
route add default gw 192.168.1.3 dev eth1
route add -net 20.0.0.0/8 gw 192.168.1.3
#-route-static-persist-centos
cat /etc/sysconfig/network-scripts/route-eth0
ADDRESS0=172.21.129.0
NETMASK0=255.255.255.0
GATEWAY0=192.168.99.160                   

# way to access internet when wah 
sudo route del -net 192.168.1.0/24 gw 192.168.19.54
sudo route del default gw 192.168.19.54 dev tap0
disable dns setting
#1}}}---------------------------------------------------------------------------

#-photo {{{1
#-rotate-jhead
jhead -autorot *.JPG
#1}}}---------------------------------------------------------------------------

#-svn {{{1
svnadmin create ~/repos/jkoz/am
svn co svn+ssh://user@remote.host/home/user/myrepo
#1}}}---------------------------------------------------------------------------

#-festival-text-to-speech {{{1
echo "bill" | festival --tts
#1}}}---------------------------------------------------------------------------

#-convert-hex-dec {{{1
#to hexa
printf "%x\n" 4095
#to dec
printf "%d\n" 4095
#1}}}---------------------------------------------------------------------------

#-pdf-text-convert-poppler {{{1
pdftotext
#1}}}---------------------------------------------------------------------------

# check terminal color 256, 88, 32.. {{{1
tput colors
#1}}}---------------------------------------------------------------------------

#-dict-stardict {{{1
/usr/lib/stardict-tools/stardict2txt myDict.ifo output_tab.txt
sed -r "s/([^\t]+)       /:\1:/" <output_tab.txt >output.txt
dictzip output.zip output.txt
dictfmt --utf8 -s "My dictionary data" -j my_data  < output.txt

# gentoo
DICT=longman
VER=2.4.2
FULL_DICT=stardict-${DICT}-${VER}
TITLE="Longman Dictionary"

cd $PROJ/dict
rm -rf $PROJ/dict/${FULL_DICT}
tar xjvf $PROJ/dict/${FULL_DICT}.tar.bz2
cd $PROJ/dict/${FULL_DICT}

dictzip -df ${DICT}.dict.dz

rm -rf output && mkdir -p output
stardict_stardict2txt ${DICT}.ifo output/${DICT}.tab

sed -r 's/([^\t]+)([\t]+)(.*)/:\1:    \3/' <output/${DICT}.tab >output/output.dict
#sed -i 's/\\n/\n    /g' output/output.dict
dictfmt --utf8 -s "$TITLE" -j output/${DICT} <output/output.dict
dictzip output/${DICT}.dict
mv output/${DICT}.dict.dz output/${DICT}.index /usr/lib/dict/
/etc/init.d/dictd restart

#-my-dict
sed -r 's/([^\t]+)([\t]+)(.*)/:\1:    \3/' /root/projects/dotfiles/dic/words | dictfmt --utf8 -s "1. My dict" -j /usr/lib/dict/1mydict

#-generic-convert-from-tab
sed -r 's/([^\t]+)([\t]+)(.*)/:\1:\3/' </root/projects/dotfiles/dic/dictd_anh-viet.tab \
| sed '/^:point:/d; /^:put:/d' \
| sed 's/\\n/\n   /g' \
| dictfmt --utf8 -s "2. Anh Viet Dictionary" -j /usr/lib/dict/2dictd-anh-viet

#-convert-dic-lm
sed -r 's/([^\t]+)([\t]+)(.*)/:\1:\3/' </root/projects/dotfiles/dic/longman.tab\
| sed 's/\\n/\n   /g' \
| dictfmt --utf8 -s "$TITLE" -j /usr/lib/dict/longman

#1}}}---------------------------------------------------------------------------

#-clock-open-ntpd {{{1
/etc/init.d/ntpd start
rc-update add ntpd default
#1}}}---------------------------------------------------------------------------

#-join-split-archive {{{1
lxsplit -j filename.001
lxsplit -s slackware.bin 100MB
#1}}}---------------------------------------------------------------------------

#-screenshot- {{{1
screenshot area
cd ~/images/screenshots
#1}}}---------------------------------------------------------------------------

#-vnc- {{{1
x11vnc -forever -usepw -shared -display :0
#1}}}---------------------------------------------------------------------------

#-smb-samba {{{1
# list samba nodes
findsmb
smbclient -U 'domain.com\jkoz' //192.168.98.21/jkoz
# root is an user of unix
smbpasswd -a root
# mount samba permently by specifying in fstab
//192.168.95.227/jkoz/mnt/192.168.95.227_jkoz/ cifs user,rw,exec,domain=WORKGROUP,credentials=/etc/smbpassword,uid=jkoz,file_mode=0755,dir_mode=0700 0 0

cat /etc/smbpassword
username=user
password=passwd
#1}}}---------------------------------------------------------------------------

#-maven-mvn {{{1
mvn dependency:tree
mvn org.apache.maven.plugins:maven-archetype-plugin:2.2:generate
mvn org.codehaus.mojo:cobertura-maven-plugin:2.4.1:cobertura
mvn org.apache.maven.plugins:maven-eclipse-plugin:2.9:eclipse
#1}}}---------------------------------------------------------------------------

#-pacman-yaourt-aur {{{1
pacman -S xf86-input-synaptics
pacman -S base-devel
pacman -S usb_modeswitch
pacman -S modemmanager
pacman -S networkmanager
pacman -S network-manager-applet
pacman -S xfce4-notifyd
pacman -S gnome-keyring
pacman -S vim
pacman -S sudo
pacman -S nvidia
pacman -S tmux
pacman -S xclip
pacman -S grub-bios
pacman -S gzip
pacman -S axel
pacman -S xlockmore
pacman -S zip
pacman -S unzip
pacman -S unrar
pacman -S wpa_supplicant
pacman -S wireless_tools
pacman -S systemd
pacman -S xorg-xinit
pacman -S xterm
pacman -S rxvt-unicode
pacman -S links
pacman -S alsa-utils
pacman -S rtorrent
pacman -S tor
pacman -S ack
pacman -S libreoffice-en-GB
pacman -S libreoffice-calc
pacman -S libreoffice-writer
pacman -S libreoffice-impress
pacman -S mupdf
pacman -S firefox
pacman -S flashplugin
pacman -S thunderbird
pacman -S openbox
pacman -S samba
pacman -S iptables
pacman -S subversion
pacman -S git
pacman -S openssh
pacman -S mplayer
pacman -S feh
pacman -S nitrogen
pacman -S mutt
pacman -S xchm
pacman -S tint2
pacman -S cvs
pacman -S yaourt
pacman -S netpbm
sudo pacman -S obconf
sudo pacman -S openbox-themes
sudo pacman -S ffmpeg
sudo pacman -S mc
pacman -S lib32-gtk # for install olad8

pacman -S xorg-fonts-100dpi


# for install olad8
pacman -S lib32-gtk
pacman -S lib32-alsa-lib
pacman -S lib32-nvidia-utils
pacman -S lib32-libdbus

sudo pacman -S cdrkit

#pacman-upate all package
pacman -Syu
pacman -Ss subversion

yaourt -S dropbox dropbox-cli
yaourt -S shrew-vpn-client

#pkgfile search package info of a lib
sudo yaourt -S pkgfile
#
# view library dependency of built file
ldd /opt/oald8/oald8-bin

#-cdrom-cdkit-burn-iso {{{1
sudo pacman -S cdrkit
readcd -v dev=/dev/cdrom -f abc.iso
#1}}}

#-mplayer {{{1
# load sub with unicode
mplayer -utf8 abc.mkv
# 1}}}

#-time {{{1
# timezone status
timedatectl status

timedatectl list-timezones

#-ntp syn time
ntpd -q
# 1}}}

#-systemd-systemctl {{{1
systemctl enable ntpd
systemctl start ntpd

#-disable auto suspended on laptop 
#add HandleLidSwitch=ignore in /etc/systemd/logind.conf
systemctl stop systemd-logind
systemctl start systemd-logind
#1}}}

# vpn {{{1
iqkea
# 1}}}

#-ffmpeg {{{1
ffmpeg -f x11grab -r 25 -s 1024x768 -i :0.0+100,200 output.flv
#1}}}
