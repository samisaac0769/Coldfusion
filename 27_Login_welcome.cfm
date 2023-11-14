
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Welcome</title>
        <style>
            .card{
                text-align:center;
                border:1px solid black;
                background:blue;
                padding:20px;
                width: 25%;
                margin-left: 35%;
                color: yellow;
                font-size: 30px;
            }
        </style>
    </head>
    <body>

        <cfparam name="session.validated" default="false">

        <cfif session.validated>
            <div class="card">
                <p>Welcome To the Page....!!</p>
                <a href="27_Login_Logout.cfm">
                    <cfset session.validated = false>
                    <button>LogOut</button>
                </a>
            </div>
        <cfelse>
            <cflocation url="27_Login_Logout.cfm" addtoken="false">
        </cfif>


   
    </body>
</html>