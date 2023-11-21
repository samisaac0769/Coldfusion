<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>11</title>
    <link href="css/cf.css" rel="stylesheet">
</head>

<body>
    <div style="text-align:center">
        <h3> Create a cfm page with a function named multiply. It should give results for the following function calls.
        </h3>
        <p>------------------------------------------------------------------------------------Answer----------------------------
            ---------------------------------------------------------</p>
    </div>
    <table class="Ftable">
        <tr>
            <th>Question</th>
            <th>Answer</th>
        </tr>
        <tr>
            <th><span>res1 = mulitiply(1,2)</span><cfset local.res1 = createObject("component", "Component/11_multiple").mulitiply(1,2)></th>
            <td>
                <cfdump var="#local.res1#">
            </td>
        </tr>
        <tr>
            <th><span>res2 = mulitiply(1,2,3)</span><cfset local.res2 = createObject("component", "Component/11_multiple").mulitiply(1,2,3)></th>
            <td>
                <cfdump var="#local.res2#">
            </td>
        </tr>
        <tr>
            <th><span>res3 = mulitiply(1,2,3,4)</span><cfset local.res3 = createObject("component", "Component/11_multiple").mulitiply(1,2,3,4)></th>
            <td>
                <cfdump var="#local.res3#">
            </td>
        </tr>
    </table>





    <cffunction name="mulitiply" access="public" returntype="numeric">
        <cfset result=1>
            <cfset values=arguments>
                <cfloop index="i" from="1" to="#values.count()#">
                    <cfset result *=values[i]>
                </cfloop>
                <cfreturn result>
    </cffunction>

</body>

</html>