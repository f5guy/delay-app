FROM golang:1.21.0 as build
WORKDIR /opt
COPY src/ .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build

FROM alpine:3.18.3

RUN adduser -D -u 2025 delay
WORKDIR /home/delay

COPY --from=build /opt/delay-sample delay-sample

RUN chmod +x delay-sample

USER 2025
EXPOSE 3333

ENTRYPOINT ["./delay-sample"]
