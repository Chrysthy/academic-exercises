const shoppingCart = [];

function addItemToCard(item) {

    shoppingCart.push(item);

};

function removeItemFromCart(item) {

    const index = shoppingCart.indexOf(item);

    if (index !== -1) {

        shoppingCart.splice(index, 1);
    }

}