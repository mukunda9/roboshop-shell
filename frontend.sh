source common.sh
print_head "install nginx"
echo -e "\e[34m install nginx\e[0m"
yum install nginx -y
echo -e "\e[35m removing old content nginx\e[0m"
rm -rf /usr/share/nginx/html/*
echo -e "\e[34m Download nginx\e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip
echo -e "\e[31m extract nginx\e[0m"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip
echo -e "\e[32m copying nginx config for roboshop\e[0m"
cp  $(code_dir)/configs/nginx-roboshop.conf /etc/nginx/default.d/roboshop.conf
echo -e "\e[33m enable nginx\e[0m"
systemctl enable nginx
echo -e "\e[34m stating nginx\e[om"
systemctl restart nginx