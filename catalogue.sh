component_name=catalogue
source common.sh

nodejs

systemd_setup

cp ${pwd}/mongo.repo /etc/yum.repos.d/mongo.repo
dnf install mongodb-mongosh -y
mongosh --host mongodb-dev.prasaddevops.shop </app/db/master-data.js