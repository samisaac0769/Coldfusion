<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>14 thumbnail</title>
        <link href="css/cf.css" rel="stylesheet">
  </head>
  <body>
    <cfquery datasource="MyColdfusiontask" name="thumpnail">
      select *from imglist;
    </cfquery>


    <cfif thumpnail.recordCount GT 0>
      <cfset local.id = thumpnail.id>
      <center>
          <table>
              <tr>

              <th>Image Name</th>
              <th>Image</th>
              </tr>
              <cfoutput query="thumpnail">
              <tr>
                  <td>#imgname#</td>
                  <td>
                      <form action="14_display.cfm" method="post"> 
                          <input type="hidden"name="id" value="#thumpnail.id#">
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
