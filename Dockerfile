FROM golang:1.18.0 as builder

WORKDIR /github.com/ignalsciences/sigsci-module-golang/

COPY . .

RUN go mod vendor && \
	CGO_ENABLED=0 GOOS=linux go build -o helloworld-cli examples/helloworld/main.go


# The image to keep
FROM alpine:3.16

COPY --from=builder /github.com/ignalsciences/sigsci-module-golang/helloworld-cli /usr/local/bin/helloworld-cli

ENTRYPOINT [ "helloworld-cli" ]


