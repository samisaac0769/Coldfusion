<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        table  {
            border:1px solid black;
            width:25%;
        }
        table tr th{
            border:1px solid black;
        }
        table tr td{
            border:1px solid black;
            text-align:center;
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
<body>
    <center>
        <h3>ColdFusion & DB || Question 25</h3>

        <form action="25_CF_DB_WordCount_1.cfm" method="post">
            <textarea name="textarea"></textarea>
            <br> 
            <button type="submit">Submit</button>
        </form>

        <cfif structKeyExists(form, "textarea")>
            <cfinvoke component="Component.25_CF_DB_WordCount_1" method="textareacount" returnvariable="localKeys">
                <cfinvokeargument name="iptext" value="#form.textarea#">
            </cfinvoke>
            <cfoutput> <br>
                <table>
                    <tr><th>Word</th><th>Count</th></tr>
                    <cfloop collection="#localKeys#" item="word">
                        <cfset wordCount = structFind(localKeys, word)>
                        <tr>
                            <td>#word#</td>
                            <td>#wordCount#</td>
                        </tr>
                    </cfloop>
                </table>
                <cfset session.currentURL = CGI.SCRIPT_NAME>
                <a href="25_CF_DB_WordCount_12.cfm">
                    <button class="btn" >
                        NEXT PAGE
                    </button>
                </a>
            </cfoutput>
        </cfif>
        
    </center>
</body>
</html>