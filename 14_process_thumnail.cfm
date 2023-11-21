<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>14 thumbnail</title>
        <link href="css/cf.css" rel="stylesheet">
  </head>
  <body>
    <cfset local.thumpnail = createObject("component", "Component/14_upload").thumpnail()>

    <cfif local.thumpnail.recordCount GT 0>
      <cfset local.id = local.thumpnail.id>
      <center>
          <table>
              <tr>

              <th>Image Name</th>
              <th>Image</th>
              </tr>
              <cfoutput query="local.thumpnail">
              <tr>
                  <td>#imgname#</td>
                  <td>
                      <form action="14_display.cfm" method="post"> 
                          <input type="hidden"name="id" value="#local.thumpnail.id#">
                          <button class="img-btn" action="" method="post"><img width="20" height="20" src="assets/#imgpath#" /></button>
                      </form>
                  </td>  
              </tr>
              </cfoutput>
          </table>
          <button type="button" ><a href="14_Upload_validation_and_Image_function.cfm">Back</a></button>
      </center>
    </cfif>
  </body>
</html>
