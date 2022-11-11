package main

type MealItem struct {
	MealId       int    `mealId`
	Name         string `name`
	Price        uint16 `price`
	Allergens    string `allergens`
	MealType     string `mealType`
	ImagePath    string `imagePath`
	availability string `availability`
}

type DrinkItem struct {
	DrinkId   int    `drinkId`
	Name      string `name`
	Price     uint16 `price`
	ImagePath string `imagePath`
}
