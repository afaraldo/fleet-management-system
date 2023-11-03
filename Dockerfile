# Utiliza la imagen base de Ruby 3.2.2 Alpine
FROM ruby:3.2.2-alpine

ENV RUBY_YJIT_ENABLE=1

# Instala las dependencias del sistema necesarias
RUN apk update && \
    apk add --no-cache \
    build-base \
    cmake \
    nodejs \
    yarn \
    vips-dev \
    fftw-dev \
    git \
    postgresql-dev \
    tzdata \
    && rm -rf /var/cache/apk/*

# Crea un directorio para la aplicación y un usuario no privilegiado
RUN addgroup -g 1000 app && \
    adduser -u 1000 -G app -s /bin/sh -D app && \
    mkdir -p /app && chown -R app:app /app

# Cambia al usuario no privilegiado
USER app

# Establece el directorio de trabajo de la aplicación
WORKDIR /app

# Copia el Gemfile y el Gemfile.lock y otros archivos necesarios al contenedor
COPY --chown=app:app Gemfile Gemfile.lock package.json yarn.lock ./

# Instala las gemas de la aplicación
RUN gem install bundler -v '2.2.28' && \
    bundle config set without 'development test' && \
    bundle install --jobs 20 --retry 5

# Instala dependencias JS
RUN yarn install --production

# Copia el resto de la aplicación al contenedor
COPY --chown=app:app . .

# Copia el script de entrada a la ubicación deseada en el contenedor
COPY --chown=app:app entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

# Expone el puerto 3000 para acceder a la aplicación
EXPOSE 3000

# Define el comando de inicio de la aplicación utilizando el script de entrada
ENTRYPOINT ["/usr/bin/entrypoint.sh"]

CMD bundle exec rails server -b 0.0.0.0
