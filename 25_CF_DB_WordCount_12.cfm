<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>soted</title>
        <style>
        table  {
            border:1px solid red;
            width:25%;
            margin: 0 0 0 0
        }
        table tr th{
            border:1px solid blue;
            height:30px;
        }
        table tr td{
            border:1px solid green;
            text-align:center;
            height:30px;
        }
        .btn{
            background-color: #0074d9;
            color: #fff; 
            padding: 10px 20px; 
            border: none; 
            cursor: pointer;
        }
    </style>
    </head>
    <body><cfoutput>
    
        <cfset soted = createObject("component", "Component/25_CF_DB_WordCount_1")>
        <cfset call = soted.sotedtext()>
        <center>
            <table>
                <tr><th>Word</th><th>Count</th></tr>
                <cfloop query="call"> <br>
                    <tr>
                        <td>#call.first#</td>
                        <td>#call.lastword#</td>
                    </tr>
                </cfloop>
            </table>
            <a href="25_CF_DB_WordCount_13.cfm">
                <button class="btn" >
                    NEXT PAGE
                </button>
            </a>
        </center>
        </cfoutput>
    </body>
</html>