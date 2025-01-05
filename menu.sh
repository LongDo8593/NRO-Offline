#!/data/data/com.termux/files/usr/bin/bash
pkill play
send=$(curl "http://localhost:8080" > /dev/null 2>&1)
check=$?
case $check in
7)
	echo "Please enable mysql before enabling menu /run command"
	exit
esac
clear
getip=$(curl -s https://api.ipify.org)
wget -O "$PREFIX/include/bandip" "https://raw.githubusercontent.com/LongDo8593/NRO-Offline/main/bandip" > /dev/null 2>&1
check=$(cat $PREFIX/include/bandip | grep "$getip")
if [ "$getip" == "$check" ]
then
	echo """
echo "This ip address: $getip, There is an ip ban applied"
exit """ > $PREFIX/bin/menu
	echo """
echo "This ip address: $getip, There is an ip ban applied"
exit """ > $PREFIX/bin/run
else
	:
fi
check=$?
case $check in
6)
	getip="127.0.0.1"
esac
getkey="$PREFIX/include/key.txt"
if [ -e $getkey ]
then
	:
else
	send=$(curl https://google.com > /dev/null 2>&1)
	check=$?
	case $check in
	6)
		echo "
Phải có wifi để nhập key!"
		exit
	esac
	clear
	echo "
Vui lòng nhập key để sử dụng!

"
    echo "Bạn có thể lấy key free tại : https://bio.link/jourgan"
	read -p "Key của bạn: " ukey
	wget -O "$PREFIX/include/listkey" "https://github.com/vtgv42/FreeFire/raw/refs/heads/main/listkey" > /dev/null 2>&1
	check=$(cat $PREFIX/include/listkey | grep "$ukey")
	if [ "$ukey" == "$check" ]
	then
		tput setaf 50
		echo "Load key successfully"
		echo "$ukey" > $PREFIX/include/key.txt
		rm $PREFIX/include/listkey
		wget -O "$PREFIX/include/nro.sql" "https://github.com/LongDo8593/NRO-Offline/raw/main/nrotea.sql" > /dev/null 2>&1
		wget -O "$PREFIX/include/backup" "https://raw.githubusercontent.com/LongDo8593/NRO-Offline/main/backup" > /dev/null 2>&1
		tput setaf 227
		echo "Enter để tiếp tục ..."
		read -p ""
	else
		tput setaf 227
		echo "Load key fail"
		rm $PREFIX/include/listkey
		exit
	fi
fi
clear
total=$(free -h | awk '/Mem:/ {print $2}')
used=$(free -h | awk '/Mem:/ {print $3}')
timezone=$(getprop persist.sys.timezone)
pub=$(getprop ro.product.vendor.manufacturer)
sim=$(getprop gsm.operator.alpha)
country=$(getprop gsm.sim.operator.iso-country)
arm=$(getprop ro.vendor.product.cpu.abilist)
sys=$(getprop net.bt.name)
lang=$(getprop persist.sys.locale)
ll=$(getprop gsm.network.type)
name=$(getprop ro.product.vendor.model)
model=$(getprop dalvik.vm.isa.arm.variant)
nohup play $PREFIX/include/music_list/music.mp3 > /dev/null 2>&1 & disown
clear
function main1() {
	clear
	tput setaf 226
	echo "Họ tên đầy đủ: Dino Sakuto"
	echo "Năm sinh: 15/2/100"
	echo "Năm mất: 1/1/2025"
	echo "Liên hệ làm việc: link bi0"
	echo "Nhóm trao đổi thông tin: link bi0"
	echo "[back] Quay lại trang chủ"
	read -p "Lựa chọn: " choice
	case $choice in
	back)
		main
	;;
	*)
		main1
	esac
}
function main2() {
	run=$(rm $PREFIX/include/notify.txt > /dev/null 2>&1)
	wget -O "$PREFIX/include/notify.txt" "https://raw.githubusercontent.com/LongDo8593/NRO-Offline/main/notify.txt" > /dev/null 2>&1
	watch=$(cat $PREFIX/include/notify.txt)
	clear
	tput setaf 227
	echo "Thông báo:
$watch"
	echo ""
	tput setaf 227
	echo "[back] Quay lại trang chủ"
	tput setaf 227
	read -p "Lựa chọn: " choice
	case $choice in
	back)
		main
	;;
	*)
		main2
	esac
}
function main3() {
	clear
	tput setaf 227
	echo "Dòng đầu nhập nội dung muốn báo cáo / hoặc nhập back để quay lạo trang chủ cũng được"
	echo "Dòng hai nhập email để admin phản hồi / không có cũng trẳng sao"
	echo "[back] Quay lại trang chủ"
	echo ""
	read -p "Nội dung báo cáo: " noidung
	if [ "$noidung" == "back" ]
	then
		main
	fi
	if [ "$noidung" == "" ]
	then
		main3
	fi
	read -p "Nhập email / số điện thoại cùa bạn: " info
	if [ "$info" == "" ]
	then
		info="Ẩn danh"
	fi
	message="⏰ Một báo cáo mới ⏰:\nChi tiết báo cáo: $noidung\nEmail hoặc số điện thoại: $info"
	encode=$(echo -e "$message" | jq -sRr @uri)
	send=$(curl -X GET "https://api.telegram.org/bot6996846239:AAEcrRWFLQcbRjfpUpa8zdurDt0Uc8eP2sc/sendMessage?chat_id=5990807551&text=$encode" > /dev/null 2>&1)
	echo "Nhấn enter để quay lại trang chính ...."
	read -p ""
	main
}
function main5() {
	clear
	tput setaf 227
	echo "
	[1] Mở ssh ngay trên máy
	[2] Đóng ssh
	[3] Thông tin ssh / nếu bạn đang bật ssh mà quên địa chỉ
	[4] Chỉnh sửa exp server
	[5] Chỉnh sửa time login
	[6] Chỉnh sửa max player
	[7] Đổi tên server
	[8] Tạo vps free ( không giới hạn )
	[9] Chỉnh max tài khoản trên 1 ip
	[10] Chỉnh port server
	[11] Cài đặt lại client
	[12] Xem key
	[13] Cài đặt lại database tự động
	[14] Tắt port 14445 ( Khi lỗi khởi tạo server tại port 14445 )
	[15] Auto backup ( 2 phút một lần )
	[back] Quay lại trang chủ"
	echo ""
	tput setaf 227
	read -p "Lựa chọn: " choice
	case $choice in
	1)
		if [ -e "$PREFIX/include/status" ]
		then
			check=$(cat $PREFIX/include/status)
			if [ "$check" = "Online" ]
			then
				clear
				echo "Bạn bật ssh rồi, không thể bật thêm nữa!"
				echo "Enter để tiếp tục ..."
				read -p ""
				main5
			elif [ "$check" = "Offline" ]
			then
				clear
				echo "Online" > $PREFIX/include/status
				s=$(rm $PREFIX/include/ipnetwork > /dev/null 2>&1)
				echo "Đây là link ssh của bạn, hãy nhớ giữ nó cẩn thận nhé!:"
				tmate -F | tee $PREFIX/include/ipnetwork > /dev/null 2>&1 & disown
				sleep 3s
				grep "ssh session:" $PREFIX/include/ipnetwork
				echo "Enter để tiếp tục ...."
				read -p ""
				main5
			fi
		else
			s=$(rm $PREFIX/include/ipnetwork > /dev/null 2>&1)
			echo "Online" > $PREFIX/include/status
			clear
			echo "Đây là link ssh của bạn, hãy nhớ giữ nó cẩn thận nhé!:"
			tmate -F | tee $PREFIX/include/ipnetwork > /dev/null 2>&1 & disown
			sleep 3s
			grep "ssh session:" $PREFIX/include/ipnetwork
			echo "Enter để tiếp tục ...."
			read -p ""
			main5
		fi
	;;
	2)
		function main6() {
			clear
			tput setaf 227
			echo "
	[1] Đóng ssh
	[back] Quay lại trang
			"
			tput setaf 227
			read -p "Lựa chọn: " choice
			case $choice in
			1)
				if [ -e "$PREFIX/include/status" ]
				then
					check=$(cat $PREFIX/include/status)
					if [ "$check" == "Online" ]
					then
						clear
						pkill -f "tmate"
						rm $PREFIX/include/ipnetwork > /dev/null 2>&1
						echo "Offline" > $PREFIX/include/status
						echo "Đã tắt thành công, enter để quay lại trang!"
						read -p ""
						main6
					elif [ "$check" == "Offline" ]
					then
						clear
						echo "Chưa bật ssh, vui lòng bật rồi thử lại!"
						echo "Enter để tiếp tục!"
						read -p ""
						main6
					fi
				else
					clear
					echo "ssh chưa được bật, vui lòng thử lại sau!"
					echo "Enter để tiếp tục"
					read -p ""
					main6
				fi
			;;
			back)
				main5
			;;
			*)
				main6
			esac
		}
		main6
	;;
	3)
		function main7() {
			if [ -e "$PREFIX/include/ipnetwork" ]
			then
				get=$(grep "ssh session:" $PREFIX/include/ipnetwork)
				clear
				tput setaf 227
				echo "
	[1] Xem thông tin ssh
	[back] Quay lại trang"
				read -p "Lựa chọn: " choice
				case $choice in
				1)
					clear
					on=$(cat $PREFIX/include/status)
					echo "Thông tin ssh:
