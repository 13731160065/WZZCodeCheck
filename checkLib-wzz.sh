#!/bin/bash

arr=`find . -name "*.a"`

for aaa in $arr; do
	echo $aaa;
	tmpaaa=`nm -u $aaa | grep "_dlopen\|_dlsym" -n`
	if [ ! -n "$tmpaaa" ]; then
		echo -e "\033[32m未发现问题\033[0m"
	else
		echo -e "\033[31m发现可疑方法:" $tmpaaa "\033[0m"	
	fi
done
