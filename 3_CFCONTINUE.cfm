<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>3</title>
    <link href="css/cf.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/cf.js"></script>

</head>

<body>
    <h3>Create a page with text box & submit button. Input for the text box is "3,8,9,11,12"
        While click on submit, result page should show numbers divided by 3. So result must be 3,9,12.
        Should use cfcontinue in appropriate place.</h3>

    <div class="main-body">
        <form action="" method="post">
            <label for=""> Enter the value : </label>
            <input type="text" name="values" id="values" placeholder="Enter the value">
            <button type="submit" id="submit">Submit</button>
        </form>

        <cfif isDefined("form.values")>
            <cfset inputValues=form.values>

            <cfset valuesArray=listToArray(inputValues, "," )>
            <cfloop array="#valuesArray#" index="value">
                <cfset modulusResult=value % 3>
                <cfif modulusResult eq 0>
                    <cfoutput> #value#, </cfoutput>
                </cfif>
            </cfloop>
        </cfif>

    </div>

</body>

</html>