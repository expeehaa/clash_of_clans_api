FROM ruby:3.4-alpine

ENV GEM_HOME="/gem_home"
ENV PATH="$GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH"

RUN apk update && apk upgrade
RUN apk add build-base yaml-dev
