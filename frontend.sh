echo -e "\e[34minstall nginx\e[m0"
yum install nginx -y
echo -e "\e[34mremoving old content nginx\e[m0"
rm -rf /usr/share/nginx/html/*
echo -e "\e[34mdownloding nginx\e[m0"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip
echo -e "\e[34mextract nginx\e[m0"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip
echo -e "\e[32mcopying nginx config for roboshop\e[m0"
cp configs/nginx-roboshop.conf /etc/nginx/default.d/roboshop.conf
echo -e "\e[33menble nginx\e[m0"
systemctl enable nginx
echo -e "\e[34mistating nginx\e[m0"
systemctl restart nginx