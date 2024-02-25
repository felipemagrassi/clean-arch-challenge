# Clean Architecture Golang Application

Application to demonstrate the Clean Architecture in Golang. Using GRPC, GraphQL and REST.

# Usage

```bash
docker compose up -d 
```

## Rest

### Create Order
POST http://localhost:8000/order
```json
{
    "id":"a",
    "price": 100.5,
    "tax": 0.5
}
```

### List Order
GET http://localhost:8000/orders

## GraphQL

### Create Order
```graphql
mutation createOrder {
  createOrder(input: {id: "a", price: 100.5, tax: 0.5}) {
    id
    price
    tax
  }
}
```

### List Order
```graphql
query listOrders {
  listOrders {
    id
    price
    tax
  }
}
```

## GRPC

Example using [evans](https://github.com/ktr0731/evans)

```bash
make evans
```

```grpc
call CreateOrder
```

```grpc
call ListOrders
```
