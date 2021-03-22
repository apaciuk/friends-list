FROM ruby:2.7.2
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /friends-list
COPY Gemfile /friends-list/Gemfile
COPY Gemfile.lock /friends-list/Gemfile.lock
RUN bundle install
COPY . /friends-list


COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000


CMD ["rails", "server", "-b", "0.0.0.0"]
