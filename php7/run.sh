#!/bin/bash

[[ -e composer.json ]] && [[ ! -e vendor ]] && composer install
nginx 
php-fpm7.0 -F

