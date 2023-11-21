<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>23</title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link href="css\23_CFC_JS.css" rel="stylesheet">
    <script src="js/23_CFC_JS.js"></script>

</head>
<body>
    <center><h3 class="question">Design the form as like<a href="https://examples.wufoo.com/forms/employment-application" target="_blank">https://examples.wufoo.com/forms/employment-application</a><br>

        Add javascript validation for all required fields (which will have red * in the label).<br>

        While click on Submit button, data needs to be saved into Database. Database code should be in CFC</h3>
    </center><hr>

    <div class="main-card">
        <div class="icon">
            <img src="assets/wflogo.png">
        </div>
        <div class="formstart">
            <header>
                <h2>Employment Application</h2>
                <p>Infinity Box Inc.</p>
            </header>
            <form action="23_CFC_JS.cfm" method="post" onsubmit="return validationform()">
                <ul>
                    <li>
                        <label>Which position are you applying for? <span class="import">*</span></label>
                        <div>
                            <select id="position" name="position" class="field">
                                <option value="" selected="selected">Select</option>
                                <option value="Interface Designer">Interface Designer</option>
                                <option value="Software Engineer">Software Engineer</option>
                                <option value="System Administrator">System Administrator</option>
                                <option value="Office Manager">Office Manager</option>
                            </select>
                        </div>
                    </li>
                    <li>
                        <label>Are you willing to relocate? <span class="import">*</span></label>
                        <div class="radio-input">
                            <div class="d-flex"><input type="radio" id="reselect" name="reselect" value="yes" checked><span> Yes</span></div>
                            <div class="d-flex"> <input type="radio" id="reselect" name="reselect" value="no" ><span>No</span></div> 
                        </div>
                    </li>
                    <li>
                        <label>When can you start? <span class="import">*</span></label>
                        <div class="start-date d-flex">
                            <div class="flx-col">
                                <input class="mm" name="mm" id="mm" type="text" onblur = "month()" minlength="2" maxlength="2">
                                <span>MM</span>
                            </div><span>/</span>
                            <div class="flx-col">
                                <input class="dd" name="dd" id="dd" type="text" onblur = "date()" minlength="2" maxlength="2">
                                <span>DD</span>
                            </div><span>/</span>
                            <div class="flx-col">
                                <input class="yyyy" name="yyyy" id="yyyy" type="text" onblur = "year()" minlength="4" maxlength="4">
                                <span>YYYY</span>
                            </div>
                            <span>
                                <input class="CALANDER" name="startdate" type="text" id="datepicker">
                            </span>
                            <div>
                            <p id="merror"></p><p id="derror"></p><p id="yerror"></p>
                            </div>
                        </div>
                    </li>
                    <li>
                        <label for="Portfolio">Portfolio Web Site</label>
                        <div class="Portfolio">
                            <input name="Portfolio" onblur = "portfolio()" id="Portfolio">
                            <p id="porterror"></p>
                        </div>
                    </li>
                    <li>
                        <label for="Attach">Attach a Copy of Your Resume</label>
                        <div class="Attach">
                            <input type="file" name="Attach" id="Attach" accept=".docx, .pdf">
                        </div>
                        <span class="exception">Word or PDF Documents Only</span>
                    </li>
                    <li class="fsection">
                        <label for="Salary">Salary Requirements</label>
                        <div class=" Salary d-flex">
                            <div class="flx-col">
                                <input type="text" name="Dollars" id="Dollars" onblur="dollars()" class="Dollars">
                                <span>Dollars</span>
                            </div><span style="text-align:center; line-height:12px; font-size: 20px;">.</span>
                            <div class="flx-col">
                                <input type="text" class="Cents" id="Cents" onchange = "cents()" name="Cents"  maxlength="2" value="00">
                                <span>Cents</span>
                            </div>  
                            <p id="salaryerror"></p><p id="centerror"></p>
                        </div>
                    </li>
                    <li>
                        <h3>Your Contact Information</h3>
                    </li>
                    <li>
                        <label for="Name">Name <span class="import">*</span></label>
                        <div class="d-flex">
                            <div class="flx-col">
                                <input size="8" type="text" id="fname" onblur="firstname()" class="fname" name="fname" >
                                <span>First</span>
                                <p id="fNameerror"></p>
                            </div>
                            <div class="flx-col">
                                <input size="14" type="text" id="lname" onblur="lastname()" class="lname" name="lname">
                                <span>Last</span>
                                <p id="lNameerror"></p>
                            </div>
                                
                        </div>
                    </li>
                    <li>
                        <label for="Email">Email Address <span class="import">*</span></label>
                        <div class="Portfolio">
                            <input name="Email" id="Email" onblur="mailval()" type="mail">
                            <p id="mailerror"></p>
                        </div>
                    </li>
                    <li>
                        <label>Phone <span class="import">*</span></label>
                        <div class="start-date d-flex">
                            <div class="flx-col">
                                <input size="4" name="fff" id="fff"  onblur="phfs(this)" type="text" minlength="3" maxlength="3">
                                <p id="error"></p>
                                <label>###</label>
                            </div><span>-</span>
                            <div class="flx-col">
                                <input size="4" name="sss" id="sss" onblur="phfs(this)" type="text" minlength="3" maxlength="3">
                                <p id="error"></p>
                                <label>###</label>
                            </div><span>-</span>
                            <div class="flx-col">
                                <input size="5" name="tttt" id="tttt" type="text" onblur="phfs(this)" patten="" minlength="4" maxlength="4">
                                <p id="error"></p>
                                <label>####</label>
                            </div> 
                        </div>
                        <p id="perror"><p>
                    </li>
                    <li>
                        <p id="imperror"></p>
                        <button type="submit" name="submit" id="submit">Submit</button>
                    </li>
                </ul>
            </form>
            <cfif structKeyExists(form, "submit")>
                <cfinvoke component="Component/23_CFC_JS" method="dbinput" >
                <!---Position--->
                    <cfinvokeargument name="position" value="#form.position#">
                <!---Willing--->
                    <cfif structKeyExists(form, "reselect")>
                        <cfset selectedValue = form.reselect>

                        <cfif selectedValue eq "yes">
                            <cfinvokeargument name="willing" value="Yes">
                        <cfelseif selectedValue eq "no">
                            <cfinvokeargument name="willing" value="No">
                        <cfelse>
                            <cfinvokeargument name="willing" value="Yes">
                        </cfif>
                    </cfif>
                <!---Starting date--->
                    <cfset startdate = createDate(form.yyyy, form.mm, form.dd)>
                    <cfinvokeargument name="Sdate" value="#startdate#">
                <!---Portfolio--->
                    <cfif len(#form.Portfolio#) gt 7>
                        <cfinvokeargument name="Portfolio" value="#form.Portfolio#">
                    <cfelse>
                        <cfinvokeargument name="Portfolio" value="">
                    </cfif>
                <!---Attach--->
                    <cfif len(#form.Attach#) gt 0>
                        <cfinvokeargument name="Attachment" value="#form.Attach#"> 
                    <cfelse>
                        <cfinvokeargument name="Attachment" value="">
                    </cfif>
                <!---Dollars--->
                    <cfset combinedValue = #form.Dollars# & "." & #form.Cents#>
                    <cfinvokeargument name="cash" value="#combinedValue#">
                <!---Fullname--->
                    <cfset fullname = #form.fname# & " " & #form.lname#>
                    <cfinvokeargument name="fullname" value="#fullname#">
                <!---Email--->
                    <cfinvokeargument name="Emailid" value="#form.Email#">
                <!---Phone--->
                    <cfset phnum = form.fff & form.sss & form.tttt>
                    <cfinvokeargument name="phnum" value="#phnum#">
                </cfinvoke>
            </cfif>
        </div>
    </div>  
</body>
</html>