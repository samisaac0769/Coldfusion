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
        <h2>ColdFusion Structure 2</h2>
        <h3>
            Create a web page that will have two text boxes and a submit button. When submitted, the page will post to
            self<br>

            Create a structure in ColdFusion with the values from the text box. The text entered in text box one is the
            key, and the text entered in text box 2 is the value. Each time you submit the form, the values entered
            previously should also be shown. <br>

            It means, if I submit a form with 'ColdFusion', 'super', then I should see a dump with key as 'ColdFusion' &
            value as 'Super'.
            Now, If I enter 'php', 'good', then I should see both ColdFusion, php on the screen along with their values<br>
            If I enter ColdFusion again, with different value, then the new value should replace the old value<br>

            CFDUMP the structure. </h3>
        <p>------------------------------------------------------------------------------------Answer-------------------------------------------------------------------------------------
        </p>
    </div>

    <div class="main-body">
        <form action="8_CF_Struct_3.cfm" method="post" class="form1">
            <div>
                <label>Key </label>
                <input type="textbox" id="key" name="key">
            </div>
            <div>
                <label>Value </label>
                <input type="textbox" id="value" name="value">
            </div>
            <button class="submitbtn" type="Submit" name="submitbtn">Submit</button>

        <cfif structKeyExists(form, "key") and structKeyExists(form, "value")>
            <cfinvoke component="Component/8_CF_Struct_3" method="methodkeyandvalue" returnvariable="keyandvalue">
                <cfinvokeargument name="key" value="#form.key#">
                <cfinvokeargument name="value" value="#form.value#">
            </cfinvoke>
            <cfdump var="#keyandvalue#" label="Key Value Pair">
        </cfif>
        </form>



    </div>

</body>

</html>