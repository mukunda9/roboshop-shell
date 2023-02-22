common.sh
print_head "install golang"
yum install golang -y>>${log_file}
status_check $?

print_head "Create Roboshop User"
id roboshop  &>>${log_file}
if [ $? -ne 0 ]; then
  useradd roboshop &>>${log_file}
fi
status_check $?
print_head "Create Application Directory"
if [ ! -d /app ]; then
  mkdir /app &>>${log_file}
fi
status_check $?
print_head "Delete Old Content"
rm -rf /app/* &>>${log_file}
status_check $?

print_head "Downloading App Content"
curl -L -o /tmp/dispatch.zip https://roboshop-artifacts.s3.amazonaws.com/dispatch.zip  &>>${log_file}
status_check $?
cd /app

print_head "Extracting App Content"
unzip /tmp/dispatch.zip &>>${log_file}
status_check $?


