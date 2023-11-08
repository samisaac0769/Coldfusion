<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>22</title>
        <link href="css/cf.css" rel="stylesheet">
    </head>
    <body>
        <h3>Show the below json info in to table format.
            Json:
            [{"Name":"saravanan","Age":27,"LOCATION":"dubai"},{"Name":"Ram","Age":26,"LOCATION":"Kovilpatti"}] 
            Table format:<br>
            Name 	--	Age 	--	Location<br>
            Saravanan	--  27	--	Dubai<br>
            Ram	--	26	--	Kovilpatti</h3>

            <cfinvoke component="Component/22_JSON" method="json" returnvariable="result"></cfinvoke>
        <center>
            <cfoutput>#result#</cfoutput>
        </center>
    </body>
</html>