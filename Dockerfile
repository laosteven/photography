# pre-build stage

FROM ruby:3.0-alpine
RUN apk add --update --no-cache \
  build-base

WORKDIR /usr/src/app

COPY Gemfile* ./

RUN bundle config set without development test
RUN bundle install --jobs=8

COPY . .

EXPOSE 4000
CMD ["bundle", "exec", "jekyll", "serve"]
