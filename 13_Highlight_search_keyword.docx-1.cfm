<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>13</title>
    <link href="css/cf.css" rel="stylesheet">
</head>

<body>
    <div style="text-align:center">
        <h3>Highlight search keyword:
            You have variable with content “the quick brown fox jumps over the lazy dog”
            Create a page with text box & submit submit button. If you user gave “the” as input, then you need to show
            the result as,Found the key word in 2 times - the quick brown fox jumps over the lazy dog. if input is dog
            then result should be,Found the key word in 1 time - the quick brown fox jumps over the lazy dog
        </h3>
    </div>
    <center>
        <h2>the quick brown fox jumps over the lazy dog</h2>
        <form action="13_Highlight_search_keyword.docx-1.cfm" method="post">
            <input type="text" placeholder="Enter the string" name="string">
            <button>Submit</button>
        </form>

        <cfif structKeyExists(form,"string")>
            <cfinvoke component="Component/13_Highlight_search_keyword_docx-1" method="search" returnvariable="result">
                <cfinvokeargument name="searchstring" value="#form.string#">
            </cfinvoke>
            
            <cfoutput><br>#result#</cfoutput>
        </cfif>
    </center>
</body>

</html>