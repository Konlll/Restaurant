async function fetchMeals() {
    const res = await fetch("http://localhost:7777/meals");
    const data = res.json();
    return data;
};

async function fetchDrinks() {
    const res = await fetch("http://localhost:7777/drinks");
    const data = res.json();
    return data;
}
function main() {
    console.log("hello world")
}

main();