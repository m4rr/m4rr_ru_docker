FROM ruby:2.6.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

RUN mkdir /myapp
RUN mkdir /tmp/sockets
RUN mkdir /pids

WORKDIR /myapp

ADD . /myapp
# ADD Gemfile /myapp/Gemfile

ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true

RUN bundle install  --no-ri --no-rdoc --without development test

# RUN RAILS_ENV=production bin/rails assets:precompile
