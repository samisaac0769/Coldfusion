<!DOCTYPE html>
<html lang="en">
<head>
    <title>14</title>
    <link href="css/cf.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/14.js"></script>
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
        <form action="14_Upload_validation_and_Image_function.cfm" method="post" onsubmit="return validate()"  enctype="multipart/form-data">
            <label for="imageName"><span class="important">*</span>Image Name:</label>
            <input type="text" id="imageName" name="imageName"><br>

            <label for="description"><span class="important">*</span>Description:</label>
            <textarea id="description" name="description" rows="2" cols="20"></textarea><br>

            <label for="imageFile"><span class="important">*</span>Image Upload</label>
            <input type="file" id="imageFile" name="imageFile" accept=".jpg, .jpeg, .png, .gif" onchange="check()">
            <input type="submit" value="Upload Image">
            <p id="filerror" class="error" ></p>
        </form>

        <cfif structKeyExists(form, "imageName") and structKeyExists(form, "description") and structKeyExists(form, "imageFile")>
            <cfdump var="#form.imageFile#" >
            <cfabort>
            <cfset local.path = ExpandPath("/Coldfusion/assets")>

            <cfif structKeyExists(form, "imageFile")>
            <cffile action = "upload" 
            fileField = "form.imageFile" 
            destination =  "#local.path#"
            nameConflict = "MakeUnique"
            allowedextensions=".jpg, .jpeg, .png, .gif" >

            <cfset local.image = cffile.clientFile>

            <cfquery datasource="MyColdfusiontask" name="list">
                insert into imglist (imgname , discreption, imgpath) values('#form.imageName#', '#form.description#', '#local.image#');
            </cfquery>
            </cfif>
            <cflocation url="14_process_thumnail.cfm" addtoken="no">
        </cfif>
    </center>
</body>
</html>