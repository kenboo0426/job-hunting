FROM ruby:2.7

RUN apt-get update && apt-get install -y \
      build-essential \
      nodejs \
      git \
      vim \
      postgresql-client \
      yarn
WORKDIR /app
COPY . .
RUN bundle install 