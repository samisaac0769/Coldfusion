
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>5</title>
    <link href="css/cf.css" rel="stylesheet">
<style>
    .form1 div{
    margin-bottom:10px;
    }

    ::placeholder{
        letter-spacing:3px;
        text-transform: uppercase;
    }
</style>
</head>
<body>
        <div style="text-align:center">
        <h3>Get user & his mother date of birth. show users age & At what age his mother delivered him. 
Tell him how many days are remaining for his & his mothers birthday.</h3>
        <p>------------------------------------------------------------------------------------Answer-------------------------------------------------------------------------------------</p>
    </div>
    <br><br>
    <div class="main-body">
        <form action="5_Age_calculator.cfm" method="post" class="form1" onsubmit="return validateForm();">
        <div>
            <label for=""> DOB of mom : </label>
            <input type="date" name="mom" id="mom" placeholder="Enter the DOB">
        </div>
        <div>
            <label for=""> DOB of son : </label>
            <input type="date" name="son" id="son" placeholder="Enter the DOB">
        </div>
            <button type="submit" id="submit">Submit</button>
            <p id="error"></p>
        </form>

        <cfif StructKeyExists(form, "mom") and StructKeyExists(form, "son")>
             <cfinvoke component="Component/5_Age_calculator" method="at_what_age" returnvariable="atwhatage">
                <cfinvokeargument name="momage" value="#form.mom#">    
                <cfinvokeargument name="sonage" value="#form.son#">                 
             </cfinvoke> <br>
            <cfoutput>
                <cfif StructKeyExists(atwhatage, "momAge")>
                    <span class="span">#atwhatage.momAge#</span><br>
                    <span class="span">#atwhatage.sonAge#</span><br>
                    <span style='color: ORANGE;'>#atwhatage.differ#</span><br>

                    <cfif StructKeyExists(atwhatage, "MBD") AND StructKeyExists(atwhatage, "SBD")>
                        <span class="span">#atwhatage.MBD#</span><br>
                        <span class="span">#atwhatage.SBD#</span>
                    </cfif>
                <cfelse>
                    <span class="span">#atwhatage.sonAge#</span>
                </cfif>
            </cfoutput>
            

             
        </cfif>
    </div>


</body>
</html>