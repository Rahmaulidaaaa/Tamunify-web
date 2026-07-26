FROM richarvey/nginx-php-fpm:3.1.6

WORKDIR /var/www/html

COPY . .

RUN composer install --no-dev --optimize-autoloader

RUN cp .env.example .env || true

RUN php artisan key:generate --force || true

RUN npm install
RUN npm run build

RUN chown -R nginx:nginx /var/www/html

EXPOSE 80