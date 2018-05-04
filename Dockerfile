FROM ruby:2.5.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
WORKDIR /raspberry_app
COPY . /raspberry_app
RUN bundle install
