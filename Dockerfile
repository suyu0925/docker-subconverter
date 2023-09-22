FROM alpine:latest AS builder

ARG TARGETPLATFORM
ENV TARGETPLATFORM=${TARGETPLATFORM}

WORKDIR /app

COPY ./bin/ ./bin/

RUN cp ./bin/${TARGETPLATFORM//\//\-}/subconverter ./subconverter



FROM alpine:latest

WORKDIR /base

COPY ./base/ .

COPY --from=builder /app/subconverter /usr/bin/subconverter

ENTRYPOINT subconverter
