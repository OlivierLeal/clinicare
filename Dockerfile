FROM ruby:3.3.4

RUN apt update
RUN apt upgrade -y
RUN apt install lsb-base lsb-release

#INSTALA A BIBLIOTECA RESPONSAVEL POR EXPORTAR PDF PELO HTML
RUN wget https://github.com/wkhtmltopdf/obsolete-downloads/releases/download/linux/wkhtmltopdf-0.11.0_rc1-static-amd64.tar.bz2 \
    && tar -xvjf wkhtmltopdf-0.11.0_rc1-static-amd64.tar.bz2 \
    && mv wkhtmltopdf-amd64 /usr/local/bin/wkhtmltopdf \
    && chmod +x /usr/local/bin/wkhtmltopdf \
    && rm wkhtmltopdf-0.11.0_rc1-static-amd64.tar.bz2

RUN apt update \ 
    && apt install -y vim   

ADD . /home/app/web
WORKDIR /home/app/web

RUN bundle install --jobs 5 --retry 5