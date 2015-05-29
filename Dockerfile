FROM cthulhu666/docker-rbenv:2.2.0
MAINTAINER jakub.gluszecki@gmail.com

RUN gem install foreman
RUN cd /app && curl https://codeload.github.com/errbit/errbit/tar.gz/v0.4.0 | tar xz && ln -s errbit-0.4.0 errbit

WORKDIR /app/errbit
RUN bundle install --without test
RUN bundle exec rake assets:precompile

ENV RAILS_ENV production
ENV PORT 3000
EXPOSE 3000
VOLUME /public

CMD sudo cp -a /app/errbit/public/* /public && foreman start -f Procfile