$get
Host: tmate
Tình trạng: $on"
					echo ""
					echo "Enter để tiếp tục"
					read -p ""
					main7
				;;
				back)
					main5
				;;
				*)
					main7
				esac
			else
				clear
				echo "Bạn chưa bật ssh, nên không thể xem!"
				echo "Enter để tiếp tục"
				read -p ""
				main5
			fi
		}
	main7
	;;
	4)
		function main8() {
			clear
			tput setaf 227
			echo "
	[1] Chỉnh exp server
	[2] Đặt max exp server
	[back] Quay lại trang"
			read -p "Lựa chọn: " choice
			case $choice in
			1)
				clear
				tput setaf 227
				echo ""
				echo "Sau khi chỉnh exp xong, hãy khởi động lại server để có hiệu nhiệm!"
				echo "Exp max là 100"
				echo ""
				tput setaf 227
				read -p "Số exp bạn mong muốn: " exp
				if [ "$exp" -gt 100 ]
				then
					clear
					tput setaf 227
					echo ""
					echo "Exp khong duoc qua 100"
					echo ""
					echo "Enter de tiep tuc"
					read -p ""
					main8
				else
					sed -i "19s/.*/server.girlkun.expserver=$exp/" $PREFIX/share/CustomServer/data/girlkun/girlkun.properties
					echo "Đã chỉnh exp lên $exp thành công!"
					echo ""
					echo "Enter để tiếp tục ..."
					read -p ""
					main8
				fi
				if [ "$exp" -lt 1 ]
				then
					clear
					tput setaf 227
					echo "Exp không được nhỏ hơn 1"
					echo ""
					echo "Enter ,để tiếp tục ..."
					read -p ""
					main8
				else
					clear
					tput setaf 227
					sed -i "19s/.*/server.girlkun.expserver=$exp/" $PREFIX/share/CustomServer/data/girlkun/girlkun.properties
					echo ""
					echo "Đã chỉnh exp lên $exp thành công!"
					echo ""
					echo "Enter để tiếp tục!"
					read -p ""
					main8
				fi
			;;
			2)
			clear
			sed -i "19s/.*/server.girlkun.expserver=100/" $PREFIX/share/CustomServer/data/girlkun/girlkun.properties
			echo ""
			echo "Đã chỉnh max exp thành công!"
			echo ""
			echo "Enter để tiếp tục ..."
			read -p ""
			main8
			;;
			back)
				main5
			;;
			*)
				main8
			esac
		}
		main8
	;;
	5)
		function main9() {
			clear
			tput setaf 227
			echo ""
			echo "
	[1] Chỉnh time login
	[2] Xóa time login
	[3] Đặt time login cho người chơi không thể chơi được
	[back] Quay lại trang"
			echo ""
			tput setaf 227
			read -p "Lựa chọn: " choice
			case $choice in
			1)
				tput setaf 227
				clear
				tput setaf 227
				echo "Hãy đặt time login vừa phải ☺️"
				echo ""
				read -p "Time login của bạn: " timelogin
				sed -i "10s/.*/server.girlkun.waitlogin=$timelogin/" $PREFIX/share/CustomServer/data/girlkun/girlkun.properties
				clear
				echo "Đặt time login $timelogin thành công"
				echo "Enter để tiếp tục ...."
				read -p ""
				main9
			;;
			2)
				tput setaf 227
				clear
				sed -i "10s/.*/server.girlkun.waitlogin=0/" $PREFIX/share/CustomServer/data/girlkun/girlkun.properties
				clear
				echo "Xóa time login thành công"
				echo "Enter để tiếp tục ..."
				read -p ""
				main9
			;;
			3)
				tput setaf 227
				clear
				sed -i "10s/.*/server.girlkun.waitlogin=360000755500037482837482824/" $PREFIX/share/CustomServer/data/girlkun/girlkun.properties
				clear
				echo "Đặt time login trên 10 ngày thành công"
				echo "Enter để tiếp tục ..."
				read -p ""
				main9
			;;
			back)
				main5
			;;
			*)
				main9
			esac
		}
		main9
	;;
	6)
		function main11() {
			clear
			tput setaf 227
			echo "
	[1] Chỉnh max player
	[2] Đặt lại max player gốc
	[back] Quay lại trang
"
			read -p "Lựa chọn: " choice
			case $choice in
			1)
				clear
				tput setaf 227
				echo "
