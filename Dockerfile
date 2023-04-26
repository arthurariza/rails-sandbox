# Base Image
FROM ruby:3.2.2

# Define work directory
WORKDIR /usr/src/app

# Copy Gemfile before the app to cache Gem installs
COPY ./Gemfile ./Gemfile
COPY ./Gemfile.lock ./Gemfile.lock

RUN bundle install

COPY . .

ENTRYPOINT ["./docker-entrypoint.sh"]

CMD [ "bin/rails", "s", "-b", "0.0.0.0" ]
