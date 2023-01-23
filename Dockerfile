FROM golang:1.19.5-bullseye AS build
RUN apt-get update -y && \
    apt-get install -y libgtk-3-dev libwebkit2gtk-4.0-dev build-essential pkg-config npm && \
    groupadd wails -g 10001 && \
    useradd wails -g wails -u 10001 -d /home/wails

USER wails
WORKDIR /home/wails
RUN mkdir wails_src
COPY --chown=wails:wails ./wails ./wails_src
WORKDIR /home/wails/wails_src/v2/wails
RUN go mod vendor
WORKDIR /home/wails/wails_src/v2/cmd/wails
RUN go install -buildvcs=false .

WORKDIR /home/wails

ENTRYPOINT ["wails"]
CMD ["doctor"]
