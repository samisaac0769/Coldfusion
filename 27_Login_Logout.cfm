<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>27</title>
    <link href="css/27.css" rel="stylesheet">
</head>
<body>
    <center>
        <h3>Login page with user name & password. Once user entered correct details, it should redriect to welcome.cfm, 
            if not, it will show error message in login page. If any one of the user, directly access 
            the welcome.cfm with out login, Application should redirect the user in to log in page.
            In welcome page, there must be a logout link, which will log out the user from the applition & redirect 
            to log in page.</h3>
    </center>
    <cfset local.csrfToken = CSRFGenerateToken() />
    <form method="post" action="27_Login_Logout.cfm"> 
        <div>
            <label for="username">Username </label>
            <input name="userName" type="text" >
        </div>
        <div>
            <label for="username">Password </label>
            <input name="passWord" type="password" >
        </div>
        <div>
            <input type="hidden" name="token" value="<cfoutput>#local.csrfToken#</cfoutput>">
            <button name="submit" type="submit">Submit</button>
        </div>        
    </form>

        
    <cfif structKeyExists(form, "submit")>
        <cfinvoke  method="login" component="Component/27_Login_Logout" returnvariable="result">
            <cfinvokeargument  name="username"  value="#form.userName#">
            <cfinvokeargument  name="password"  value="#form.passWord#">
            <cfinvokeargument  name="token"  value="#form.token#">
        </cfinvoke>
        <center>
            <cfoutput>
                <span class="error">#result#</span>
            </cfoutput>
        </center>
    </cfif>
    
</body>
</html>