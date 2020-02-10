FROM ruby:2.5.7-stretch

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 3000

CMD rm -f tmp/pids/server.pid && bundle exec rails s -p 3000 -b '0.0.0.0'
