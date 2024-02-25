FROM golang:1.22.0 as build
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download

COPY . . 
COPY .env.docker .env
RUN CGO_ENABLED=0 go build cmd/ordersystem/main.go cmd/ordersystem/wire_gen.go 

EXPOSE 8080 50051 8000

ENTRYPOINT ["./main"]
