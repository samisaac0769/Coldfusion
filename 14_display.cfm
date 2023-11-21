<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>14 Diasplay Page</title>
            <link href="css/cf.css" rel="stylesheet">

</head>
<body>
    <cfset local.imgid = id>
        <cfset local.thumpnail = createObject("component", "Component/14_upload").displayDetails(id='#local.imgid#')>
    
    <center>
        <table>
            <tr>
                <th>Image Name</th>
                <th>Description</th>
                <th>Image</th>
            </tr>
            <cfoutput query="local.thumpnail">
                <tr>
                    <td>#imgname#</td>
                    <td>#discreption#</td>
                    <td><img width="120" height="120"  src="assets/#imgpath#"></td>
                </tr>
            </cfoutput>
        </table>
        <button type="button" ><a href="14_process_thumnail.cfm">Back</a></button>
    </center>
</body>
</html>