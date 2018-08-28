FROM ruby:2.4.1

RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential nodejs libpq-dev

ENV INSTALL_PATH /usr/src/app

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile* ./

RUN bundle install

COPY . .

CMD puma -C config/puma.rb