Đặt max player vừa thoi, hong nó lỗi
"
				read -p "Max player: " max
				if [ "$max" == "" ]
				then
					clear
					tput setaf 227
					echo "Vui lòng đặt lại không được bỏ trống!"
					echo ""
					echo "Enter để tiếp tục! "
					read -p ""
					main11
				else
					clear
					sed -i "16s/.*/server.girlkun.maxplayer=$max/" $PREFIX/share/CustomServer/data/girlkun/girlkun.properties
					clear
					tput setaf 227
					echo "Đã chỉnh max play lên $max thành công!"
					echo ""
					echo "Enter để tiếp tục!"
					read -p ""
					main11
				fi
			;;
			2)
				clear
				tput setaf 227
				sed -i "16s/.*/server.girlkun.maxplayer=10000/" $PREFIX/share/CustomServer/data/girlkun/girlkun.properties
				clear
				echo "Đặt max player về gốc thành công! "
				echo ""
				echo "Enter để tiếp tục!"
				read -p ""
				main11
			;;
			back)
				main5
			;;
			*)
				main11
			esac
		}
		main11
	;;
	7)
		function main12() {
			clear
			tput setaf 227
			echo "
	[1] Đặt tên server
	[2] Đặt lại tên gốc server
	[back] Quay lại trang
"
			read -p "Lựa chọn: " choice
			case $choice in
			1)
				clear
				tput setaf 227
				read -p "Tên server bạn muốn đặt: " server
				if [ "$server" = "" ]
				then
					clear
					tput setaf 227
					echo "
Tên không được để trống!
"
					echo "Enter để tiếp tục ..."
					read -p ""
					main12
				else
					clear
					sed -i "6s/.*/server.girlkun.sv1=$server:127.0.0.1:14445:0,0,0/" $PREFIX/share/CustomServer/data/girlkun/girlkun.properties
					clear
					tput setaf 227
					echo "Đặt tên server là $server thành công!"	
					echo "Vui lòng khởi động lại server để có tác dụng!"
					echo "Enter để tiếp tục ..."
					read -p ""
					main12
				fi
			;;
			2)
				clear
				sed -i "6s/.*/server.girlkun.sv1=Nhan_Cu_Bu:127.0.0.1:14445:0,0,0/" $PREFIX/share/CustomServer/data/girlkun/girlkun.properties
				clear
				tput setaf 227
				echo "Đặt tên gốc thành công!"
				echo "Enter để tiếp tục!"
				read -p ""
				main12
			;;
			back)
				main5
			;;
			*)
				main12
			esac
		}
		main12
	;;
	8)
		function main10() {
			clear
			tput setaf 227
			echo "Lựa chọn server mà bán muốn tạo:
	[1] Lulz
	[2] 8glm
	[3] Đăng nhập vps ( Nếu bạn có secret khi đã tạo vps )
	[4] Xóa secret và đăng nhập secret mới
	[5] Xem secret đã lưu
	]6] Secret ( login nhiều tab bằng tay )
	[back] Quay lại trang"
			echo ""
			read -p "Lựa chọn: " choice
			case $choice in
			1)
				tput setaf 227
				clear
				echo "Chuẩn bị ssh tới server trong vòng 5s"
				echo ""
				echo "Password: segfault"
				echo ""
				sleep 5s
				ssh root@lulz.segfault.net
			;;
			2)
				tput setaf 227
				clear
				echo "Chuẩn bị ssh tới server trong vòng 5 giây"
				echo ""
				echo "Password: segfault"
				echo ""
				sleep 5s
				ssh root@8lgm.segfault.net
			;;
			3)
				if [ -e "$PREFIX/include/secret" ]
				then
					clear
					tput setaf 227
					echo "Chuẩn bị ssh tới server trong vòng 5 giây sau"
					echo ""
					echo "Password: segfault"
					sleep 5s
					check=$(cat $PREFIX/include/secret)
					ssh -o "SetEnv SECRET=$check" root@8lgm.segfault.net -p 22
				else
					tput setaf 227
					clear
					echo "Hãy nhớ giữ secret của bạn cẩn thận!"
					echo ""
					echo "Password: segfault"
					echo ""
					read -p "Secret của bạn: " secret
					echo "$secret" > $PREFIX/include/secret
					ssh -o "SetEnv SECRET=$secret" root@8lgm.segfault.net -p 22
				fi
			;;
			4)
				clear
				tput setaf 227
				if [ -e "$PREFIX/include/secret" ]
				then
					get=$(cat $PREFIX/include/secret)
					rm $PREFIX/include/secret
					clear
					tput setaf 227
					echo "Đã xóa secret $get thành công"
					echo ""
					echo "Enter để tiếp tục ..."
					read -p ""
					main10
				else
					clear
					tput setaf 227
					echo "Không thể xóa secret khi chưa đăng nhập secret!"
					echo "Enter để tiếp tục ..."
					read -p ""
					main10
				fi
			;;
			5)
				clear
				if [ -e "$PREFIX/include/secret" ]
				then
				secret=$(cat $PREFIX/include/secret)
					echo "
