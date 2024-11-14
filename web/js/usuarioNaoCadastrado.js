const urlParams = new URLSearchParams(window.location.search);
    if (urlParams.get("erro") === "true") {
      alert("Usuário e/ou senha inválidos.");
    }