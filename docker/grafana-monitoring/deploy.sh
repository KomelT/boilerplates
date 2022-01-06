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

# Get Telegraf configuration file
wget -O /appdata/telegraf/telegraf.conf https://raw.githubusercontent.com/KomelT/boilerplates/master/docker/grafana-monitoring/conf/telegraf.conf

# Get Grafana configuration file
wget -nc -O /appdata/grafana/etc-grafana/grafana.ini https://raw.githubusercontent.com/KomelT/boilerplates/master/docker/grafana-monitoring/conf/grafana.ini

# Compose up the containers
docker-compose up -d