Secret của bạn: $secret"
					echo "Enter để tiếp tục ..."
					read -p ""
					main10
				else
					echo "Bạn chưa đăng nhập bằng secret nên không thể lưu!"
					echo "Enter để tiếp tục ..."
					read -p ""
					main10
				fi
			;;
			6)
				clesr
				tput setaf 227
				echo "
Password: segfault
"
				read -p "Your secret: " secret
				ssh -o "SetEnv SECRET=$secret" root@lulz.segfault.net -p 22
			;;
			back)
				main5
			;;
			*)
				main10
			esac
		}
		main10
	;;
	9)
		function main14() {
			clear
			tput setaf 227
			clear
			echo "

	[1] Chỉnh tối đa tài khoản được tạo cho một ip
	[2] Đặt max ip về gốc
	[back] Quay lại trang
"
			read -p "Lựa chọn: " choice
			case $choice in
			1)
				clear
				tput setaf 227
				clear
				read -p "Max ip: " maxip
				clear
				if [ "$maxip" -lt 5 ]
				then
					echo "
Không thể đặt max ip dưới 5!

Enter để tiếp tục
"
				read -p ""
				main14
				fi
				if [ "$maxip" = "" ]
				then
					echo "
Không thể bỏ trống khi đặt max ip!

Enter để tiếp tục!
"
					read -p ""
					main14
				else
					clear
					tput setaf 227
					clear
					sed -i "13s/.*/server.girlkun.maxperip=$maxip/" $PREFIX/share/CustomServer/data/girlkun/girlkun.properties
					clear
					echo "
Đã đặt max ip là $maxip

Enter để tiếp tục!
"
					read -p ""
					main14
				fi
			;;
			2)
				clear
				sed -i "13s/.*/server.girlkun.maxperip=10000/" $PREFIX/share/CustomServer/data/girlkun/girlkun.properties
				clear
				tput setaf 227
				echo "
Đã đặt max ip về gốc thành công!

Enter để tiếp tục!
"
				read -p ""
				main14
			;;
			back)
				main5
			;;
			*)
				main14
			esac
		}
		main14
	;;
	10)
		function main15() {
			clear
			tput setaf 227
			echo "
	[1] Chỉnh port
	[2] Đặt về port mặc định
	[back] Quay lại trang
"
			read -p "Lựa chọn: " choice
			case $choice in
			1)
				clear
				tput setaf 227
				read -p "Port mà bạn muốn đặt: " port
				clear
				if [ "$port" == "" ]
				then
					tput setaf 227
					echo "
Port không được để để trống rỗng!

Enter để tiếp tục!
"
					read -p ""
					main15
				else
					clear
					sed -i "4s/.*/server.girlkun.port=$port/" $PREFIX/share/CustomServer/data/girlkun/girlkun.properties
					clear
					tput setaf 227
					echo "
Đặt port $port thành công

Enter để tiếp tục!
"
					read -p ""
					main15
				fi
			;;
			2)
				clear
				sed -i "4s/.*/server.girlkun.port=14445/" $PREFIX/share/CustomServer/data/girlkun/girlkun.properties
				clear
				tput setaf 227
				echo "
Đặt port về 14445 thành công

Enter để tiếp tục ...
"
				read -p ""
				main15
			;;
			back)
				main5
			;;
			*)
				main15
			esac
		}
		main15
	;;
	11)
		function main16() {
			clear
			tput setaf 227
			clear
			echo "
	[1] Tải file nro
	[2] Tải file mt manager
	[3] Tải file j2me
	[4] Tải file database
	[back] Quay lại trang
"
			read -p "Lựa chọn: " choice
			case $choice in
			1)
				tput setaf 227
				clear
				send=$(curl https://google.com > /dev/null 2>&1)
				check=$?
				case $check in
				6)
					echo "
Không có wifi, vui lòng đợi đến khi có wifi lại

Enter đế tiếp tục!
"
					read -p ""
					main16
				esac
				wget -O /sdcard/Nro.apk https://github.com/thanhnhansexy/yeuem-/raw/main/NRO_Offline_v2.2.0.apk > /dev/null 2>&1
				echo "
Tải thành công

Enter để tiếp tục ...
"
				read -p ""
				main16
			;;
			2)
				tput setaf 227
				send=$(curl https://google.com > /dev/nulll 2>&1)
				check=$?
				case $check in
				6)
					echo "
Không có wifi, vui lòng chờ tới khi có wifi trở lại!

Enter để tiếp tục ...
"
					read -p ""
					main16
				esac
				wget -O /sdcard/manager.apk https://github.com/thanhnhansexy/yeuem-/raw/main/MT%20Manager_2.15.0_BANDISHARE.apk > /dev/null 2>&1
				echo "
Tải thành công !

Enter để tiếp tục ...
"
				read -p ""
				main16
			;;
			3)
				send=$(curl https://google.com > /dev/null 2>&1)
				check=$?
				case $check in
				6)
					echo "
Không có wifi, vui lòng chờ tới khi có wifi trở lại!

Enter để tiếp tục ...
"
					read -p ""
					main16
				esac
				wget -O /sdcard/jl.apk https://github.com/thanhnhansexy/yeuem-/raw/main/JL-Mod_0.81-MC_0.98.8-GameDVA.com.apk > /dev/null 2>&1
				echo "
Tải thành công !

Enter để tiếp tục ...
"
				read -p ""
				main16
			;;
			4)
				send=$(curl https://google.com > /dev/null 2>&1)
				check=$?
				case $check in
				6)
					echo "
Không có wifi, vui lòng chờ tới khi có wifi trở lại!

Enter để tiếp tục ...
"
					read -p ""
					main16
				esac
				wget -O /sdcard/Database.sql https://raw.githubusercontent.com/thanhnhansexy/yeuem-/main/nrotea.sql > /dev/null 2>&1
				echo "
Tải thành công

