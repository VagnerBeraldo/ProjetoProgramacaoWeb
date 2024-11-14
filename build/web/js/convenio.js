        function acumulaValores(){
            let valorAtualizado = 0;
            let valorSemDesconto = 0;
            let cursosSelecionados = 0;
            var opcoes = document.getElementsByName("conv");
            
            
            for(let i = 0; i < opcoes.length; i++){
                if(opcoes[i].checked){
                    valorAtualizado += parseFloat(opcoes[i].value);
                    valorSemDesconto += parseFloat(opcoes[i].value);
                    cursosSelecionados++;
                }
            }

            let desconto = 0;
            if (cursosSelecionados === 1) {
                desconto = 0.30;  
            } else if (cursosSelecionados === 2) {
                desconto = 0.40;  
            } else if (cursosSelecionados === 3) {
                desconto = 0.50;  
            }

            valorAtualizado = valorAtualizado * (1 - desconto);
            
            document.getElementById("somaValor").innerHTML = "De R$ " + valorSemDesconto.toFixed(2).replace('.', ',') + " por R$ " + valorAtualizado.toFixed(2).replace('.', ','); 

        }
    