#!/bin/bash
# registry.cn-beijing.aliyuncs.com/
set -e

gf build main.go -a amd64 -s linux -p ./temp
gf docker main.go -t liuhuapiaoyuan/ai-removebg:latest
# 修改镜像标签为当前日期时间
time=$(date "+%Y%m%d%H%M%S")
docker tag liuhuapiaoyuan/ai-removebg:latest liuhuapiaoyuan/ai-removebg:$time
# 推送镜像到docker hub
docker push liuhuapiaoyuan/ai-removebg:latest
docker push liuhuapiaoyuan/ai-removebg:$time
