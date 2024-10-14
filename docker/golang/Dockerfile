FROM golang:1.21-alpine

ENV GO111MODULE=on \
    GOPATH=/go \
    PATH=$GOPATH/bin:/usr/local/go/bin:$PATH

# Install: git, bash, curl, and air
RUN apk add --no-cache git bash curl && \
    go install github.com/cosmtrek/air@latest

WORKDIR /projects

EXPOSE 3000-4000

CMD ["bash"]