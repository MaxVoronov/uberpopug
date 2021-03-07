#!/bin/sh
set -e

# First arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- php-fpm "$@"
fi

if [ "$1" = 'php-fpm' ] || [ "$1" = 'php' ] || [ "$1" = 'bin/console' ]; then
	PHP_INI_RECOMMENDED="$PHP_INI_DIR/php.ini-production"
	SYMFONY_INI_RECOMMENDED="$PHP_INI_DIR/symfony.prod.ini"
	if [ "$APP_ENV" != 'prod' ]; then
		PHP_INI_RECOMMENDED="$PHP_INI_DIR/php.ini-development"
		SYMFONY_INI_RECOMMENDED="$PHP_INI_DIR/symfony.dev.ini"
	fi

	ln -sf "$PHP_INI_RECOMMENDED" "$PHP_INI_DIR/php.ini"
	ln -sf "$SYMFONY_INI_RECOMMENDED" "$PHP_INI_DIR/conf.d/symfony.ini"

	mkdir -p var/cache var/log
fi

exec docker-php-entrypoint "$@"
