        function acumulaValores(){
            let valorAtualizado = 0;
            let valorSemDesconto = 0;
            let itensSelecionados = 0;
    
            const select = document.getElementById("idOfertaSelecionada");
            const valorSelecionado = parseFloat(select.value);
    
            if (!isNaN(valorSelecionado)) {
                valorAtualizado = valorSelecionado;
                valorSemDesconto = valorSelecionado;
                itensSelecionados = select.selectedIndex; 
            }
    
            let desconto = 0;
            if (itensSelecionados === 1) {
                desconto = 0.30;  
            } else if (itensSelecionados === 2) {
                desconto = 0.40;  
            } else if (itensSelecionados === 3) {
                desconto = 0.50;  
            }
    
            valorAtualizado = valorAtualizado * (1 - desconto);
    
            document.getElementById("somaValor").innerHTML = `De R$ <span id="valorSemDesconto">${valorSemDesconto.toFixed(2).replace('.', ',')}</span> por R$ ${valorAtualizado.toFixed(2).replace('.', ',')}`;
 
        }