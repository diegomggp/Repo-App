# Establecer la imagen base
FROM php:8.3-cli-alpine

# Establecer el directorio de trabajo
WORKDIR /app

# Instalar git y wget
RUN apk add --no-cache git wget

# Clonar el repositorio de Symfony Skeleton
RUN git clone --branch 6.4 https://github.com/symfony/skeleton.git .

# Descargar Composer
RUN wget https://getcomposer.org/download/2.7.6/composer.phar

# Instalar las dependencias
RUN php composer.phar install --optimize-autoloader --no-dev --no-interaction

# Comando por defecto para ejecutar cuando se inicie el contenedor
CMD ["php", "index.php"]
