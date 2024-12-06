document.addEventListener("DOMContentLoaded", function () {
    
    if (localStorage.getItem("popupStatus") !== "true") {
        document.querySelector(".poupap").style.display = "flex";
    } else {
        document.querySelector(".poupap").style.display = "none";
    }

    function interacaoPopup() {
        localStorage.setItem("popupStatus", "true");
        document.querySelector(".poupap").style.display = "none";
    }

    document.querySelector(".aceitar button").addEventListener("click", interacaoPopup);
    document.querySelector(".recusar button").addEventListener("click", interacaoPopup);
});
