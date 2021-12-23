if [ "$EUID" -ne 0 ]
  then echo "Please run script as root or with sudo!"
  exit
fi

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