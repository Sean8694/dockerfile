#! /bin/bash

set -e

if [[ -z $PROXY_PORT ]]; then
	echo "enviroment param PROXY_PORT is needed!"
	exit 1
fi
sed -i "s/PROXY_PORT/${PROXY_PORT}/g" /privoxy_cfg.conf

if [[ ! $SOCKS_ADDR ]]; then
	sed -i "s/SOCKS_ADDR/127.0.0.1/g" /privoxy_cfg.conf
else
	sed -i "s/SOCKS_ADDR/${SOCKS_ADDR}/g" /privoxy_cfg.conf
fi

if [[ ! $SOCKS_PORT ]]; then
	sed -i "s/SOCKS_PORT/1080/g" /privoxy_cfg.conf
else
    sed -i "s/SOCKS_PORT/${SOCKS_PORT}/g" /privoxy_cfg.conf
fi

privoxy --no-daemon /privoxy_cfg.conf
