# Grafana Telegraf InfluxDB

## 1. Deploy containers

```
sudo ./deploy.sh
```

## 2. Set up InfluxDB

In browser open http://{server-ip}:8086.
Press "Get started".
Fill in username, password, organization and default bucket name.
In left side menu click on "Data".
In top menu click on "Buckets" and create one. For example "telegraf_local".
In top menu click on "Telegraf" and create configuration.
Don't forget to save the token.

## 3. Set up Telegraf

```
sudo nano /appdata/telegraf/telegraf.conf
```

Find `[[outputs.influxdb]]` and disable it by commenting it.

```
...
# Configuration for sending metrics to InfluxDB
#[[outputs.influxdb]]
  ## The full HTTP or UDP URL for your InfluxDB instance.
...
```

Then find `[[outputs.influxdb_v2]]` and enable it by uncommenting it and fill it up with data we created before.

```
...
# # Configuration for sending metrics to InfluxDB
 [[outputs.influxdb_v2]]
#   ## The URLs of the InfluxDB cluster nodes.
#   ##
#   ## Multiple URLs can be specified for a single cluster, only ONE of the
#   ## urls will be written to each interval.
#   ##   ex: urls = ["https://us-west-2-1.aws.cloud2.influxdata.com"]
   urls = ["http://{server-ip}:8086"]
#
#   ## Token for authentication.
   token = "INFLUXDB TOKEN"
#
#   ## Organization is the name of the organization you wish to write to; must exist.
   organization = "INFLUXDB ORGANIZATION"
#
#   ## Destination bucket to write into.
   bucket = "INFLUXDB BUCKET NAME"
...
```
