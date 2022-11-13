const fetchData = async (endpoint) => {
    const res = await fetch(`http://localhost:7777/${endpoint}`)
    const data = await res.json()
    return data
}

fetchData("meals").then(meals => {
    fetchData("drinks").then(drinks => {
        outputData(meals, drinks)
    })
})

const outputData = async (meals, drinks) => {
    // Output to Meals and Daily Menu sections
    const mealsSection = document.querySelector("#meals")
    const dailyMenus = document.querySelectorAll(".menu")
    await Object.values(meals).forEach(meal => {
        meal.forEach(data => {

            const template = `<div class="menu-item">
                                <h3>${data.name}</h3>
                                <img src="http://localhost:7777/images/${data.imagePath}" alt="${data.name}">
                                <p><b>${data.price} Ft</b></p>
                                <p><b>Elérhető: ${data.availability}</b></p>
                                <p><i>Allergének: ${data.allergens ? data.allergens : "-"}</i></p>
                              </div>`

            mealsSection.childNodes[3].innerHTML += template
            const hour = new Date().getHours()
            const availabilityHours = data.availability.split("-")


            if(hour >= parseInt(availabilityHours[0].substring(0, 2)) && hour < parseInt(availabilityHours[1].substring(0, 2))){
                if (data.mealType == "Leves") {
                    dailyMenus[0].innerHTML += template;
                } else if (data.mealType == "Főétel") {
                    dailyMenus[1].innerHTML += template;
                } else if(data.mealType == "Desszert") {
                    dailyMenus[2].innerHTML += template;
                }
            }

        })
    })

    // Output to Drinks section
    const drinksSection = document.querySelector("#drinks")
    await Object.values(drinks).forEach(drink => {
        drink.forEach(data => {
            const template = `<div class="menu-item">
                                <h3>${data.name}</h3>
                                <img src="http://localhost:7777/images/${data.imagePath}" alt="${data.name}">
                                <p><b>${data.price} Ft</b></p>
                            </div>`

            drinksSection.childNodes[5].innerHTML += template
        })
    })
}