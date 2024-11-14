    const petNome = {
        "5": "BLUE (Peixe)",
        "9": "DOM (Cachorro)",
        "11": "CARAMELO (Hamster)",
        "14": "DORY (Gato)",
        "18": "CASCÃO E CASQUINHA (Jabuti)",
        "22": "PLAGG E BIGODE (Coelho)"
    };

    const selecionaRegistro = document.getElementById('id-registroPet');
    const inputNomePet = document.getElementById('id-nomePet');

    selecionaRegistro.addEventListener('change', function() {
        const nomeSelecionado = selecionaRegistro.value;
        inputNomePet.value = petNome[nomeSelecionado] || '';
    });
    