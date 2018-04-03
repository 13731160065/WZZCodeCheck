#!/bin/bash

if [ -e "$1" ]; then
	echo
else
    echo -e "\033[32mversion 1.0.0\033[0m"
    echo "使用方法:将需要检测的路径放在该文件后面"
    echo "例如:./checkLib-wzz.sh xxx"
    exit 0
fi

arr=`find $1 -name "*.a"`

for aaa in $arr; do
	echo $aaa;
	tmpaaa=`nm -u $aaa | grep "_dlopen\|_dlsym" -n`
	if [ ! -n "$tmpaaa" ]; then
		echo -e "\033[32m未发现问题\033[0m"
	else
		echo -e "\033[31m发现可疑方法:" $tmpaaa "\033[0m"	
	fi
done
