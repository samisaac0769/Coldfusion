
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Welcome</title>
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link href="css/28.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="js/28_user.js"></script>
    </head>
    <body>

       <!--- <cfset session.CMSvalidated =false>--->
        <cfparam name="session.CMSvalidated" default="false">

        <cfif session.CMSvalidated eq false>
            <cfset comp=createObject("Component","Component/28_Simple_CMS")>
            <cfset data=comp.userdata()>
            
            <form action="28_user.cfm" method="post">
                <input class="logout" type="submit" name="logout">
            </form>
            <cfif structKeyExists(form, "logout" )>
                <cfset data=comp.logout()>
            </cfif>
            <div class="container">
                <div class="admin-list">
                    <div class="add-page">
                        <button class="view" type="button" id="add" name="viewdis" data-toggle="modal" data-target="#myModal">Add Page</button>
                        <div class="modal fade" id="myModal" role="dialog" data-backdrop="static">
                            <div class="modal-dialog text-center">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title" id="addtitle"></h4>
                                    </div>
                                    <form action="28_admin.cfm" method="post" onsubmit="return validateForm()">
                                        <div>
                                            <label for="pagename">Name</label>
                                            <input name="pagename" id="pagename" placeholder="Enter the page name">
                                        </div>
                                        <div>
                                            <label for="discription">Discription</label>
                                            <input name="discription" id="discription" placeholder="Enter the page discription">
                                        </div>
                                        <div>
                                            <button name="submit" type="submit">Submit</button>
                                            <p class="error" id="error"></p>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <cfif structKeyExists(form, "submit")>
                            <cfinvoke component="Component/28_Simple_CMS" method="add" returnvariable="added">
                                <cfinvokeargument name="pagename" value="#form.pagename#">
                                <cfinvokeargument name="discription" value="#form.discription#">
                            </cfinvoke>

                            <cfoutput>
                                <cfif added eq true>
                                    <script>
                                        console.log(added);
                                        alert("The page add Successfully...");
                                    </script>   
                                <cfelse>
                                    
                                </cfif>
                            </cfoutput>
                        </cfif>
                    </div>   
                </div>
            </div>
        <cfelse>
            <cflocation url="28_Simple_CMS.cfm" addtoken="false">
        </cfif>

   
    </body>
</html>