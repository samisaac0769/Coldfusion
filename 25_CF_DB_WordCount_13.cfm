<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>color to the size</title>
    <link href="css/25.css" rel="stylesheet">
</head>
<body>
    <cfoutput>
        <cfset soted = createObject("component", "Component/25_CF_DB_WordCount_1")>
        <cfset call = soted.sotedtext()>
        <center>
            <table>
                <tr><th>Word</th><th>Count</th></tr>
                <cfloop query="call"> <br>
                    <tr class="size#call.lastword#">
                        <td>#call.first#</td>
                        <td>#call.lastword#</td>
                    </tr>
                </cfloop>
            </table>
            
            <a href="#session.currentURL#">
                <button class="btn" >
                    start again
                </button>
            </a>
        </center>
    </cfoutput>
</body>
</html>