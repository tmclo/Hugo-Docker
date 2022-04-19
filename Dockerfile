FROM golang:latest

RUN apt-get -qq update \
&& DEBIAN_FRONTEND=noninteractive apt-get -qq install -y --no-install-recommends python-pygments git ca-certificates asciidoc \
&& rm -rf /var/lib/apt/lists/*

ENV HUGO_VERSION 0.97.3
ENV HUGO_BINARY hugo_extended_${HUGO_VERSION}_Linux-64bit.deb

ADD https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} /tmp/hugo.deb
RUN dpkg -i /tmp/hugo.deb \
&& rm /tmp/hugo.deb