#定基础镜像
FROM jdk8:1.0
#作者
MAINTAINER LH
ENV  LANG C.UTF-8
#执行命令
RUN mkdir  -p /opt/module/backend/cindasc/apps-cindasc-cms
#cd到工作目录
WORKDIR   /opt/module/backend/cindasc/apps-cindasc-cms
#暴露端口
EXPOSE 8848 22 8858 3306 8890
#执行命令
CMD sh app-shell.sh  && tail -f logs/cms.log

