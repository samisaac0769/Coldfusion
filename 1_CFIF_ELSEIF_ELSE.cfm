<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>1</title>
    <link href="css/cf.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/cf.js"></script>



    <script>
        function validateForm() {
            let grade = document.getElementById("grade").value;
            document.getElementById("error").textContent = "";
            var val = /^[0-9]+$/;


            if (!grade) {
                alert("Please enter a value");
                return false;
            }
            else if (!val.test(grade)) {
                document.getElementById("error").textContent = "Please enter a valid value";
                return false;
            }
            else if (grade < 1 || grade > 5) {
                document.getElementById("error").textContent = "Enter a value between 1 and 5";
                return false;
            }
            return true;
        }
    </script>
</head>

<body>
    <h3>Create a page with text box & submit button. Input for the text box is any number between 1 to 5.
        JS validation should be there to validate the user input. Based upon the user input, you should show
        the corresponding string. 5 is Very good. 4 is good. 3 is fair. 1 & 2 is Ok.
        Use cfif, cfelseif,cfelse to do this functionality.</h3>
    <div class="main-body">
        <form action="" method="post" onsubmit="return validateForm();">
            <label for=""> Enter the value : </label>
            <input type="text" name="grade" id="grade">
            <button type="submit" id="submit">Submit</button>
            <p id="error"></p>
        </form>

        <cfif structKeyExists(form, "grade")>
            <cfset inputvalue=form.grade>

            <cfif inputvalue eq 5>
                <h2 style="color:green;">Your Grade is Very good</h2>
            <cfelseif inputvalue eq 4>
                <h2>Your Grade is good</h2>
            <cfelseif inputvalue eq 3>
                <h2>Your Grade is fair</h2>
            <cfelseif inputvalue eq 2 || inputvalue eq 1>
                <h2>Your Grade is Ok.</h2>
            <cfelse>
                <h2>You entered the wrong Input</h2>
            </cfif>

        </cfif>
    </div>
</body>

</html>