<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<cfquery datasource="MyColdfusiontask" name="thumpnail">
select *from imglist;
</cfquery>

<cfif thumpnail.recordCount GT 0>
<table>
<tr>
<th>Image Name</th>
<th>Discription</th>
<th>Image</th>
</tr>
<cfoutput query="thumpnail">
<tr>
<td>#imgname#</td>
<td><img width='120' height='120' src="#imgpath#"></td>
</tr>
</cfoutput>
</table>
</cfif>
</body>
</html>