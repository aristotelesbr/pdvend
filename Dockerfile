FROM ruby:2.4.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

RUN mkdir /pdvend

WORKDIR /pdvend

ADD Gemfile /pdvend/Gemfile
ADD Gemfile.lock /pdvend/Gemfile.lock

RUN bundle install
ADD . /pdvend