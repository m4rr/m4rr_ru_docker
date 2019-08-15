FROM ruby:2.6.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

RUN mkdir /myapp
RUN mkdir /tmp/sockets

WORKDIR /myapp

ADD Gemfile /myapp/Gemfile

ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true
ENV SECRET_KEY_BASE rails_sucksd6de14662c9d81b7qcs90f07afdd59316e99c3591dbb092134dc4d613058f1b245524c598bae6876ee207fa41b3a7ab06714ffe76ffc3dd7d8b09

RUN if [[ "$RAILS_ENV" == "production" ]]; then \
      mv config/credentials.yml.enc config/credentials.yml.enc.backup; \
      mv config/credentials.yml.enc.sample config/credentials.yml.enc; \
      mv config/master.key.sample config/master.key; \
      bundle exec rails assets:precompile; \
      mv config/credentials.yml.enc.backup config/credentials.yml.enc; \
      rm config/master.key; \
    fi

RUN bundle install

ADD . /myapp
