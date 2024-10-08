FROM ruby:3.3.1-alpine as builder

RUN apk add --update --no-cache \
    build-base \
    postgresql-dev \
    git \
    tzdata

WORKDIR /kinokus-api

COPY Gemfile ./
COPY Gemfile.lock ./
COPY .ruby-version ./

RUN gem install bundler

RUN bundle install --without development test

COPY . /kinokus-api/

FROM ruby:3.3.1-alpine as final

RUN apk add --update --no-cache \
    build-base \
    postgresql-client \
    tzdata \
    file \
    git

COPY --from=builder /usr/local/bundle/ /usr/local/bundle/
COPY --from=builder /kinokus-api/ /kinokus-api/

WORKDIR /kinokus-api/

EXPOSE 3000
ENTRYPOINT [ "bin/docker-entrypoint" ]