Enter để tiếp tục ...
"
				read -p ""
				main16
			;;
			back)
				main5
			esac
		}
		main16
	;;
	12)
		clear
		tput setaf 227
		getkey=$(cat $PREFIX/include/key.txt)
		echo "
Key hiện tại: $getkey

Enter để tiếp tục ...
"
		read -p ""
		main5
	;;
	13)
		send=$(curl "https://localhost:8080" > /dev/null 2>&1)
		check=$?
		case $check in
		7)
			clear
			echo "Vui lòng dùng mysql trước khi dùng"
			echo "Enter để tiếp tục !"
			read -p ""
			main5
		esac
		if mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl -e "DROP DATABASE nhan;" > /dev/null 2>&1
		then
			clear
			mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl -e "CREATE DATABASE nhan;" > /dev/null 2>&1
			mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl "nhan" < "$PREFIX/include/nro.sql" > /dev/null 2>&1
			tput setaf 227
			echo "
Đã cài đặt lại database thành công!

Enter để tiếp tục ...
"
			read -p ""
			main5
		else
			clear
			mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl -e "CREATE DATABASE nhan;" > /dev/null 2>&1
			mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl "nhan" < "$PREFIX/include/nro.sql" > /dev/null 2>&1
			tput setaf 227
			clear
			echo "
Đã cài lại database thành công!

Enter để tiếp tục!
"
			read -p ""
			main5
		fi
	;;
	14)
		if netstat -tuln | grep -q ":14445"
		then
			clear
			tput setaf 227
			pid=$(lsof -ti :14445)
			kill -9 $pid
			echo "
Fix thành công!

Enter để tiếp tục!
"
			read -p ""
			main5
		else
			echo "
Port 14445 không tồn tại!

Enter để tiếp tục!
"
			read -p ""
			main5
		fi
	;;
	15)
		function main21() {
			tput setaf 227
			clear
			echo "
	[1] Bật autobackup
	[2] Tắt autobackup
	[back] Quay lại trang
"
			read -p "Lựa chọn: " choice
			case $choice in
			1)
				if [ -e "$PREFIX/include/auto_backup" ]
				then
					check=$(cat $PREFIX/include/auto_backup)
					if [ "$check" == "Online" ]
					then
						tput setaf 227
						clear
						echo "
Auto backup đã bật!

Enter để tiếp tục!
"
						read -p ""
						main21
					fi
					if [ "$check" == "Offline" ]
					then
						clear
						bash $PREFIX/include/backup
						clear
						tput setaf 227
						echo "Online" > $PREFIX/include/auto_backup
						clear
						echo "
Bật auto backup thành công

Enter để tiếp tục!
"
						main21
					fi
				else
					clear
					bash $PREFIX/include/backup & disown
					clear
					tput setaf 227
					echo "
Bật auto backup thành công

Enter để tiếp tục!
"
					read -p ""
					main21
				fi
			;;
			2)
				clear
				if [ -e "$PREFIX/include/auto_backup" ]
				then
					check=$(cat $PREFIX/include/auto_backup)
					if [ "$check" == "Online" ]
					then
						pkill mysqldump
						clear
						tput setaf 227
						echo "Offline" > $PREFIX/include/auto_backup
						echo "
Tắt auto backiup thành công!

Enter để tiếp tục!
"
						read -p ""
						main21
					fi
					if [ "$check" == "Offline" ]
					then
						clear
						tput setaf 227
						echo "
Chưa bật auto backup nên không thể tắt!

Enter để tiếp tục!
"
						read -p ""
						main21
					fi
				else
					clear
					tput setaf 227
					echo "
Chưa bật auto backup!

Enter để tiếp tục!
"
					read -p ""
					main21
				fi
			;;
			back)
				main5
			;;
			*)
				main21
			esac
		}
		main21
	;;
	back)
		main
	;;
	*)
		main5
	esac
}
function main17() {
	clear
	tput setaf 227
	echo "
	[1] Tạo tài khoản
	[2] Chỉnh mật khẩu
	[3] Chỉnh username
	[4] Chỉnh vnd
	[5] Thêm quyền admin
	[6] Ban người chơi
	[7] Chỉnh tên tài tài khoản
	[8] Skip nhiệm vụ
	[9] Buff sức đánh
	[10] Buff hp
	[11] Buff ki
	[12] Buff tiềm năng
	[13] Buff giáp
	[14] Buff chí mạng
	[back] Quay lại trang"
	read -p "Lựa chọn: " choice
	case $choice in
	1)
		clear
		tput setaf 227
		read -p "Vui lòng nhập username: " username
		read -p "Vui lòng nhập password: " password
		user_exists=$(mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl nhan -N -e "SELECT COUNT(*) FROM account WHERE username='$username';")
		if [ "$user_exists" -gt 0 ]; then
			clear
			echo "
Username đã tồn tại

Enter để tiếp tục ..."
			read -p ""
			main17
		else
			mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl nhan -e "INSERT INTO account (username, password, create_time, update_time) VALUES ('$username', '$password', NOW(), NOW());"
			echo "
Tạo tài khoản thành công

Username: $username

Mật khẩu: $password

Enter để tiếp tục ...
"
			read -p ""
			main17
		fi
	;;
	2)
		tput setaf 227
		clear
		read -p "Nhập username: " username
		user=$(mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl nhan -N -e "SELECT COUNT(*) FROM account WHERE username='$username';")
		if [ "$user" -gt 0 ]
		then
			tput setaf 227
			read -p "Mật khẩu: " password
			mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl nhan -e "UPDATE account SET password = '$password' WHERE username = '$username';"
			clear
			tput setaf 227
			echo "
Chỉnh mật khẩu thành công

Enter để tiếp tục ...
"
			read -p ""
			main17
		else
			clear
			echo "
Username không đúng

Enter để tiếp tục ...
"
			read -p ""
			main17
		fi
	;;
	3)
		clear
		tput setaf 227
		read -p "Nhập username tài khoản: " username
		user=$(mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl nhan -N -e "SELECT COUNT(*) FROM account WHERE username='$username';")
		if [ "$user" -gt 0 ]
		then
			read -p "Username muốn đổi: " change_username
			mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl nhan -e "UPDATE account SET username = '$change_username' WHERE username = '$username';"
			tput setaf 227
			clear
			echo "
