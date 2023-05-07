FROM ruby:3.0

WORKDIR /usr/src/app

COPY Gemfile* ./

RUN bundle install

COPY . .

EXPOSE 4000
CMD ["bundle", "exec", "jekyll", "serve"]
