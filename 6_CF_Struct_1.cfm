<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>6</title>
    <link href="css/cf.css" rel="stylesheet">

</head>

<body>
    <div style="text-align:center">
    <h2>ColdFusion Structure</h2>
        <h3>Create a web page that will have two text boxes and a submit button. When submitted, the page will post to self<br>
Create a structure in ColdFusion with the values from the text box. The text entered in text box one is the key, and the text entered in text box 2 is the value. CFDUMP the structure.</h3>
        <p>------------------------------------------------------------------------------------Answer-------------------------------------------------------------------------------------
        </p>
    </div>

    <div class="main-body">
        <form action="6_CF_Struct_1.cfm" method="post" class="form1" >
        <div>
            <label for=""> Key : </label>
            <input type="value" name="key" placeholder="Enter the key">
        </div>
        <div>
            <label for=""> Value : </label>
            <input type="value" name="value" placeholder="Enter the value">
        </div>
            <button type="submit" id="submit">Submit</button>
            <p id="error"></p>
        </form>

        <cfif IsDefined("form.key") and IsDefined("form.value")>
                    

        <cfinvoke component="Component/6_CF_Struct_1" method="matchkeyandvalue" returnvariable="keyvalue">
        <cfinvokeargument name="key" value="#form.key#">
        <cfinvokeargument name="value" value="#form.value#">
        </cfinvoke>
         <cfdump var="#keyvalue#"  label="KEY VALUE STRUCTURE">     

        </cfif>
    </div>

</body>

</html>