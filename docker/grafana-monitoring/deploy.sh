#!/bin/sh

if [ "$EUID" -ne 0 ]
  then echo "Please run script as root or with sudo!"
  exit
fi

# Create needed folders
mkdir /appdata
mkdir /appdata/telegraf
mkdir /appdata/grafana
mkdir /appdata/grafana/etc-grafana
mkdir /appdata/grafana/var-lib-grafana
mkdir /appdata/influxdb

chmod -R 776 /appdata/grafana

# Get Telegraf configuration file
wget -nc -O /appdata/telegraf/telegraf.conf https://raw.githubusercontent.com/KomelT/boilerplates/master/docker/grafana-monitoring/conf/telegraf.conf

# Get Grafana configuration file
wget -nc -O /appdata/grafana/etc-grafana/grafana.ini https://raw.githubusercontent.com/KomelT/boilerplates/master/docker/grafana-monitoring/conf/grafana.ini

cp -n nginx.conf /etc/nginx/sites-available/grafana-monitoring
ln -s /etc/nginx/sites-available/grafana-monitoring /etc/nginx/sites-enabled/grafana-monitoring

echo ""
echo ""
echo "Edit 'server_name' in Nginx configuration: 'sudo nano /etc/nginx/sites-enabled/grafana-monitoring'."
echo "When you done do 'sudo nginx -t' if comand ends with success run 'sudo service nginx restart'."
echo "Then create 'docker-compose.yaml' file from 'docker-compose.sample.yaml' fill all ENV and then run 'docker-compose up -d'"