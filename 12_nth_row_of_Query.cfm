<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>8</title>
    <link href="css/cf.css" rel="stylesheet">

</head>

<body>
    <div style="text-align:center">
        <h3> In SQL create a table with firstname & last name columns. insert 10 records into that table.
            There is no primary key & numberic column in this table. Create a page with text box & submit button.
            User can enter numeric value less than 10. While click on submit, you should show all data from table
            as well as show Query’s nth row first name column without looping. Here n is value of the user input.</h3>
        <p>------------------------------------------------------------------------------------Answer----------------------------
            ---------------------------------------------------------</p>
    </div>

    <center>
        <form action="" method="post">
            <input type="number" placeholder="enter the number" name="nthplace">
            <button>Get the Date</button>
        </from><br><br>
            <cfquery datasource="MyColdfusiontask" name="namelist">
                SELECT * FROM namelist;
            </cfquery>
            <cfoutput query="namelist">
                #FirstName# #LastName#<br>
            </cfoutput>
            <br><br>
    
        <cfif isDefined("form.nthplace")>
            <cfif #form.nthplace# eq "">
                <span> dai enter the value da</span>
            <cfelse>
                <cfquery datasource="MyColdfusiontask" name="namelist1">
                    SELECT * FROM namelist ORDER BY (SELECT NULL) OFFSET #form.nthplace# -1 ROWS fetch next 1 row only;
                </cfquery>
                    <cfif namelist1.recordCount GT 0>
                        <cfoutput query="namelist1">The Answer is : #FirstName# #LastName#<br></cfoutput>
                    <cfelse>
                        <cfoutput>The query did not return results.</cfoutput>
                    </cfif>
            </cfif>
        </cfif>
    </center>
</body>
</html>