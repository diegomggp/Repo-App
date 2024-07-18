FROM php:8.3-cli-alpine

WORKDIR /app

RUN apk add --no-cache git wget

# Clonar el repositorio del composer.json
RUN git clone --branch 6.4 https://github.com/symfony/skeleton.git .

# Descargar Composer
RUN wget https://getcomposer.org/download/2.7.6/composer.phar

RUN php composer.phar install --optimize-autoloader --no-dev --no-interaction

CMD ["php", "index.php"]
