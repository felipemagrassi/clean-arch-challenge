package usecase

import (
	"github.com/felipemagrassi/clean-arch-challenge/internal/entity"
)

type ListOrdersOutputDTO struct {
	Orders []*Order
}

type Order struct {
	ID         string
	Price      float64
	Tax        float64
	FinalPrice float64
}

type ListOrdersUseCase struct {
	OrderRepository entity.OrderRepositoryInterface
}

func NewListOrdersUseCase(
	OrderRepository entity.OrderRepositoryInterface,
) *ListOrdersUseCase {
	return &ListOrdersUseCase{
		OrderRepository: OrderRepository,
	}
}

func (c *ListOrdersUseCase) Execute() (*ListOrdersOutputDTO, error) {
	orders, err := c.OrderRepository.List()
	if err != nil {
		return nil, err
	}

	output := []*Order{}

	for _, order := range orders {
		foundOrder := Order{
			ID:         order.ID,
			Price:      order.Price,
			Tax:        order.Tax,
			FinalPrice: order.FinalPrice,
		}

		output = append(output, &foundOrder)
	}

	dto := &ListOrdersOutputDTO{
		Orders: output,
	}

	return dto, nil
}
