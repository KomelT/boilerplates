# You can also use openssl instead: `openssl rand -base64 36`
apk add pwgen
# Because of a PostgreSQL limitation, only passwords up to 99 chars are supported
# See https://www.postgresql.org/message-id/09512C4F-8CB9-4021-B455-EF4C4F0D55A0@amazon.com

cp .env.sample .env

echo "PG_PASS=$(pwgen -s 40 1)" >> .env
echo "AUTHENTIK_SECRET_KEY=$(pwgen -s 50 1)" >> .env
# Skip if you don't want to enable error reporting
echo "AUTHENTIK_ERROR_REPORTING__ENABLED=true" >> .env