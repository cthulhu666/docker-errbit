FROM cthulhu666/docker-rbenv:2.2.0
MAINTAINER jakub.gluszecki@gmail.com

RUN gem install foreman
RUN cd /app && curl https://codeload.github.com/errbit/errbit/tar.gz/v0.4.0 | tar xz && ln -s errbit-0.4.0 errbit

ENV RAILS_ENV production
ENV PORT 3000

WORKDIR /app/errbit
RUN bundle install --without development test

CMD foreman start -f Procfile
EXPOSE 3000

