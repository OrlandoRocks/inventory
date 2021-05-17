FROM ruby:2.5.1 as builder

RUN apt-get update && apt-get dist-upgrade -yy

RUN apt-get install -yy \
      git \
      nodejs \
      yarn \
      sqlite \
      tzdata \
      build-essential \
      postgresql-client \
      imagemagick

WORKDIR /app

COPY Gemfile* /app/

ENV RAILS_ENV production
ENV RACK_ENV production
ENV PORT 3000
ENV SECRET_KEY_BASE mykey

RUN gem install bundler -v 1.17.1
RUN gem install puma
RUN bundle config git.allow_insecure true
RUN bundle install --jobs=4

COPY yarn.lock /app/
# RUN yarn install --check-files

COPY . .

ENV PORT 5000

EXPOSE 5000

CMD bundle exec puma -C config/puma.rb
