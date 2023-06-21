FROM golang:1.11-alpine3.7 AS builder

WORKDIR /app
COPY programa.go .
ARG CGO_ENABLED=0
RUN go build -o hello .

FROM scratch

WORKDIR /app
COPY --from=builder /app .

ENTRYPOINT [ "./hello" ]