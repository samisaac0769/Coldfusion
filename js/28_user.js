$(document).ready(function () {
    $("#add").click(function () {
        $("#addtitle").text("ADD NEW PAGE") 
    });
})



function validateForm() {
    let pagename = document.getElementById("pagename").value.trim();
    let discription = document.getElementById("discription").value.trim();

    if (pagename.length === 0 || discription.length === 0) {
        showError("All fields are required.");
        return false; // Prevent form submission
    }

    return true;
}

function showError(message) {
    document.getElementById("error").textContent = message;
}