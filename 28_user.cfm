
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>user</title>
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link href="css/28.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>

        <cfparam name="session.CMSvalidated" default="false">

        <cfif session.CMSvalidated>
            <cfset comp = createObject("Component","Component/28_Simple_CMS")>
            <cfset local.data = comp.userdata()>
            <!---<a href="28_Simple_CMS.cfm">
                <button class="logout">LogOut</button>
            </a>--->
            <form action="28_user.cfm" method="post">
                <input class="logout" type="submit" name="logout" value="Logout">
            </form>
            <cfif structKeyExists(form, "logout")>
                <cfset local.data = comp.logout()>
            </cfif>
            <div class="container">
                <cfoutput>
                    <table class="centered-table">
                        <tr>
                            <th>Page</th>
                            <th>Page Name</td>
                            <th>View</th>
                        </tr>
                        <cfloop query = #local.data#>
                            <tr>
                                <td>#local.data.pageid#</td>
                                <td>#local.data.pagename#</td>
                                <td>
                                    <button class="view" type="button"  name="viewdis" data-toggle="modal" data-target="##myModal#data.pageid#">View</button>
                                    <div class="modal fade" id="myModal#data.pageid#" role="dialog">
                                        <div class="modal-dialog">
                                            <!-- Modal content-->
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                    <h4 class="modal-title">Page Discription</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <p>#data.pagediscription#</p>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </cfloop>
                    </table>
                </cfoutput>
            </div>
            
           
        <cfelse>
            <cflocation url="28_Simple_CMS.cfm" addtoken="false">
        </cfif>


   
    </body>
</html>