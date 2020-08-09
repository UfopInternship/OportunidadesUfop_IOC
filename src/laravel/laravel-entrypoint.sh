#!/bin/bash

set -e

chmod 777 -R /app
echo -e "\e[1;31;42m Mudando as permissoes da pasta do laravel! \e[0m";

echo -e "\e[1;31;42m Installing/Updating Laravel dependencies (composer)! \e[0m";
if [[ ! -f /app/vendor ]]; then
  composer install
  echo -e "\e[1;31;42m Dependencies installed! \e[0m";
else
  composer update
  echo -e "\e[1;31;42m Dependencies updated! \e[0m";
fi

php artisan key:generate
echo -e "\e[1;31;42m Gerando chave do laravel! \e[0m";

php artisan config:clear
php artisan config:cache
echo -e "\e[1;31;42m Lipando o cache de configuracoes do sistema e reconfigurando! \e[0m";

exec "$@";