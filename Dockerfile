FROM ruby:2.5.3

RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
        && apt-get install -y nodejs

RUN mkdir /app_name

ENV APP_ROOT /app_name
WORKDIR $APP_ROOT

COPY ./Gemfile $APP_ROOT/Gemfile
COPY ./Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle install
COPY . $APP_ROOT