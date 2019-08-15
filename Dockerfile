FROM ruby:2.6.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

RUN mkdir /myapp
RUN mkdir /tmp/sockets

WORKDIR /myapp

ADD Gemfile /myapp/Gemfile

ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true
RUN export SECRET_KEY_BASE=$(bundle exec rails secret)

RUN bundle install

ADD . /myapp
