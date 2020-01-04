FROM ruby:2.5.7-alpine

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