Đổi username thành công!

Enter để tiếp tục ...
"
			read -p ""
			main17
		else
			clear
			echo "
Username không tồn tại

Enter để tiếp tục ...
"
			read -p ""
			main17
		fi
	;;
	4)
		clear
		tput setaf 227
		read -p "Username tài khoan: " username
		user=$(mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl nhan -N -e "SELECT COUNT(*) FROM account WHERE username='$username';")
		if [ "$user" -gt 0 ]
		then
			read -p "Số tiền vnd muốn buff: " vnd
			mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl nhan -e "UPDATE account SET vnd = '$vnd' WHERE username = '$username';"
			clear
			echo "
Buff vnd thành công

Enter để tiếp tục !
"
			read -p ""
			main17
		else
			echo "
Username không tồn tại !

Enter để tiếp tục!
"
			read -p ""
			main17
		fi
	;;
	5)
		function main18() {
			clear
			tput setaf 227
			echo "
	[1] Bật quyền hạn admin
	[2] Tắt quyền hạn admin
	[back] Quay lại trang
"
			read -p "Lựa chọn: " choice
			case $choice in
			1)
				clear
				read -p "Username tài khoản: " username
				user=$(mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl nhan -N -e "SELECT COUNT(*) FROM account WHERE username='$username';")
				if [ "$user" -gt 0 ]
				then
					tput setaf 227
					mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl nhan -e "UPDATE account SET is_admin = '1' WHERE username = '$username';"
					clear
					echo "
Bật quyền hạn admin thành công

Enter để tiếp tục
"
					read -p ""
					main18
				else
					echo "
Username không tồn tại!

Enter để tiếp tục...
"
					read -p ""
					main18
				fi
			;;
			2)
				tput setaf 227
				clear
				read -p "Username tài khoản: " username
				clear
				user=$(mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl nhan -N -e "SELECT COUNT(*) FROM account WHERE username='$username';")
				if [ "$user" -gt 0 ]
				then
					mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl  nhan -e "UPDATE account SET is_admin = '0' WHERE username = '$username';"
					clear
					echo "
Tắt quyền hạn admin thành công!

Enter để tiếp tục !
"
					read -p ""
					main18
				else
					tput setaf 227
					clear
					echo "
Username không tồn tại

Enter để tiếp tục
"
					read -p ""
					main18
				fi
			;;
			back)
				main17
			;;
			*)
				main18
			esac
		}
		main18
	;;
	6)
		function main19() {
			clear
			tput setaf 227
			echo "
	[1] Ban người chơi
	[2] Unban người chơi
[back] Quay lại trang
"
			read -p "Lựa chọn: " choice
			case $choice in
			1)
				clear
				tput setaf 227
				read -p "Nhập tên username tài khoản: " username
				user=$(mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl nhan -N -e "SELECT COUNT(*) FROM account WHERE username='$username';")
				if [ "$user" -gt 0 ]
				then
					clear
					tput setaf 227
					mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl nhan -e "UPDATE account SET ban = '1' WHERE username = '$username';"
					echo "
Ban người chơi thành công

Enter để tiếp tục ...
"
					read -p ""
					main19
				else
					clear
					tput setaf 227
					echo "
Username không tồn tại

Enter để tiếp tục ...
"
					read -p ""
					main19
				fi
			;;
			2)
				clear
				read -p "Nhập username tài khoản: " username
				user=$(mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl nhan -N -e "SELECT COUNT(*) FROM account WHERE username='$username';")
				if [ "$user" -gt 0 ]
				then
					mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl nhan -e "UPDATE account SET ban = '0' WHERE username = '$username';"
					echo "
Đã unban thành công

Enter để tiếp tục ...
"
					read -p ""
					main19
				else
					echo "
Username không tồn tại

Enter để tiếp tục ...
"
					read -p ""
					main19
				fi
			;;
			back)
				main17
			;;
			*)
				main19
			esac
		}
		main19
	;;
	7)
		clear
		tput setaf 227
		read -p "Tên tài khoản: " username
		user=$(mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl nhan -N -e "SELECT COUNT(*) FROM player WHERE name='$username';")
		if [ "$user" -gt 0 ]
		then
			clear
			tput setaf 227
			read -p "Tên tài khoản cần thay đổi: " username_change
			mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl nhan -e "UPDATE player SET name = '$username_change' WHERE name = '$username';"
			clear
			echo "
Chỉnh tên thành $username_change thành công!

Enter để tiếp tục!
"
			read -p ""
			main17
		else
			clear
			tput setaf 227
			echo "
Tên tài khoản không tồn tại hoặc chưa tạo nhân vật!

Enter để tiếp tục!
"
			read -p ""
			main17
		fi
	;;
	8)
		function main20() {
			clear
			tput setaf 227
			echo "
	[1] Skip hết nhiệm vụ
	[2] Quay lại nhiệm vụ đầu
	[3] Skip nhiệm vụ theo id
	[back] Quay lại trang
	"
			read -p "Lựa chọn: " choice
			case $choice in
			1)
				clear
				tput setaf 227
				read -p "Name tài khoản: " username
				user=$(mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl nhan -N -e "SELECT COUNT(*) FROM player WHERE name='$username';")
				if [ "$user" -gt 0 ]
				then
					mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl nhan -e "UPDATE player SET data_task = '[32,0,1]' WHERE name = '$username';"
					tput setaf 227
					echo "
Skip đến hết nhiệm vụ thành công!

Enter để tiếp tục!
"
					read -p ""
					main20
				else
					tput setaf 227
					echo "
Name không tồn tại hoặc chưa tạo tài khoản!

Enter để tiếp tục!
"
					read -p ""
					main20
				fi
			;;
			2)
				clear
				tput setaf 227
				read -p "Name tài khoản: " username
				user=$(mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl nhan -N -e "SELECT COUNT(*) FROM player WHERE name='$username';")
				if [ "$user" -gt 0 ]
				then
					mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl nhan -e "UPDATE player SET data_task = '[1,0,1]' WHERE name = '$username';"
					clear
					tput setaf 227
					echo "
Quay về nhiệm vụ đầu thành công!

