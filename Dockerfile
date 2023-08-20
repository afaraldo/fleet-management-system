# Utiliza la imagen base de Ruby 3.2.2
FROM ruby:3.2.2

ENV RUBY_YJIT_ENABLE=1

# Instala las dependencias del sistema necesarias
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    libvips && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y nodejs yarn

# Establece el directorio de trabajo de la aplicación
WORKDIR /app

# Copia el Gemfile y el Gemfile.lock al contenedor
COPY Gemfile .
COPY Gemfile.lock .
COPY package.json .
COPY yarn.lock .

# Instala las gemas de la aplicación
RUN gem install bundler -v '2.2.28' && bundle install --jobs 20 --retry 5

# Instala dependencias JS
RUN yarn install

# Copia el resto de la aplicación al contenedor
COPY . .

# Copia el script de entrada a la ubicación deseada en el contenedor
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

# Expone el puerto 3000 para acceder a la aplicación
EXPOSE 3000

# Define el comando de inicio de la aplicación utilizando el script de entrada
ENTRYPOINT ["entrypoint.sh"]

CMD bundle exec rails server -b 0.0.0.0
