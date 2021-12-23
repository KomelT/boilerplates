# Create needed folders
mkdir /appdata
mkdir /appdata/telegraf
mkdir /appdata/grafana
mkdir /appdata/influxdb

cd /appdata/telegraf

# Get Telegraf configuration file
wget https://raw.githubusercontent.com/influxdata/telegraf/master/etc/telegraf.conf

# Compose up the containers
docker-compose up -d