Enter để tiếp tục!
"
					read -p ""
					main20
				else
					echo "
Name tài khoản không tồn tại hoặc chưa tạo tài khoản

Enter để tiếp tục!
"
					read -p ""
					main20
				fi
			;;
			3)
				clear
				tput setaf 227
				read -p "Nhập tên tài khoản: " username
				user=$(mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl nhan -N -e "SELECT COUNT(*) FROM player WHERE name='$username';")
				if [ "$user" -gt 0 ]
				then
					echo "
Id nhiệm vụ: 1-32
"
					read -p " ID nhiệm vụ: " id
					if [ "$id" -gt 32 ]
					then
						echo "
Skip nhiệm vụ không thành công!


Không thể skip tới nhiệm vụ: $id

Enter để tiếp tục!
"
						read -p ""
						main20
					fi
					if [ "$id" -lt 1 ]
					then
						echo "
Nhiệm vụ không thể nhỏ hơn 1!

Enter để tiếp tục!
"
						read -p ""
						main20
					fi
					mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl nhan -e "UPDATE player SET data_task = '[$id,0,1]' WHERE name = '$username';"
					clear
					tput setaf 227
					echo "
Skip nhiệm vụ đến ID $id thành công!

Enter để tiếp tục!
"
					read -p ""
					main20
				else
					echo "
Name tài khoản không tồn tại hoặc chưa tạo nhân vật!

Enter để tiếp tục!
"
					read -p ""
					main20
				fi
			;;
			back)
				main17
			;;
			*)
				main20
			esac
		}
		main20
	;;
	9)
		clear
		tput setaf 227
		read -p "Nhập tên tài khoản: " username
		check=$(mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl nhan -N -e "SELECT COUNT(*) FROM player WHERE name='$username';")
		if [ "$check" -gt 0 ]
		then
			tput setaf 227
			user=$(mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl nhan -se "SELECT data_point FROM player WHERE name = '$username';")
			IFS=',' read -r -a data_array <<< "$user"
			read -p "Sức đánh cần buff: " buff
			data_array[7]=$buff
			new_data=$(IFS=','; echo "${data_array[*]}")
			mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl nhan -e "UPDATE player SET data_point='$new_data' WHERE name = '$username';"
			clear
			echo "
Buff sức đánh lên $buff thành công!

Enter để tiếp tục!
"
			read -p ""
			main17
		else
			echo "
Name tài khoản không tồn tại hoặc chưa tạo nhân vật!

Enter để tiếp tục!
"
			read -p ""
			main17
		fi
	;;
	10)
		clear
		tput setaf 227
		read -p "Nhập tên tài khoản: " username
		check=$(mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl nhan -N -e "SELECT COUNT(*) FROM player WHERE name='$username';")
		if [ "$check" -gt 0 ]
		then
			tput setaf 227
			user=$(mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl nhan -se "SELECT data_point FROM player WHERE name = '$username';")
			IFS=',' read -r -a data_array <<< "$user"
			read -p "Hp cần buff: " buff
			data_array[5]=$buff
			new_data=$(IFS=','; echo "${data_array[*]}")
			mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl nhan -e "UPDATE player SET data_point='$new_data' WHERE name = '$username';"
			clear
			echo "
Buff hp lên $buff thành công!

Enter để tiếp tục!
"
			read -p ""
			main17
		else
			echo "
Name tài khoản không tồn tại hoặc chưa tạo nhân vật!

Enter để tiếp tục!
"
			read -p ""
			main17
		fi
	;;
	11)
		clear
		tput setaf 227
		read -p "Nhập tên tài khoản: " username
		check=$(mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl nhan -N -e "SELECT COUNT(*) FROM player WHERE name='$username';")
		if [ "$check" -gt 0 ]
		then
			tput setaf 227
			user=$(mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl nhan -se "SELECT data_point FROM player WHERE name = '$username';")
			IFS=',' read -r -a data_array <<< "$user"
			read -p "Ki cần buff: " buff
			data_array[6]=$buff
			new_data=$(IFS=','; echo "${data_array[*]}")
			mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl nhan -e "UPDATE player SET data_point='$new_data' WHERE name = '$username';"
			clear
			echo "
Buff Ki lên $buff thành công!

Enter để tiếp tục!
"
			read -p ""
			main17
		else
			echo "
Name tài khoản không tồn tại hoặc chưa tạo nhân vật!

Enter để tiếp tục!
"
			read -p ""
			main17
		fi
	;;
	12)
		clear
		tput setaf 227
		read -p "Nhập tên tài khoản: " username
		check=$(mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl nhan -N -e "SELECT COUNT(*) FROM player WHERE name='$username';")
		if [ "$check" -gt 0 ]
		then
			tput setaf 227
			user=$(mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl nhan -se "SELECT data_point FROM player WHERE name = '$username';")
			IFS=',' read -r -a data_array <<< "$user"
			read -p "Tiềm năng cần buff: " buff
			data_array[2]=$buff
			new_data=$(IFS=','; echo "${data_array[*]}")
			mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl nhan -e "UPDATE player SET data_point='$new_data' WHERE name = '$username';"
			clear
			echo "
Buff tiềm năng lên $buff thành công!

Enter để tiếp tục!
"
			read -p ""
			main17
		else
			echo "
Name tài khoản không tồn tại hoặc chưa tạo nhân vật!

Enter để tiếp tục!
"
			read -p ""
			main17
		fi
	;;
	13)
		clear
		tput setaf 227
		read -p "Nhập tên tài khoản: " username
		check=$(mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl nhan -N -e "SELECT COUNT(*) FROM player WHERE name='$username';")
		if [ "$check" -gt 0 ]
		then
			tput setaf 227
			user=$(mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl nhan -se "SELECT data_point FROM player WHERE name = '$username';")
			IFS=',' read -r -a data_array <<< "$user"
			read -p "Số giáp cần buff: " buff
			data_array[8]=$buff
			new_data=$(IFS=','; echo "${data_array[*]}")
			mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl nhan -e "UPDATE player SET data_point='$new_data' WHERE name = '$username';"
			clear
			echo "
Buff giáp lên $buff thành công!

Enter để tiếp tục!
"
			read -p ""
			main17
		else
			echo "
