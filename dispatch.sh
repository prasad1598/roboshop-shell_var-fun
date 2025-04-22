component_name=dispatch
source common.sh


golang
app_pre-req

go mod init dispatch
go get
go build

systemd_setup