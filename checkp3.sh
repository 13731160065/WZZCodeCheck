#!/bin/bash
rm -rf Assets.json
unzip ./*.ipa > /dev/null
mv ./Payload/DuoDuoFu.app/Assets.car ./
sudo -S xcrun --sdk iphoneos assetutil --info ./Assets.car > ./Assets.json
rm -rf Assets.car Payload
echo "查找P3"
grep "P3" ./Assets.json
echo "查找16位图"
grep "\"BitsPerComponent\"\ :\ 16" ./Assets.json 
