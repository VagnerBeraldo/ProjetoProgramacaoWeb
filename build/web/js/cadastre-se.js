document.getElementById('idCadastrese').addEventListener('click', function() {
    
    // Seleciona os elementos para ocultar
    document.querySelector('.menu').style.display = 'none';
    document.querySelector('.loginCadastro').style.display = 'none';
    document.querySelector('.principal').style.display = 'none';
    
    // Exibe o iframe de cadastro
    document.querySelector('.menuForm').style.display = 'block';
    document.querySelector('.menuForm').style.height = '60px';
    document.querySelector('.cadastro').style.display = 'block'; 
    
     setTimeout(function() {
        window.alert("Importante: verifique o ID do pet para prosseguir.");
     }, 100);

 });
