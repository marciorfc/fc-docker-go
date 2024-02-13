FROM golang:1.19 AS build-stage

WORKDIR /app

COPY *.go ./

RUN go mod init marciorfc.com/hello
RUN CGO_ENABLED=0 GOOS=linux go build -o /docker-fc-go


FROM scratch AS build-release-stage

WORKDIR /

COPY --from=build-stage /docker-fc-go /docker-fc-go

CMD [ "/docker-fc-go" ]
