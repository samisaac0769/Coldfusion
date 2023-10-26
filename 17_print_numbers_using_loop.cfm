<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="js/17_print_numbers_using_loop.js"></script>
</head>

<body>
    <div style="text-align:center;">
        Create a page with a text box & submit button. Users can enter a numeric value in the text box & click the submit button.
         If the user entered a non-numeric character, the page should validate the user input using JS. 
         While clicking on the submit button, the page should show numbers from 1 to the given input number,
         with odd numbers in blue and even numbers in green.

    </div><br><br>
    <center>
        <form method="post" action="17_print_numbers_using_loop.cfm" onsubmit="return validation()">
            <input name="values" id="values" type="text">
            <input type="submit" value="Submit">
        </form>
        <p id="error"></p>

        <cfif structKeyExists(form, "values")>
            <cfinvoke component="Component/17_print_numbers_using_loop" method="changecolor" returnvariable="results">
                <cfinvokeargument name="values1" value="#form.values#">
            </cfinvoke>
            <cfset resultsString = arrayToList(results, '')>
            <cfoutput>#resultsString#</cfoutput>        
        </cfif>
    </center>
</body>
</html>