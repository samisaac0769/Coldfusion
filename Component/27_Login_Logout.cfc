<cfcomponent>
    <cffunction  name="login">
        <cfargument  name="username">
        <cfargument  name="password">
        <cfargument  name="token">
        <cfset errormsg ="">

        <cfif not len(trim(arguments.username)) and not len(trim(arguments.password))>
            <cfset errormsg = "All fields are is required">
            <cfreturn errormsg>
        <cfelseif not len(trim(arguments.username))>
            <cfset errormsg = "Username is required">
            <cfreturn errormsg>
        <cfelseif not len(trim(arguments.password))>
            <cfset errormsg = "password is required">
            <cfreturn errormsg>
        </cfif>
        
        <cfquery datasource="MyColdfusiontask" name="login">
        SELECT COUNT(*) as count FROM login WHERE username COLLATE SQL_Latin1_General_CP1_CS_AS = <cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar"> 
        AND password COLLATE SQL_Latin1_General_CP1_CS_AS = <cfqueryparam value="#arguments.password#" cfsqltype="cf_sql_varchar">;
        </cfquery>

        <cfif login.count eq 1>
            <cfset validate = CSRFverifyToken(arguments.token)>

            <cfif validate>
                <cfset session.validated = true>
                <cflocation url="27_Login_welcome.cfm" addtoken="false">
            <cfelse>
                <cfset session.validated = false>
                <cflocation url="27_Login_Logout.cfm" addtoken="false">
            </cfif>
        <cfelse>
            <cfset errormsg = "Username/Password is Wrong">
            <cfreturn errormsg>
        </cfif>

    </cffunction>
</cfcomponent>