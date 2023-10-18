function validate() {
  let name = document.getElementById("imageName").value;
  let description = document.getElementById("description").value;

  if (!name || !description) {
    alert("Please fill in all mandatory fields");
  } else {
    return true;
  }
}

function check() {
  let imgfile = document.getElementById("imageFile");
  let error = document.getElementById("filerror");

  const file = imgfile.files[0];
  if (!file) {
    alert("no File selected");
    return false;
  }

  const limit = 1024;
  const size = file.size / 1024;
  if (size > limit) {
    const err = new Error(`File too big: ${(size / 1000).toFixed(2)} MB`);
    error.textContent = err.message;
    return false;
  } else {
    error.textContent = " ";
    return true;
  }
}
