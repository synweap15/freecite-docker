FROM ruby:2.4
RUN apt-get update -qq && apt-get install -y build-essential

ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL C.UTF-8

WORKDIR /myapp/src
ADD src/CRF++-0.58.tar.gz CRF++-0.58
ADD src/install_crfpp.sh install_crfpp.sh

RUN /bin/bash -c "/myapp/src/install_crfpp.sh"

ADD . /myapp
WORKDIR /myapp
RUN bundle install

ENTRYPOINT ["rackup"]
CMD ["--host", "0.0.0.0", "--port", "3000"]