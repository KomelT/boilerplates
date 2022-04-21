#!/bin/sh

echo ""
echo ""

if [ "$EUID" -ne 0 ]
  then echo "Please run script as root or with sudo!"
  exit
fi

# Create needed folders
mkdir -p /appdata/statping && echo "Telegraf folder created successfully!"

if [ $? -ne 0 ]; then
    echo "Exitting because of error!"
    exit 1
fi

cp nginx.conf /etc/nginx/sites-available/statping && echo "Nginx config copied successfully!"

if [ $? -ne 0 ]; then
    echo "Exitting because of error!"
    exit 1
fi

ln -s /etc/nginx/sites-available/statping /etc/nginx/sites-enabled/statping && echo "Symbolic link created successfully!"

if [ $? -ne 0 ]; then
    echo "Exitting because of error!"
    exit 1
fi

nginx -t && service nginx restart && echo "Nginx config is OK!"

if [ $? -ne 0 ]; then
    echo "Exitting because of error!"
    exit 1
fi

docker-compose up -d