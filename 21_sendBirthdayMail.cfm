<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>21</title>
        <link href="css/brithdaymail.css" rel="stylesheet"> 
        <link rel="stylesheet" href="css/icon.css" />
        <script src="js/21.js"></script>
    </head>
    <body>
        <h3>Create birthday wishes page which contains following fields.Birthday Baby Name: Text box His Email Id :	Text box
            Birthday Wishes: Text area Greeting image : File upload field While click on the submit, it should send greeting mail to birthday guy’s mail id. 
            Greeting image should be in attachment along with mail.<br>sdas@sadeas.com
        </h3>

        <div class="card">
            <div class="titlehead">
            <span class="title">New Message</span>
            <span class="material-symbols-outlined">close</span>
            </div>
        
            <form action="21_sendBirthdayMail.cfm" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
                <div>
                    <lable for="fmail">From</lable>
                    <input name="fmail" id="fmail" placeholder=".....@gmail.com" onchange="check(this, 'error-message-from')">
                    <p id="error-message-from"class="error"></p>
                </div>
                <div>
                    <lable for="tmail">To</lable>
                    <input name="tmail" id="tmail" placeholder=".....@gmail.com" onchange="check(this, 'error-message-to')">
                    <p id="error-message-to" class="error"></p>
                </div>
                <div>
                    <lable for="subject">Subject</lable>
                    <input name="subject" placeholder="Enter the Birthday person name" >
                </div>
                <div>
                    <textarea class="mailbody" rows="90" cols="90" name="msg" placeholder="Give your message"></textarea>
                </div>
                <div class="subtn">
                    <button name="submit">Submit</button>
                    <label for="fileInput" style="cursor: pointer;">
                        <span class="material-symbols-outlined">attach_file</span>
                    </label>
                    <input type="file" name="greatimg" id="fileInput" onchange="displayFileName(this)" style="display: none;">
                    <p id="selectedFileName"></p>
                    <p id="error-message-image"class="error"></p>
                </div>
            </form>
        </div>

        <cfif structKeyExists(form, "fmail")>
            <cfinvoke component="Component/21_sendBirthdayMail" method="sendmail" returnvariable="result">
                <cfinvokeargument name="fromail" value="#form.fmail#">
                <cfinvokeargument name="tomail" value="#form.tmail#">
                <cfinvokeargument name="subject" value="#form.subject#">
                <cfinvokeargument name="message" value="#form.msg#">
                <cfinvokeargument name="images" value="#form.greatimg#">
            </cfinvoke>
            <cfoutput>#result#</cfoutput>
        </cfif>
    </body>
</html>