function validation() {
  let values = document.getElementById("values").value;
  let error = document.getElementById("error");
  var pattern = /^[0-9]+$/;

  if (values == "") {
    error.style.color = "red";
    error.textContent = "Error : Please enter the value";
    return false;
  } else if (pattern.test(values)) {
    error.textContent = " ";
    return true;
  } else {
    error.style.color = "red";
    error.textContent = "Error : Please enter only numeric digits.";
    return false;
  }
}
