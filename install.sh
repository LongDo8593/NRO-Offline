#!/data/data/com.termux/files/usr/bin/bash
timeout 1s curl --http2 https://google.com
check=$?
case $check in
6)
	slow "There is no wifi, please wait until it is available again"
	exit
;;
124)
	slow "Wi-Fi timeout"
	exit
esac
check=$(echo $SHELL)
slow() {
	vb="$1"
	for ((i=0; i < ${#vb}; i++))
	do
		printf "%s" "${vb:$i:1}"
		sleep 0.01
	done
	printf "\n"
}
if [ "$check" != "/data/data/com.termux/files/usr/bin/bash" ] && [ "$check" != "/data/data/com.termux/files/usr/bin/zsh" ]
then
	slow "Only support for termux"
	exit
fi
pb=$(getprop ro.build.version.release)
if [ "$pb" -lt 7 ] && [ "$pb" -gt 11 ]
then
	slow "Does not support Android 7 and below and Android 11 and above!"
	exit
fi
pnt=$(echo $TERMUX_VERSION | awk -F '.' '{ print $2 }')
if [ "$pnt" -lt "117" ]
then
	slow "Only temrux version 0.117 and above is supported"
	exit
fi
total=$(free -m | awk '/Mem:/ {print $2}')
if [ "$total" -lt "500" ]
then
	slow "Ram must be over 500 Mb!"
	exit
fi
core=$(lscpu | awk '/^CPU\(s\):/ {print $2}')
if [ "$core" -lt 4 ]
then
	slow "The number of cores must be above 4"
	exit
fi
clear
echo "
\033[1;92m      __  __          _____
 #     #    ####    #####  
##    #    #   #   #     # 
# #   #    #   #   #     # 
#  #  #    ####    #     # 
#   # #    #  #    #     # 
#    ##    #   #   #     # 
#     #    #    #   #####  
 ";
slow "Do you want to download our nro termux test version?"
slow "Capacity to download support packages: "
slow "| Java17 - 232 Mb"
slow "| Wget - 762 Kb"
slow "| Neofetch - 406 Kb"
slow "| Sox - 49 Mb"
slow "| Unzip - 283 Kb"
slow "| Zip - 483 Kb"
slow "| Source Nro - 200 Mb"
slow "| Sql - 1 Mb"
slow "| Ssh - 12 Mb"
slow "| Ssshpass - 65 Kb"
slow "| Tmate - 725 Kb"
slow "| Ncurses-utils - 475 Kb"
slow "| Mysql - 680 Mb"
slow "| Client version to play - 40 ~ 60 Mb"
slow "| Which - 11 Kb"
slow "| Jq - 1270 Kb"
slow "| Youtubedr - 15 Mb"
slow "|   Total mb to download: 900 ~ 1200 Mb"
slow "|   Total kb to download: 3961 kb ( 3,9 Mb )"
slow ""
read -p "Y/N " yn
function install() {
	clear
	apt update -y && apt upgrade -y
	termux-setup-storage
	clear
	slow "Proceed to download Zip"
	apt install zip -y
	slow "Proceed to download sox ..."
	apt install sox -y
	slow "Proceed to download ssh"
	apt install openssh -y
	slow "Proceed to download sshpass"
	apt install sshpass -y
	slow "Proceed to download youtubedr"
	apt install youtubedr -y
	slow "Proceed to download Wget"
	apt install wget -y
	slow "Proceed to download unzip"
	apt install unzip -y
	slow "Proceed to download tmate"
	apt install tmate -y
	slow "Proceed to download neofetch"
	apt install neofetch -y
	slow "Proceed to download Ncurses-utils"
	apt install ncurses-utils -y
	slow "Proceed to download Jq"
	apt install jq -y
	slow "Proceed to download Which"
	apt install which -y
	slow "Proceed to download Java17"
	apt install openjdk-17 -y
	slow "Download mysql"
	wget -O "/sdcard/mysql.apk" "https://github.com/LongDo8593/NRO-Offline/releases/download/NroDragonBoy/com.mod.awebserver.http.web.server.apache.php.sql.vlliurona.lliurona.20.mod.apk.ads.removed20.apk" > /dev/null 2>&1
	apt install mariadb -y
	slow "Proceed to download Sql"
	wget -O $PREFIX/Database.sql https://raw.githubusercontent.com/LongDo8593/NRO_Offline/main/nrotea.sql > /dev/null 2>&1
	slow "Proceed to download Client"
	wget -O /sdcard/NRO_Offline.apk https://github.com/LongDo8593/NRO_Offline/raw/main/NRO_Offline_v2.2.0.apk > /dev/null 2>&1
	slow "Proceed to download Mt manager"
	wget -O /sdcard/Mtmanager.apk https://github.com/LongDo8593/NRO_Offline/raw/main/MT%20Manager_2.15.0_BANDISHARE.apk > /dev/null 2>&1
	slow "Proceed to download JL"
	wget -O /sdcard/j2me.apk https://github.com/thanhnhansexy/yeuem-/raw/main/JL-Mod_0.81-MC_0.98.8-GameDVA.com.apk > /dev/null 2>&1
	slow "Proceed to download Source"
	wget -O $PREFIX/include/source.zip "https://github.com/LongDo8593/NRO-Offline/releases/download/NroDragonBoy/file.zip" > /dev/null 2>&1
	slow "Proceed to download Music"
	mkdir $PREFIX/include/music_list
	wget -O $PREFIX/include/music_list/music.mp3 "https://github.com/thanhnhansexy/yeuem-/releases/download/Nh/y2mate.com.-.Nh.c.Chill.Bu.n.2024.Nh.c.Lofi.Chill.Tam.Tr.ng.Bu.n.Hay.Nh.t.Hi.n.Nay.Nh.c.Chill.Xu.H.ng.TikTok.mp3" > /dev/null 2>&1
	slow "Proceed to extract the source"
	clear
	slow "
	This decompression process can take 15 ~ 20 minutes
		( Depending on whether the device is strong or weak )"
	unzip $PREFIX/include/source.zip -d $PREFIX/share
	slow "The decompression process is completed
Please wait a moment..."
	wget -O "$PREFIX/bin/run" "https://raw.githubusercontent.com/LongDo8593/NRO-Offline/main/run" > /dev/null 2>&1
	chmod +x $PREFIX/bin/run
	clear
	rm -rf $PREFIX/include/source.zip
	termux-wake-lock
	wget -O "$PREFIX/bin/menu" "https://raw.githubusercontent.com/LongDo8593/NRO_Offline/main/menu" > /dev/null 2>&1
	chmod +x $PREFIX/bin/menu
	slow "Install successfully"
}
case $yn in
Y)
	install
;;
y)
	install
;;
N)
	slow "Thank you for using it"
	exit
;;
n)
	slow "Thank you for using it"
	exit
;;
*)
	slow "Your selection is invalid"
	exit
esac
