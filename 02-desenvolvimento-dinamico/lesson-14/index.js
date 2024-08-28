const shoppingCart = [];

function addItemToCard(item) {

    shoppingCart.push(item);

};

function removeItemFromCart(item) {

    const index = shoppingCart.indexOf(item);

    if (index !== -1) {

        shoppingCart.splice(index, 1);
    }

};

function viewCart() {

    if (shoppingCart.length == 0) {

        console.log("Your shopping cart is empty");

    } else {

        console.log("Itens in your shopping cart: ");

        for (let i = 0; i < shoppingCart.length; i++) {

            console.log(`${i + 1} - ${shoppingCart[i]}`);

        };

    };
};

function clearCart() {

    shoppingCart.length = 0;

    console.log("Your shopping cart has been cleared");

};

addItemToCard("Tennis");
addItemToCard("Blusa");
addItemToCard("Short");

viewCart();