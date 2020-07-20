FROM ruby:2.6.5

ENV WORKSPACE /app
ADD ./Gemfile* $WORKSPACE/
WORKDIR $WORKSPACE
RUN gem install bundler -v 2.1.4
RUN bundle install
ADD . $WORKSPACE

EXPOSE 5000
ENTRYPOINT [ "bundle", "exec" ]
CMD [ "rackup", "-p", "5000", "--host", "0.0.0.0" ]