<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>15</title>
    <link href="css/cf.css" rel="stylesheet">
</head>

<body>
    <div style="text-align:center">
        <h3>Create a component with function multiply. Create a cfm page which need to call that function with different
            arguments (mentioned below) using cfinvoke tag, cfobject tag and createobject function.
            It should give results for the following function calls with different number of arguments<br>

            mulitiply(1,2)<br>
            mulitiply(1,2,3)<br>
            mulitiply(1,2,3,4)</h3>
        <p>------------------------------------------------------------------------------------<b>Answer</b>-------------------------------------------------------------------------------------
        </p>
    </div>
    <center>
        <table>
            <tr>
                <th>Question</th>
                <th>Method used</th>
                <th>Answer</th>
            </tr>
            <tr>
                <td>multiply(1,2,3,4)</td>
                <td>createobject</td>
                <td>
                    <cfset local.newmethod=createObject("component", "Component/15_CFC_example" )>
                    <cfset local.ans1=local.newmethod.multiply(1,2,3,4)>
                    <cfoutput>#local.ans1#</cfoutput>
                </td>
            </tr>


            <tr>
                <td>multiply(1,2,3)</td>
                <td>cfinvoke tag</td>
                <td>
                    <cfinvoke component="Component/15_CFC_example" method="multiply" returnvariable="ans2">
                        <cfinvokeargument name="agrument1" value=1>
                        <cfinvokeargument name="agrument2" value=2>
                        <cfinvokeargument name="agrument3" value=3>
                    </cfinvoke>
                    <cfoutput>#ans2#</cfoutput>
                </td>
            </tr>

            <tr>
                <td>multiply(1,2)</td>
                <td>cfobject tag</td>
                <td>
                    <cfobject component="Component/15_CFC_example" name="mulitiply">
                    <cfset local.ans3=mulitiply.multiply(1, 2)>
                    <cfoutput>#local.ans3#</cfoutput>
                </td>
            </tr>
        </table>
        <center>








</body>

</html>