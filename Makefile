.PHONY: build run test cover

build:
	go build -o main cmd/ordersystem/main.go cmd/ordersystem/wire_gen.go

run: build
	 ./main

test: 
	go test ./... --coverprofile cover.out

cover:
	go tool cover -html cover.out
