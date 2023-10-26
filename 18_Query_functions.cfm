<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>18</title>
        <link href="css/cf.css" rel="stylesheet" >
    </head>

    <body>
        <div style="text-align:center;">

            <h3>Need to create a query data type variable manually with out using cfquery tag. Need to use neccesary query
                functions.<br>Query will have 3 columns, ID - Number, Name - String, email - String<br>
                This Query variable should have 3 rows of data.</h3>
            <p>------------------------------------------------------------------------------------<b>Answer</b>-------------------------------------------------------------------------------------
            </p>
        </div>
        <center>
            <form action="18_Query_functions.cfm" method="post" >
                <cfset myQuery = QueryNew("ID,Name,Email", "integer,varchar,varchar")>

                <cfset QueryAddRow(myQuery,3)>
                <cfset QuerySetCell(myQuery, "ID", 1, 1)>
                <cfset QuerySetCell(myQuery, "Name", "Samisaac", 1)>
                <cfset QuerySetCell(myQuery, "Email", "Sam@gmail.com.com", 1)>

                <cfset QuerySetCell(myQuery, "ID", 2, 2)>
                <cfset QuerySetCell(myQuery, "Name", "jacob", 2)>
                <cfset QuerySetCell(myQuery, "Email", "jacob@gmail.com", 2)>

                <cfset QuerySetCell(myQuery, "ID", 3, 3)>
                <cfset QuerySetCell(myQuery, "Name", "joel", 3)>
                <cfset QuerySetCell(myQuery, "Email", "joel@gmail.com", 3)>

            </form>

            <cfset RealMadrid=StructNew()>
            <cfset RealMadrid={ID=4,Name="Keylor ",Email="Keylor@gmail.com"}>
            <cfset QueryAddRow(myQuery,#RealMadrid#)>
            <cfset RealMadrid={ID=5,Name="Navas",Email="Navas@gmail.com"}>
            <cfset QueryAddRow(myQuery,#RealMadrid#)>
            
            <cfset myColumnValues=ArrayNew(1)>
            <cfset myColumnValues[1]="Aluvilai">
            <cfset myColumnValues[2]="sadasdasdasd">
            <cfset myColumnValues[3]="sdasdasdasdasd">
            <cfset myColumnValues[4]="sgdfgdasdafgdfsdasdasd">
            <cfset myColumnValues[5]="sdadfgdfgdfgsdasdfgdfgdasdasd">
            <cfset QueryAddColumn(myQuery, "Address", "varchar", #myColumnValues#)>

            <table>
                <tr>
                    <th>ID</th>
                    <th>NAME</th>
                    <th>EMAIL</th>
                    <th>Address</th>
                </tr>
                <cfoutput query="myQuery">
                    <tr>
                        <td>#myQuery.ID#</td>
                        <td>#myQuery.Name#</td>
                        <td>#myQuery.Email#</td>
                        <td>#myQuery.Address#</td>
                    </tr>
                </cfoutput>
            </table>
        </center>
    </body>
</html>