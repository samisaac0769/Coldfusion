
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>28</title>
    <style>
    .error{
        color:red;
        font-size:15px;
        text-align:center;
    }
    h3{
        color:red;
    }
        input{
            padding:5px;
        }
        form div{
            margin:10px;
        }
        form{
            width:25%;
            border: 1px solid red;
            margin-top:100px;
            text-align:center;
        }
    </style>
</head>
<body>
    <center>
        <h3>Login page with user name & password. Once user entered correct details, it should redriect to welcome.cfm, 
            if not, it will show error message in login page. If any one of the user, directly access 
            the welcome.cfm with out login, Application should redirect the user in to log in page.
            In welcome page, there must be a logout link, which will log out the user from the applition & redirect 
            to log in page.</h3>
    
        <cfset local.csrfToken = CSRFGenerateToken() />
        <form method="post" action="28_Simple_CMS.cfm"> 
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
    </center>

    <cfif structKeyExists(form, "submit")>
        <cfinvoke  method="login" component="Component/28_Simple_CMS" returnvariable="result">
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