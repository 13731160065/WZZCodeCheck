#!/bin/bash
if [ -e "$1" ]; then
	echo
else
	echo "未找到该文件，你是不是忘了把文件包传给我？"
	exit 0
fi
rm -rf ./tmpabcipa
rm -rf ./Assets.json
mkdir ./tmpabcipa
cp "$1" ./tmpabcipa/tmpabc.zip
unzip ./tmpabcipa/tmpabc.zip -d ./tmpabcipa/ > /dev/null
sudo -S xcrun --sdk iphoneos assetutil --info ./tmpabcipa/Payload/*.app/Assets.car > ./Assets.json
rm -rf ./tmpabcipa
echo "查找P3:"
grep "P3" ./Assets.json -i > /dev/null
if [ $? -eq 0 ]; then
	echo -e "[\033[31merror\033[0m]找到P3图请注意!!!"
	grep "P3" ./Assets.json -ni
else
	echo -e "[\033[32mok\033[0m]未找到P3图"
fi
echo "查找16位图:"
grep "\"BitsPerComponent\"\ :\ 16" ./Assets.json -i > /dev/null
if [ $? -eq 0 ]; then
        echo -e "[\033[31merror\033[0m]找到16位图请注意!!!"
	grep "\"BitsPerComponent\"\ :\ 16" ./Assets.json -ni
else
        echo -e "[\033[32mok\033[0m]未找到16位图"
fi
