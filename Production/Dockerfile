FROM php:7.2-fpm
MAINTAINER Wesley Elfring <hi@wesleyelfring.nl>

# Copy the PHP configuration file
COPY ./php.ini /${PHP_INI_DIR}

# Supervisor Config
COPY ./supervisord.conf /etc/supervisord.conf
# Start Supervisord
COPY ./cmd.sh /

# Install PHP extensions
RUN apt-get update -yqq \
    # Install libs for building PHP exts
    && apt-get install -yqq --no-install-recommends \
        libicu-dev \
        libpq-dev \
        libmcrypt-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        librdkafka-dev \
        unzip \
        nano \
        mysql-client \
        iputils-ping \
        supervisor \
        cron \
        nginx \
    # Install PHP Exts
    && docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
    && docker-php-ext-install \
        intl \
        pcntl \
        pdo_mysql \
        pdo_pgsql \
        pgsql \
        zip \
        opcache \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && pecl install redis \
    && pecl install seaslog \
    && pecl install rdkafka \
    && pecl install mongodb \
    && pecl install grpc \
    && docker-php-ext-enable redis seaslog rdkafka mongodb grpc\
    # Remove dev packages
    && apt-get remove --purge -yyq libicu-dev \
        libpq-dev \
        libmcrypt-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
    && rm -r /var/lib/apt/lists/*

# Configure PHP


# Nginx configuration
RUN sed -i -e"s/worker_processes  1/worker_processes 5/" /etc/nginx/nginx.conf && \
    sed -i -e"s/keepalive_timeout\s*65/keepalive_timeout 2/" /etc/nginx/nginx.conf && \
    sed -i -e"s/keepalive_timeout 2/keepalive_timeout 2;\n\tclient_max_body_size 128m;\n\tproxy_buffer_size 256k;\n\tproxy_buffers 4 512k;\n\tproxy_busy_buffers_size 512k/" /etc/nginx/nginx.conf && \
    echo "daemon off;" >> /etc/nginx/nginx.conf && \

# Add nginx and php config for Laravel
COPY ./nginx.conf /etc/nginx/sites-available/default.conf
RUN rm -f /etc/nginx/sites-enabled/default && \
    ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default

RUN chmod 755 /cmd.sh && \
    touch /var/log/cron.log && \
    touch /etc/cron.d/crontasks

EXPOSE 80

ENTRYPOINT ["/bin/bash", "/cmd.sh"]
CMD []

