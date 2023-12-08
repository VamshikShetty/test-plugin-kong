#!/usr/bin/env bash
set -e

export KONG_NGINX_DAEMON=off
export KONG_DECLARATIVE_CONFIG=/etc/kong/kong.yml

PREFIX=${KONG_PREFIX:=/usr/local/kong}

if [[ "$1" == "kong" && "$2" == "docker-start" ]]; then

   # Kong migrations
   kong migrations bootstrap
   kong migrations up
   kong migrations finish

   # Kong prep
   kong prepare -p "$PREFIX"

   # Set up custom plugins
   luarocks make testplugin-0.1-1.rockspec

   exec /usr/local/openresty/nginx/sbin/nginx -p "$PREFIX" -c nginx.conf
fi

exec "$@"