nohup java -jar -Xms1024m -Xmx1024m -Dloader.path=libs,config  /opt/module/backend/cindasc/apps-cindasc-cms/joyadata.cms-0.0.9.jar  --spring.profiles.active=dev > logs/cms.log 2>&1 &
