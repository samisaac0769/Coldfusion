function displayFileName(input) {
    const selectedFile = input.files[0];
    const errorElementImage = document.getElementById("error-message-image");

    if (selectedFile) {
        errorElementImage.textContent = "";
        document.getElementById("selectedFileName").textContent = selectedFile.name;
    } else {
        document.getElementById("selectedFileName").textContent = ""; // Clear the text if no file is selected
    }
}

function validateForm() {
    let fromEmail = document.getElementById("fmail").value;
    let toEmail = document.getElementById("tmail").value;
    let image = document.getElementById("fileInput").value;

    const errorElementFrom = document.getElementById("error-message-from");
    const errorElementTo = document.getElementById("error-message-to");
    const errorElementImage = document.getElementById("error-message-image");

    if (fromEmail.trim() === '') {
        errorElementFrom.textContent = "From email is required";
    } else {
        errorElementFrom.textContent = "";
    }

    if (toEmail.trim() === '') {
        errorElementTo.textContent = "To email is required";
    } else {
        errorElementTo.textContent = "";
    }

    if (image.trim() === '') {
        errorElementImage.textContent = "Image is required";
    } else {
        errorElementImage.textContent = "";
    }

    if (fromEmail.trim() === '' || toEmail.trim() === '' || image.trim() === '') {
        return false;
    }
    
}

function check(input, errorMessageId) {
    const mailadd = input.value;
    const errorElement = document.getElementById(errorMessageId);
    const mailval = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,3}$/;

    if (mailval.test(mailadd)) {
        errorElement.innerHTML = "";
        return true;
    } else {
        errorElement.innerHTML = "Invalid email address";
        return false;
    }
}
