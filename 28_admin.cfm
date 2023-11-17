
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Welcome</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">    
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link href="css/28.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="js/28_user.js"></script>
    </head>
    <body>

        
       <!--- <cfset session.CMSvalidated =false>--->
        <cfparam name="session.CMSvalidated" default="false">

        <cfif session.CMSvalidated>
            <cfset local.comp=createObject("Component","Component/28_Simple_CMS")>
            <form action="28_admin.cfm" method="post">
            <input class="logout" type="submit" name="logout" value="Output" >
            </form>

            <cfif structKeyExists(form, "logout" )>
                <cfset local.data= local.comp.logout()>
            </cfif>
            <div class="container">
                <div class="admin-list">
                    <div class="add-page">
                        <button  class="view" type="button" id="add" name="viewdis" data-toggle="modal" data-target="#myModal">Add Page</button>
                        <div class="modal fade" id="myModal" role="dialog" data-backdrop="static">
                            <div class="modal-dialog text-center">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" >&times;</button>
                                        <h4 class="modal-title" id="addtitle"></h4>
                                    </div>
                                    <form action="28_admin.cfm" method="post" onsubmit="return validateForm()">
                                        <div>
                                            <label for="pagename">Name</label>
                                            <input name="pagename" id="pagename" placeholder="Enter the page name">
                                        </div>
                                        <div>
                                            <label for="discription">Discription</label><br>
                                            <textarea rows="5" cols="60"  name="discription" id="discription" placeholder="Enter the page discription"></textarea>
                                        </div>
                                        <div>
                                            <button id="formsubmit" name="submit1" type="submit">Submit</button>
                                            <p class="error" id="error"></p>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>     
                    </div> 
                    <div class="page-list">
                        
                        <cfset local.data = local.comp.userdata()>

                        <div class="container">
                            <cfoutput>
                                <table class="admin-table">
                                    <tr>
                                        <th>Page</th>
                                        <th>Page Name</td>
                                    </tr>
                                    <cfloop query = #local.data#>
                                        <tr>
                                            <td id="pageid">#local.data.pageid#</td>
                                            <td>#local.data.pagename#</td>
                                            <td>
                                                <button title="View" data-pageviewid="#data.pageid#" class="edit-btn view" ><i class="fa fa-eye" aria-hidden="true"></i></button>
                                                <button title="Edit" data-page="#data.pageid#" class="edit-btn edit" ><i class="fa fa-pencil"></i></button>
                                                <button title="Delete" data-pageid="#data.pageid#" class="delete-btn delete"><i class="fa fa-trash"></i></button>
                                            </td>
                                        </tr>
                                    </cfloop>
                                </table>
                            </cfoutput>
                        </div>
                        <div class="modal fade" id="deletePage" role="dialog">
                            <div class="modal-dialog">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h3 id="title" class="modal-title title"></h3>
                                    </div>
                                    <div class="modal-body">
                                        <h4 id="delete-page"></h4>
                                        <p id="delete-discription"></p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-info" data-dismiss="modal">Cancel</button>
                                        <button type="submit" id="delete" class="btn btn-danger" >Delete</button>
                                    </div>
                                </div>
                            </div>
                        </div> 
                    </div> 
                </div>
            </div>
        <cfelse>
            <cflocation url="28_Simple_CMS.cfm" addtoken="false">
        </cfif>

   
    </body>
</html>