function validateForm() {
    let grade = document.getElementById("grade").value;
    document.getElementById("error").textContent = "";
    var val = /^[0-9]+$/;


    if (!grade) {
        alert("Please enter a value");
        return false;
    }
    else if (!val.test(grade)) {
        document.getElementById("error").textContent = "Please enter a valid value";
        return false;
    }
    else if (grade < 1 || grade > 5) {
        document.getElementById("error").textContent = "Enter a value between 1 and 5";
        return false;
    }
    return true;
}