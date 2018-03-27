#!/bin/bash
if [ -e "$1" ]; then
	echo
else
	echo "未找到该文件，你是不是忘了把文件包传给我？"
	exit 0
fi
cp "$1" ./
rm -rf Assets.json
unzip ./*.ipa > /dev/null
mv ./Payload/DuoDuoFu.app/Assets.car ./
sudo -S xcrun --sdk iphoneos assetutil --info ./Assets.car > ./Assets.json
rm -rf Assets.car Payload
echo "查找P3:"
grep "P3" ./Assets.json > /dev/null
if [ $? -eq 0 ]; then
	echo -e "[\033[31merror\033[0m]找到P3图请注意!!!"
else
	echo -e "[\033[32mok\033[0m]未找到P3图"
fi
echo "查找16位图:"
grep "\"BitsPerComponent\"\ :\ 16" ./Assets.json > /dev/null
if [ $? -eq 0 ]; then
        echo -e "[\033[31merror\033[0m]找到16位图请注意!!!"
else
        echo -e "[\033[32mok\033[0m]未找到16位图"
fi
