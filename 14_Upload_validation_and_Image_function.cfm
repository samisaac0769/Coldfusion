<!DOCTYPE html>
<html lang="en">
<head>
    
    <title>14</title>
    <link href="css/cf.css" rel="stylesheet">
</head>
<body>
    <div style="text-align:center">
        <h3>Create a form with Image name text box , description text area & Image upload field. 
User can upload only small size jpg,png and gif files. Add validation to check uploaded file type & file size. 
User should not upload a image which is greater than 1 MB. Once user uploaded a image, 
create a thumbnail image (20*20 size) from uploaded images. In list page, show thumbnail image & image name. 
While clicking on the image name, it should redirect the user to details page which will show image name, description 
& original uploaded image.</h3>
        <p>------------------------------------------------------------------------------------Answer----------------------------
            ---------------------------------------------------------</p>
    </div>
    <center>
        <form id="imageUploadForm" action="" method="post" onsubmit="validate()">
            <label for="imageName">Image Name:</label>
            <input type="text" id="imageName" name="imageName" required><br>

            <label for="description">Description:</label>
            <textarea id="description" name="description" rows="2" cols="20"></textarea><br>

            <label for="imageFile">Image Upload</label>
            <input type="file" id="imageFile" name="imageFile" accept=".jpg, .jpeg, .png, .gif" required><br>

            <input type="submit" value="Upload Image">
        </form>
    </center>
    <script src="js/14.js"></script>
</body>
</html>