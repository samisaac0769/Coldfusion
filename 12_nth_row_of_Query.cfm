<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>12</title>  
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
            <table>
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                </tr>
                <tr style="border:1px solid">Data from DB</tr>
                <cfoutput query="namelist">
                    <tr>
                        <td>#FirstName#</td>
                        <td>#LastName#</td>
                    </tr>
                </cfoutput>
            </table>
            <br><br>

            <cfif isDefined("form.nthplace")>
                <cfif #form.nthplace# eq "">
                    <span> dai enter the value da</span>
                    <cfelse>
                        <cfquery datasource="MyColdfusiontask" name="namelist1">
                            SELECT * FROM namelist ORDER BY (SELECT NULL) OFFSET #form.nthplace# -1 ROWS fetch next 1
                            row only;
                        </cfquery>
                        <cfif namelist1.recordCount GT 0>
                            
                                <table>
                                    <tr style="border:1px solid">The Answer is</tr>
                                    <tr>
                                        <th>First Name</th>
                                        <th>Last Name</th>
                                    </tr>
                                    <cfoutput query="namelist1">
                                    <tr>
                                        
                                        <td>#FirstName#</td>
                                        <td>#LastName#</td>
                                        
                                    </tr>
                                    </cfoutput>
                                </table>
                            
                            <cfelse>
                                <cfoutput >The query did not return results.</cfoutput>    
                                
                        </cfif>
                </cfif>
            </cfif>
    </center>



</body>

</html>