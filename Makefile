.PHONY: build run test cover protoc

build:
	go build -o main cmd/ordersystem/main.go cmd/ordersystem/wire_gen.go

run: build
	 ./main

test: 
	go test ./... --coverprofile cover.out

cover:
	go tool cover -html cover.out

protoc:
	protoc --go_out=. --go-grpc_out=. internal/infra/grpc/protofiles/order.proto

gqlgen:
	go run github.com/99designs/gqlgen generate

migrate-up:
	migrate -path internal/infra/database/migrations -database "mysql://root:root@tcp(localhost:3306)/orders" -verbose up

migrate-down:
	migrate -path internal/infra/database/migrations -database "mysql://root:root@tcp(localhost:3306)/orders" -verbose down
