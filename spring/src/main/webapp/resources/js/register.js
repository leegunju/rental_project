window.onload = function(){
    var products = document.querySelectorAll('.product');
    products.forEach(function(product){
        product.addEventListener('click', function(e){
            // remove product-clicked from all products
            products.forEach(function(prod){
                prod.firstElementChild.classList.remove('product-clicked');
            });

            // add product-clicked to the clicked product
            e.currentTarget.firstElementChild.classList.add('product-clicked');

            // update the hidden input with the data-value of the clicked product
            document.getElementById('mySelection').value = e.currentTarget.dataset.value;
        });
    });
}