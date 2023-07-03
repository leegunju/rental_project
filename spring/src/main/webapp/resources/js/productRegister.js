document.getElementById('trigger').addEventListener('click', () => {
    document.getElementById('files').click();
})

const regExp = new RegExp("\.(exe|sh|bat|msi|dll|js)$");
const regExpImg = new RegExp("\.(jpg|jpeg|png|gif|bmp)$");
const maxSize = 1024*1024*20;

function fileSizeValidation(fileName, fileSize) {
    if(regExp.test(fileName)) {
        return 0;
    } else if(fileSize > maxSize) {
        return 0;
    } else {
        return 1;
    }
}

document.addEventListener('change', (e) => {
    console.log(e.target);
    if(e.target.id=='files') {
        document.getElementById('regBtn').disabled=false;
        const fileObject = document.getElementById('files').files;
        console.log(fileObject);

        let div = document.getElementById('fileZone');
        div.innerHTML = '';
        let ul = `<ul>`;
        let isOk = 1;
        for(let file of fileObject) {
            console.log(file);
            let validResult = fileSizeValidation(file.name, file.size);
            isOk*=validResult;
            ul += `<li>`;
            ul += `${validResult ? '<div>업로드 가능':'<div>업로드 불가능'}</div>`;
            ul += `${file.name}`;
            ul += `<span class="badge rounded-pill text-bg-${validResult?'success':'danger'}">${file.size}Bytes</span></li>`;
        }
        ul += `</ul>`;
        div.innerHTML = ul;
        if(isOk==0) {
            document.getElementById('regBtn').disabled = true;
        }

    }
})

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