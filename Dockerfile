FROM ruby:3.1.4
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

RUN mkdir /railroad-crossing-app
WORKDIR /railroad-crossing-app

RUN gem install bundler:2.3.17

COPY Gemfile /railroad-crossing-app/Gemfile
COPY Gemfile.lock /railroad-crossing-app/Gemfile.lock

RUN bundle install

COPY . /railroad-crossing-app/

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
CMD ["rails", "server", "-b", "0.0.0.0"]