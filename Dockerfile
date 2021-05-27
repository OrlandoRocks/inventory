FROM ruby:2.5.1 AS builder

RUN apt-get update \
      && apt-get install -yy \
      git \
      nodejs \
      yarn \
      sqlite \
      tzdata \
      build-essential \
      postgresql-client \
      imagemagick

ENV LANG C.UTF-8
ENV BUNDLE_JOBS 4
ENV BUNDLE_RETRY 3

WORKDIR /app

COPY Gemfile* /app/
COPY yarn.lock /app/

RUN gem install bundler -v 1.17.1
RUN gem install puma

RUN bundle config git.allow_insecure true
RUN bundle install --jobs=10 --retry=3 \
      && bundle clean --force 
# RUN yarn install --check-files && yarn cache clean

FROM ruby:2.5.1 AS release

RUN apt-get update \
      && apt-get install -yy \
      sqlite \
      tzdata \
      postgresql-client \
      imagemagick \
      libssl-dev

WORKDIR /app

COPY --from=builder /usr/local/bundle/ /usr/local/bundle/
COPY . .

ENV RAILS_ENV production
ENV RACK_ENV production
ENV PORT 3000
ENV SECRET_KEY_BASE mykey
ENV EXECJS_RUNTIME Disabled

ENV PORT 5000

EXPOSE 5000

CMD bundle exec puma -C config/puma.rb
