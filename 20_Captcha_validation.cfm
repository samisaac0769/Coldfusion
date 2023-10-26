<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="css/cf.css" rel="stylesheet">
</head>
<body>

    <h3>Create a page with two textboxes (captcha and email). Create captcha using cfimage tag.
    To validate the fields captcha(text validation) and email(email validation)using 
    serverside validation.Once user entered the captcha  & clicked on submit,
    then check the entered text is equal to captcha text.If correct then Page 
    should show the message(Email Address successfully subscribe our newsletter).</h3>
        

    <center>
       

        <form action="20_Captcha_validation.cfm" method="post" >
            <input name="mail" placeholder="Enter the mail id"><br><br>
            
            <cfinvoke component="Component/20_Captcha_validation" method="generateRandomText" returnvariable="captchaText">
                <cfinvokeargument name="length" value=6> 
            </cfinvoke>

            <span class="captcha"><cfimage  action="captcha" difficulty="medium" text="#captchaText#"/></span><br>
            
            <input name="inputchaptcha" placeholder="Enter the captcha">
            <button name="submit">Submit</button>
        </form>

        <cfif structKeyExists(form,"mail") and structKeyExists(form,"inputchaptcha") and structKeyExists(form,"submit")>
            <cfinvoke component="Component/20_Captcha_validation" method="validationc" returnvariable="result">
                <cfinvokeargument name="ipmail" value="#form.mail#">
                <cfinvokeargument name="gchaptcha" value="#captchaText#">
                <cfinvokeargument name="ipchaptcha" value="#form.inputchaptcha#">
            </cfinvoke>


            <cfoutput>
                <cfif result eq "mailempty">
                    <p class="error">Enter the Mail ID</p>
                <cfelseif result eq "captchaempty">
                    <p class="error">Enter the captcha</p>
                <cfelseif result eq "invalidmailid">
                    <p class="error">Invalid mail id, Enter again</p>
                <cfelseif result eq false>
                    <p class="error">Invalid captcha</p>
                <cfelse>
                <p style="color:green; font-size:20px">Email Address successfully subscribe our newsletter</p>
                <script>
                    alert("Email Address successfully subscribe our newsletter");
                </  script>
                </cfif>
            </cfoutput>
            
            

        </cfif>
    </center>
    
</body>
</html>