Name tài khoản không tồn tại hoặc chưa tạo nhân vật!

Enter để tiếp tục!
"
			read -p ""
			main17
		fi
	;;
	14)
		clear
		tput setaf 227
		read -p "Nhập tên tài khoản: " username
		check=$(mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl nhan -N -e "SELECT COUNT(*) FROM player WHERE name='$username';")
		if [ "$check" -gt 0 ]
		then
			tput setaf 227
			user=$(mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl nhan -se "SELECT data_point FROM player WHERE name = '$username';")
			IFS=',' read -r -a data_array <<< "$user"
			read -p "Chí mạng cần buff: " buff
			data_array[9]=$buff
			new_data=$(IFS=','; echo "${data_array[*]}")
			mariadb -u root --password="root" -h 127.0.0.1 --skip-ssl nhan -e "UPDATE player SET data_point='$new_data' WHERE name = '$username';"
			clear
			echo "
Buff chí mạng lên $buff thành công!

Enter để tiếp tục!
"
			read -p ""
			main17
		else
			echo "
Name tài khoản không tồn tại hoặc chưa tạo nhân vật!

Enter để tiếp tục!
"
			read -p ""
			main17
		fi
	;;
	back)
		main
	;;
	*)
		main17
	;;
	esac
}
function main() {
	clear
	tput setaf  158
	echo "Device Information:"
	tput setaf 158
	echo "	All memory: $total"
	tput setaf 158
	echo "	Memory used: $used"
	tput setaf 158
	echo "	Arm device: $arm"
	tput setaf 158
	echo "	Device name: $name"
	tput setaf 158
	echo "	Device manufacturer: $pub"
	tput setaf 158
	echo "	Accommodation: $country"
	tput setaf 158
	echo "	Timezone: $timezone"
	tput setaf 158
	echo "	Language being used: $lang"
	tput setaf 158
	echo "	System in use: $sys"
	tput setaf 158
	echo "	Model name: $model"
	tput setaf 165
	echo "Information about sms:"
	tput setaf 165
	echo "	SMS publisher: $sim"
	tput setaf 165
	echo "	Type of network in use: $ll"
	tput setaf 227
	echo "Network information:"
	tput setaf 227
	echo "	IP: $getip"
	tput setaf 227
	echo "---------------------------------------"
	tput setaf 227
	echo "	[1] Xem thông tin admin"
	tput setaf 227
	echo "	[2] Xem thông báo từ admin"
	tput setaf 227
	echo "	[3] Gửi report và tố cáo đến admin"
	tput setaf 227
	echo "	[4] Một ít chức năng"
	tput setaf 227
	echo "	[5] Đổi key"
	echo "	[6] Tắt nhạc"
	echo "	[7] Bật nhạc"
	echo "	[8] Xuất file sql"
	echo "	[9] Load lại menu"
	echo "	[10] Chức năng liên quan đến phpmyadmin"
	echo "	[11] Cập nhật bản mới"
	echo "	[exit] Thoát"
	tput setaf 227
	read -p "Lựa chọn: " choice
	case $choice in
	1)
		main1
	;;
	2)
		main2
	;;
	3)
		main3
	;;
	4)
		main5
	;;
	5)
		function main13() {
			clear
			tput setaf 227
			echo "
[1] Đổi key
[back] Quay lại trang chủ
"
			read -p "Lựa chọn: " choice
			case $choice in
			1)
				clear
				rm $PREFIX/bin/openkey > /dev/null 2>&1
				clear
				tput setaf 227
				keycu=$(cat $PREFIX/include/key.txt)
				xoakey=$(rm $PREFIX/include/key.txt > /dev/null 2>&1)
				tput setaf 227
				read -p "Key của bạn: " key
				wget -O "$PREFIX/include/listkey" "https://raw.githubusercontent.com/thanhnhansexy/yeuem-/main/listkey" > /dev/null 2>&1	
				check=$(cat $PREFIX/include/listkey | grep "$key")
				if [ "$key" = "" ]
				then
					tput setaf 227
					echo "Key does not exist"
					pkill play
					exit
				fi
				if [ "$key" == "$check" ]
				then
					tput setaf 227
					echo "
Key cũ: $keycu
Key mới: $key
"
					echo "Load key successfully!"
					echo "Enter để tiếp tục ..."
					read -p ""
					rm $PREFIX/include/listkey > /dev/null 2>&1
					echo "$key" > $PREFIX/include/key.txt
					main
				else
					tput setaf 227
					echo "Load key failed"
					pkill play
					exit
					rm $PREFIX/include/listkey > /dev/null 2>&1
				fi
			;;
			back)
				main
			;;
			*)
				main13
			esac
		}
		main13
	;;
	6)
		clear
		pkill play
		tput setaf 227
		echo "
Tắt nhạc thành công

Enter để tiếp tục ...
"
		read -p ""
		main
	;;
	7)
		clear
		tput setaf 227
		nohup play $PREFIX/include/music_list/music.mp3 > /dev/null 2>&1 & disown
		clear
		echo "
Bật nhạc thành công

Enter để tiếp tục!
"
		read -p ""
		main
	;;
	8)
		clear
		send=$(curl "https://127.0.0.1:8080" > /dev/null 2>&1)
		check=$?
		case $check in
		7)
			echo "
Vui lòng bật mysql --start để sử dụng!

Enter để tiếp tục ...
"
			read -p ""
		esac
		nohup mysqldump -u root --password="root" -h 127.0.0.1 --skip-ssl nhan > /sdcard/nhan.sql
		clear
		tput setaf 227
		echo "
Đã xuất database nhan ở thư mục /sdcard

Enter để tiếp tục
"
		read -p ""
		main
	;;
	9)
		menu
	;;
	10)
		main17
	;;
	11)
		send=$(curl https://google.com > /dev/null 2>&1)
		check=$?
		case $check in
		6)
			echo "Không có wifi nên không update !"
			exit
		esac
		wget -O "$PREFIX/include/update" "https://raw.githubusercontent.com/thanhnhansexy/yeuem-/main/update" > /dev/null 2>&1
		bash $PREFIX/include/update
	;;
	exit)
		pkill play
		exit
	;;
	*)
		main
	esac
}
main
