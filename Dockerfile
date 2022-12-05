FROM golang:1.18.0 as builder

WORKDIR /github.com/ignalsciences/sigsci-module-golang/examples

COPY . .

RUN go mod vendor && \
	CGO_ENABLED=0 GOOS=linux go build -o helloworld examples/helloworld/main.go

ENTRYPOINT [ "./helloworld" ]