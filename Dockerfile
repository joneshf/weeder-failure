FROM buildpack-deps:bionic

RUN apt-get update && apt-get install --yes libgmp-dev

RUN wget https://github.com/ndmitchell/weeder/releases/download/v1.0.5/weeder-1.0.5-x86_64-linux.tar.gz --output-document weeder.tar.gz
RUN tar xvf weeder.tar.gz

RUN wget https://github.com/commercialhaskell/stack/releases/download/v1.6.3/stack-1.6.3-linux-x86_64.tar.gz --output-document stack.tar.gz
RUN tar xvf stack.tar.gz
RUN mv /stack-1.6.3-linux-x86_64/stack /usr/local/bin/stack

WORKDIR /project

COPY . /project/
RUN stack setup

ENTRYPOINT ["/weeder-1.0.5/weeder"]
