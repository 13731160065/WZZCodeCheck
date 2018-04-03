#!/bin/bash

if [ -e "$1" ]; then
	echo a>/dev/null
else
    	echo -e "\033[32mversion 1.0.0\033[0m"
   	echo "使用方法:将需要检测的路径放在该文件后面"
    	echo "例如:./checkLib-wzz.sh xxx"
	echo "主要功能:检测工程中是否调用私有接口或热更新"
    	exit 0
fi

arr=`find $1 -name "*.a"`

for aaa in $arr; do
	tmpaaa=`nm -u $aaa | grep "_dlopen\|_dlsym" -n`
	if [ ! -n "$tmpaaa" ]; then
        	echo a>/dev/null
	else
		echo $aaa
		echo -e "\033[31m发现可疑方法:" $tmpaaa "\033[0m"	
	fi
done

arr2=`find $1 -name "*.m"`

for aaa in $arr2; do
	tmpaaa=`cat $aaa | grep "/System/Library/PrivateFrameworks" -n`
	if [ ! -n "$tmpaaa" ]; then
        	echo a>/dev/null
	else
 		echo $aaa
        	echo -e "\033[31m发现可疑方法:" $tmpaaa "\033[0m"
    	fi
done
