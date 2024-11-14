document.addEventListener("DOMContentLoaded", function () {
    
    if (localStorage.getItem("popupStatus") !== "true") {
        document.querySelector(".poupap").style.display = "flex";
    } else {
        document.querySelector(".poupap").style.display = "none";
    }

    function handlePopupInteraction() {
        localStorage.setItem("popupStatus", "true");
        document.querySelector(".poupap").style.display = "none";
    }

    document.querySelector(".aceitar button").addEventListener("click", handlePopupInteraction);
    document.querySelector(".recusar button").addEventListener("click", handlePopupInteraction);
});
