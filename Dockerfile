FROM golang:1.20-bullseye as builder
WORKDIR /usr/src/app
RUN go mod init everson019/fullcycle
COPY *.go .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /main .

FROM scratch
COPY --from=builder /main .
EXPOSE 8080
CMD ["./main"]