#!/usr/bin/env bash

rm "/etc/nginx/sites-enabled/$1"
rm "/etc/nginx/sites-available/$1"

service nginx restart