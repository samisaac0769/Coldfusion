<cfcomponent>
    <cffunction name="sendmail" access="public">
        <cfargument name="fromail">
        <cfargument name="tomail">
        <cfargument name="subject">
        <cfargument name="message">
        <cfargument name="images" type="any">


        <cfset local.path = ExpandPath("/Coldfusion/assets")>
        <cffile action = "upload" destination =  "#local.path#" nameConflict = "MakeUnique">
        <cfset local.image = cffile.clientFile>

        <cfmail from="#arguments.fromail#" to="#arguments.tomail#" subject="Happy Birthday #arguments.subject#"
         mimeattach="#local.path#/#local.image#">#arguments.message#</cfmail>

         <cfreturn "Email sent successfully">
    </cffunction>
</cfcomponent>
