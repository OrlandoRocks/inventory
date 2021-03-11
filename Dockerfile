FROM ruby:2.5.1-alpine as builder
RUN apk update && apk upgrade
RUN apk add --update --no-cache \
      alpine-sdk \
      git \
      nodejs \
      yarn \
      sqlite-dev \
      tzdata \
      postgresql-client \
      build-base \
      postgresql-dev \
      imagemagick \
      && rm -rf /var/cache/apk/*

WORKDIR /app

COPY Gemfile* /app/


RUN gem install bundler -v 1.17.3

RUN gem install puma

RUN bundle install --jobs=4

COPY yarn.lock /app/
RUN yarn install --check-files
COPY . ./
CMD bundle exec puma -C config/puma.rb
ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]

