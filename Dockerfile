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

ENV RAILS_ENV=production
ENV RACK_ENV=production
ENV PORT=3000
ENV SECRET_KEY_BASE mykey

RUN gem install bundler -v 1.17.3
RUN gem install puma
RUN bundle install --jobs=4

COPY yarn.lock /app/
RUN yarn install --check-files

COPY . .

# RUN rm -rf /app/node_modules /app/tmp/*

# FROM ruby:2.5.1-alpine
# RUN apk update \
#     && \
#     apk add --update --no-cache \
#       sqlite-dev \
#       tzdata \
#       postgresql-dev \
#     && rm -rf /var/cache/apk/*

# WORKDIR /app

# COPY --from=builder /usr/lib /usr/lib
# COPY --from=builder /usr/local/bundle /usr/local/bundle
# COPY --from=builder /app /app

# ENV RAILS_ENV=production
# ENV SECRET_KEY_BASE mykey

# RUN bundle config --local path vendor/bundle

EXPOSE 3000:3000

CMD rm -f tmp/pids/server.pid && \
  bundle exec rake db:migrate && \
  bundle exec puma -t 5:5 -p ${PORT} -e ${RACK_ENV}
