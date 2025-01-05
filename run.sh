#!/bin/bash
mysql=$(curl "http://localhost:8080" > /dev/null 2>&1)
check=$?
case $check in
7)
	echo "Mở mysql để run /menu"
	exit
esac
check=$(cat "$PREFIX/include/key.txt" 2>/dev/null)
if [ -n "$check" ]
then
	clear
	cd $PREFIX/share/CustomServer && java -jar -server NroTea.jar && cd
else
	echo "Bạn cần phải nhập key thì menu mới chạy được"
	exit
fi
