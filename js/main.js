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

function addOrRemoveItem(event) {
    const element = event.getElementsByTagName('h3')[0];
    const parentElement = event.parentNode.getElementsByTagName('h2')[0];
    const tag = '<i class="fa-solid fa-square-check"></i>';

    if(element.innerHTML.indexOf(tag) !== -1) {
        element.innerHTML = element.innerHTML.replace(tag, '');
        parentElement.innerHTML = parentElement.innerHTML.replace(tag, '');
        event.className = "menu-item";
    } else {
        element.innerHTML += tag;
        parentElement.innerHTML += tag;
        event.className = "menu-item menu-item-chosen";
    }
}

const outputData = async (meals, drinks) => {
    // Output to Meals and Daily Menu sections
    const mealsSection = document.querySelector("#meals");
    const dailyMenus = document.querySelectorAll(".menu");
    await Object.values(meals).forEach(meal => {
        meal.forEach(data => {
            const template = `<div class="menu-item" onclick="addOrRemoveItem(this)">
                                <h3>${data.name}</h3>
                                <img src="${data.imagePath}" alt="${data.name}">
                                <p><b>${data.price} Ft</b></p>
                                <p><b>Elérhető: ${data.availability}</b></p>
                                <p><i>Allergének: ${data.allergens ? data.allergens : "-"}</i></p>
                              </div>`;

            mealsSection.childNodes[3].innerHTML += template.replace('<div class="menu-item" onclick="addOrRemoveItem(this)">', '<div class="menu-item">');;
            const hour = new Date().getHours();
            const availabilityHours = data.availability.split("-");


            if(hour >= parseInt(availabilityHours[0].substring(0, 2)) && hour < parseInt(availabilityHours[1].substring(0, 2))){
                if (data.mealType == "Leves") {
                    dailyMenus[0].innerHTML += template
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
                                <img src="${data.imagePath}" alt="${data.name}">
                                <p><b>${data.price} Ft</b></p>
                            </div>`

            drinksSection.childNodes[5].innerHTML += template;
        })
    })
}
