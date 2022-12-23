// script permettant lors de l'animation du label de rester haut et non de redecendre sur le texte entrer
    const inputs = document.querySelectorAll('input');

    for (let i = 0; i < inputs.length; i++) {

        let field = inputs[i];

        field.addEventListener('input', (e) => {

            if(e.target.value != ""){
                e.target.parentNode.classList.add('animation');
            } else if (e.target.value == "") {
                e.target.parentNode.classList.remove('animation');
            }

        })

    }