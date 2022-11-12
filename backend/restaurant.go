package main

import (
	_ "github.com/go-sql-driver/mysql"
)

func GetMealItems() ([]MealItem, error) {
	result := make([]MealItem, 0)
	rows, err := db.Query("SELECT * FROM MEALS")
	if err != nil {
		return nil, err
	}

	defer rows.Close()

	var item MealItem
	for rows.Next() {
		rows.Scan(&item.MealId, &item.Name, &item.Price, &item.Allergens, &item.MealType, &item.ImagePath, &item.Availability)
		result = append(result, item)
	}
	return result, nil
}

func GetDrinkItems() ([]DrinkItem, error) {
	result := make([]DrinkItem, 0)
	rows, err := db.Query("SELECT * FROM drinks")

	if err != nil {
		return nil, err
	}

	defer rows.Close()

	var item DrinkItem

	for rows.Next() {
		rows.Scan(&item.DrinkId, &item.Name, &item.Price, &item.ImagePath)
		result = append(result, item)
	}
	return result, nil
}
