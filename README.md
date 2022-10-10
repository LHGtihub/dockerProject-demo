# 工程简介
采用Docker容器部署项目，start.sh自动化脚本，起动项目jar包类型。
Dockerfile中的基础镜像需要自己构建（FROM jdk8:1.0）
dockerProject-demo目录下的所有文件不可以移到其他目录去，可能会造成Dockerfile/stat.sh脚本文件找不到文件等错误。
