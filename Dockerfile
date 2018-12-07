FROM php:7.2-cli-stretch

RUN apt-get update && apt-get install -y \
    git \
    zlib1g-dev \
    unzip \
    libpq-dev \

    && cd ~ \
    && git clone --depth=1 --branch "v3.4.1" "git://github.com/phalcon/cphalcon.git" \
    && cd cphalcon/build \
    && ./install \
    && cd ~ \
    && rm -r ~/cphalcon \

    && curl -sS https://getcomposer.org/installer | php  \
    && mv composer.phar /usr/local/bin/composer \

    && mkdir -p /usr/src/php/ext/redis \
    && curl -L https://github.com/phpredis/phpredis/archive/4.1.1.tar.gz | tar xvz -C /usr/src/php/ext/redis --strip 1 \
    && echo 'redis' >> /usr/src/php-available-exts \
    && docker-php-ext-install redis \

    && docker-php-ext-install -j$(nproc) pdo_mysql \
    && docker-php-ext-install -j$(nproc) pdo_pgsql \
    && docker-php-ext-install -j$(nproc) zip \

    && apt-get remove -y --purge \
        make \
        g++ \
        gcc \
    && apt-get clean

COPY php.ini /usr/local/etc/php/