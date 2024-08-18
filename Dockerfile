FROM ruby:3.3.4

RUN apt update
RUN apt upgrade -y
RUN apt install lsb-base lsb-release

RUN apt update \ 
    && apt install -y vim   

ADD . /home/app/web
WORKDIR /home/app/web

RUN bundle install --jobs 5 --retry 5