#!/bin/bash
#设置本地的工作路径
LOCAL_WORKDIR=/opt/module/backend/cindasc/apps-cindasc-cms
#设置容器的工作地址
CONTAINER_WORKDIR=/opt/module/backend/cindasc/apps-cindasc-cms
#标记容器的名称
CONTAINER_NAME=apps-cindasc-cms

#CONTAINER_ID=$(docker ps -a|grep ${CONTAINER_NAME}|awk '{print $1}')
#获取镜像容器全id
CONTAINER_ID=$(docker ps --no-trunc -a|grep ${CONTAINER_NAME}|awk '{print $1}')
echo "获取到的容器的id为：${CONTAINER_ID}"
#将容器中的日志情空
echo > /var/lib/docker/containers/$CONTAINER_ID/$CONTAINER_ID-json.log
if test -z $CONTAINER_ID
then
  echo "容器未启动，正在启动容器！"
  #在Dockerfile目录下构建镜像
  docker build -t $CONTAINER_NAME:1.0 .
  
  docker run \
  --name $CONTAINER_NAME \
  -dit \
  -e JVM_XMS=512m \
  -e JVM_XMX=512m \
  --network=host \
  -w $CONTAINER_WORKDIR \
  -v $LOCAL_WORKDIR:$CONTAINER_WORKDIR \
  $CONTAINER_NAME:1.0 && docker logs -f $CONTAINER_NAME
else
   echo "停止容器中..."
   docker stop $CONTAINER_ID 
   echo "容器已经停止，正在重启容器！"
   docker start $CONTAINER_ID && docker logs -f $CONTAINER_NAME
   echo "容器启动成功"
fi
