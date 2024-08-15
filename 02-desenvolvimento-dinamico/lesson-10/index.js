var carro = [

    {
        modelo: "Audi A3",
        marca: "Audi",
        ano: 2020
    },

    {
        modelo: "Compass",
        marca: "Jeep",
        ano: 2021
    }

];


//FOR IN
for (let caracteristica in carro) {

    console.log(carro[caracteristica].marca);

}


//FOR OF
for (let car of carro) {
    console.log(car.ano);

}