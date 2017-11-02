FROM sickp/alpine-ruby:2.4.2

ENV APP_ROOT /app

RUN apk add --update \
            make \
            gcc \
            musl-dev \
            g++ \
            pcre-dev \
            tzdata \
            nodejs \
            mariadb-dev

RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT
COPY . $APP_ROOT

RUN echo 'gem: --no-document' >> ~/.gemrc && \
    bundle install

CMD ["ash"]
