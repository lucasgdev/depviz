FROM            golang:1.11-alpine as build
RUN             apk add --update --no-cache git gcc musl-dev make
ADD             . /go/src/moul.io/depviz
WORKDIR         /go/src/moul.io/depviz
RUN             GO111MODULE=on go get -v .
RUN             make install

FROM            alpine
RUN             apk add --update --no-cache ca-certificates
COPY            --from=build /go/bin/depviz /bin/
ENTRYPOINT      ["depviz"]
