<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <div style="text-align:center;">
        <h2>Write a CF program to print data by 3 rows and 3 columns like the example below.</h2>
    </div>
    <center>
        <cfoutput>
            <table border="1">
                <cfloop from="1" to="3" index="row">
                    <tr>
                        <cfloop from="1" to="3" index="col">
                            <td>#((col - 1) * 3 + row)#</td>
                        </cfloop>
                    </tr>
                </cfloop>
            </table>
        </cfoutput>
    </center>
</body>
</html>