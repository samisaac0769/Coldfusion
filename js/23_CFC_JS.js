const twoPattern = /[0-9]{2}$/;
const phonePattern = /^[6-9]\d{9}$/
const threePattern = /[0-9]{3}$/;
const fourPattern = /[0-9]{4}$/;
const numberonly = /[0-9]$/;
const letteronly = /^[a-zA-Z]*$/;
const emailPattern = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,3}$/;
const urlPattern = /^(https?|ftp):\/\/[^\s/$.?#].[^\s]*$/i;


function month() {
    let inputValue = document.getElementById("mm").value;
    if (twoPattern.test(inputValue)) {
        document.getElementById("merror").textContent = "";
        if (inputValue > 12 || inputValue < 1) {
            document.getElementById("merror").textContent = "Invalid month.";
            return false;
        }
    } else {
        document.getElementById("merror").textContent = "Enter the month in number";
        return false;
    }
    return true;
}

function date() {
    let inputValue = document.getElementById("dd").value;
    if (twoPattern.test(inputValue)) {
        document.getElementById("derror").textContent = "";
        if (inputValue > 31 || inputValue < 1) {
            document.getElementById("derror").textContent = "Invalid date.";
            return false;
        }
    } else {
        document.getElementById("derror").textContent = "Enter the date in number";
        return false;
    }
    return true;
}

function year() {
    let inputValue = document.getElementById("yyyy").value;
    if (fourPattern.test(inputValue)) {
        document.getElementById("yerror").textContent = "";
        if (inputValue > 2023) {
            document.getElementById("yerror").textContent = "It year should not be future";
            return false;
        }
    } else {
        document.getElementById("yerror").textContent = "Enter the year in number";
        return false;
    }
    return true;
}

function dollars() {
    let Dollars = document.getElementById("Dollars").value;

    if (!isNaN(Dollars)) {
        document.getElementById("salaryerror").textContent = "";
        return true;
    }
    else {
        document.getElementById("salaryerror").textContent = "Enter the dollars in numeric";
        return false;
    }
}

function cents() {
    let Cents = document.getElementById("Cents").value;

    if (!isNaN(Cents)) {
        document.getElementById("centerror").textContent = "";
        return true;
    }
    else {
        document.getElementById("centerror").textContent = "Enter the cent in numeric";
        return false;
    }
}

function portfolio() {

    let Portfolio = document.getElementById("Portfolio").value;

    if (urlPattern.test(Portfolio)) {
        document.getElementById("porterror").textContent = "";
    }
    else if (Portfolio == "http://") {
        document.getElementById("porterror").textContent = "";
    }
    else {
        document.getElementById("porterror").textContent = "Invalid URL. enter the url with (http://)";
        return false;
    }
    return true;
}

function firstname() {

    let firstname = document.getElementById("fname").value;

    if (letteronly.test(firstname)) {
        document.getElementById("fNameerror").textContent = "";
        return true;
    }
    else {
        document.getElementById("fNameerror").textContent = "Invalid name";
        return false;
    }

}

function lastname() {
    let lastname = document.getElementById("lname").value;

    if (letteronly.test(lastname)) {
        document.getElementById("lNameerror").textContent = "";
        return true;
    }
    else {
        document.getElementById("lNameerror").textContent = "Invalid name";
        return false;
    }

}

function mailval() {
    let mail = document.getElementById("Email").value;

    if (emailPattern.test(mail)) {
        document.getElementById("mailerror").textContent = "";
        return true;
    }
    else {
        document.getElementById("mailerror").textContent = "Invalid mail id";
        return false;
    }
}

function mailval() {
    let mail = document.getElementById("Email").value;

    if (emailPattern.test(mail)) {
        document.getElementById("mailerror").textContent = "";
        return true;
    }
    else {
        document.getElementById("mailerror").textContent = "Invalid mail id";
        return false;
    }
}

function phfs(inputElement) {
    const value = inputElement.value;

    if (value.length === 3) {
        if (!threePattern.test(value)) {
            inputElement.nextElementSibling.textContent = "Invalid: 3 digits required";
            return false;
        } else {
            inputElement.nextElementSibling.textContent = "";
        }
    } else if (value.length === 4) {
        if (!fourPattern.test(value)) {
            inputElement.nextElementSibling.textContent = "Invalid: 4 digits required";
            return false;
        } else {
            inputElement.nextElementSibling.textContent = "";
        }
    } else {
        inputElement.nextElementSibling.textContent = "Invalid: 3 or 4 digits required";
        return false;
    }
    return true;
}

function phone() {
    let fffValue = document.getElementById("fff").value;
    let sssValue = document.getElementById("sss").value;
    let ttttValue = document.getElementById("tttt").value;

    let phoneno = fffValue + sssValue + ttttValue;

    document.getElementById("perror").textContent = "";

    if (isNaN(phoneno)) {
        document.getElementById("perror").textContent = "Invalid. only number";
        return false;
    } else if (!phonePattern.test(phoneno)) {
        document.getElementById("perror").textContent = "Invalid. The number should start with 6789 and contain 10 digits";
        return false;
    }
    return true;
}

function validationform() {
    let position = document.getElementById("position").value;
    let willing = document.getElementById("reselect").value;
    let imonth = document.getElementById("mm").value;
    let idate = document.getElementById("dd").value;
    let iyear = document.getElementById("yyyy").value;
    let first = document.getElementById("fname").value;
    let last = document.getElementById("lname").value;
    let mail = document.getElementById("Email").value;

    let fffValue = document.getElementById("fff").value;
    let sssValue = document.getElementById("sss").value;
    let ttttValue = document.getElementById("tttt").value;




    // Clear any previous error messages
    document.getElementById("imperror").textContent = "";

    if (
        position === "" ||
        imonth === "" ||
        idate === "" ||
        iyear === "" ||
        first === "" ||
        last === "" ||
        mail === "" ||
        fffValue === "" ||
        sssValue === "" ||
        ttttValue === ""

    ) {
        document.getElementById("imperror").textContent = "Please fill in all * required fields";
        return false;
    }
    else if (month() && date() && year() && firstname() && lastname() && mailval() && phone()) {
        console.log("SIBMIT");
        return true; // Allow form submission
    } else {
        console.log(" NOT SIBMIT");
        return false; // Prevent form submission
    }


}






$(document).ready(function () {
    $("#Portfolio").val("http://");
});


