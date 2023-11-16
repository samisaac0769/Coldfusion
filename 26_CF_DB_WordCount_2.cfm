<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>26</title>
</head>
<body>
    <center>
        <h3>ColdFusion & DB || Question 26</h3>
        <form action="26_CF_DB_WordCount_2.cfm" enctype="multipart/form-data" method="post" >
            <input type="file" name="fileupload" placeholder="select the text file" accept=".txt">
            <br> 
            <button type="submit">Submit</button>
        </form>
        <cfif structKeyExists(form, "fileupload")>
            <cfif len("#fileupload#") gt 0>
                <cfinvoke component="Component/26_CF_DB_WordCount_2" method="fileUpload" fileupload="form.fileupload" returnvariable="result">
                </cfinvoke>
                <cfoutput> <br>
                    <table>
                        <tr><th>Word</th><th>Count</th></tr>
                        <cfloop collection="#result#" item="word">
                            <cfset wordCount = structFind(result, word)>
                            <tr>
                                <td>#word#</td>
                                <td>#wordCount#</td>
                            </tr>
                        </cfloop>
                    </table>
                    <cfset ip = cgi>
                    <cfset session.currentURL = CGI.SCRIPT_NAME>

                    <a href="25_CF_DB_WordCount_12.cfm">
                        <button class="btn" >
                            NEXT PAGE
                        </button>
                    </a>
                </cfoutput>
            <cfelse>
                <cflocation  url="26_CF_DB_WordCount_2.cfm">
            </cfif>
        </cfif>
    </center>
</body>
</html>