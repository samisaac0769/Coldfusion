<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>19</title>
        <link href="css/cf.css" rel="stylesheet">
    </head>
    <body>
        <div style="text-align:center">
            <h2>ColdFusion Cookies</h2> 
            <h3>Create a web page that will have one submit button. When submitted, the page will post to self. <br>
                Create a cookie named 'VisitsCounter' and every time the submit button is clicked and page is posted,
                the 'VisitsCounter' should be increased by 1 and the increased value is shown on the page.
            </h3>
        </div>

    <center>
        <form action="19_CF_Cookie.cfm" method="post">
            <button name="submit" >Visits Counter</button>
            <button name="clear" >Clear</button>
            
            
        </form>

        <cfif structKeyExists(form, "submit")>
        <cfinvoke component="Component/19_CF_Cookie" method="cookieCount" returnvariable="result"></cfinvoke>
        <cfoutput><br>The number of times the page get visit is : #result#</cfoutput>
        </cfif>

        

    </center>
    </body>
</html>