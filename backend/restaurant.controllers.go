package main

import (
	"net/http"
)

type MealItem struct {
	MealId       int    `json:"mealId"`
	Name         string `json:"name"`
	Price        uint16 `json:"price"`
	Allergens    string `json:"allergens"`
	MealType     string `json:"mealType"`
	ImagePath    string `json:"imagePath"`
	Availability string `json:"availability"`
}

type DrinkItem struct {
	DrinkId   int    `json:"drinkId"`
	Name      string `json:"name"`
	Price     uint16 `json:"price"`
	ImagePath string `json:"imagePath"`
}

func Controller_Meal(w http.ResponseWriter, r *http.Request) {
	result, err := GetMealItems()
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	SendResponse(w, result, "meals")
}

func Controller_Drink(w http.ResponseWriter, r *http.Request) {
	result, err := GetDrinkItems()

	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	SendResponse(w, result, "drinks")
}
