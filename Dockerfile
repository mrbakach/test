FROM docker.io/golang:1.17.0-alpine3.13 AS build
COPY main.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM docker.io/scratch
COPY --from=build /go/app /bin/
EXPOSE 8080
CMD ["app"]
