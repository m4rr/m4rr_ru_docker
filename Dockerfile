FROM ruby:2.6.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

RUN mkdir /myapp
RUN mkdir /tmp/sockets
RUN mkdir /pids

WORKDIR /myapp

ADD Gemfile /myapp/Gemfile

ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true

# RUN bundle install
RUN RAILS_ENV=production bundle --without development test

ADD . /myapp

CMD RAILS_ENV=production bundle exec rake db:migrate

# RUN RAILS_ENV=production bundle exec rake assets:clean
# RUN RAILS_ENV=production bundle exec rake --quiet assets:clobber
RUN RAILS_ENV=production bundle exec rake --quiet assets:precompile

RUN RAILS_ENV=production bundle exec rake routes

# CMD touch tmp/restart.txt
# RUN RAILS_ENV=production bin/rails assets:precompile
