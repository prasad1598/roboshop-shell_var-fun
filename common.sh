pwd=$(pwd)

nodejs() {
dnf module disable ${component_name} -y
dnf module enable ${component_name}:20 -y
dnf install ${component_name} -y
app_pre-req
npm install
}

golang() {
dnf install golang -y
cp ${pwd}/${component_name}.service /etc/systemd/system/${component_name}.service
}

app_pre-req() {
useradd roboshop
mkdir /app
curl -L -o /tmp/${component_name}.zip https://roboshop-artifacts.s3.amazonaws.com/${component_name}-v3.zip
cd /app
rm -rf /app/*
unzip /tmp/catalogue.zip
cd /app
}


systemd_setup() {
cp ${pwd}/${component_name}.service /etc/systemd/system/${component_name}.service
systemctl daemon-reload
systemctl enable ${component_name}
systemctl start ${component_name}
}

python() {
dnf install python3 gcc python3-devel -y
app_pre-req
pip3 install -r requirements.txt
}

java() {
dnf install maven -y
cp ${pwd}/${component_name}.service /etc/systemd/system/${component_name}.service
app_pre-req
mvn clean package
mv target/shipping-1.0.jar shipping.jar
}