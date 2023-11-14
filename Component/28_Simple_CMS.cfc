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

        <cfquery datasource="MyColdfusiontask" name="getUserRole">
        SELECT role FROM simplecms WHERE username COLLATE SQL_Latin1_General_CP1_CS_AS = <cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar"> 
        AND password COLLATE SQL_Latin1_General_CP1_CS_AS = <cfqueryparam value="#arguments.password#" cfsqltype="cf_sql_varchar">;
        </cfquery>

        <cfif getUserRole.recordCount EQ 1>
            <cfset userRole = getUserRole.role>
            <cfset validate = CSRFverifyToken(arguments.token)>
            
            <cfset session.CMSvalidated = false>
            <cfif validate>
                <cfset session.CMSvalidated = true>
                <cfif userRole eq "admin">
                    <cflocation  url="28_admin.cfm" addtoken="false">
                <cfelse>
                    <cflocation  url="28_user.cfm" addtoken="false"> 
                </cfif>
            <cfelse>
                <cflocation url="28_Simple_CMS.cfm" addtoken="false">
            </cfif>
            
        <cfelse>
            <cfset errormsg = "Username/Password is Wrong">
            <cfreturn errormsg>
        </cfif>
    </cffunction>

    <cffunction  name="userdata">
        <cfquery datasource="MyColdfusiontask" name="userdata">
            select *from page
        </cfquery>
        <cfreturn userdata>
    </cffunction>

    <cffunction  name="logout">
        <cfset session.CMSvalidated = false>
        <cflocation  url="28_Simple_CMS.cfm">
    </cffunction>
    
    <cffunction  name="add" returntype="any" access="public">
        <cfargument  name="pagename">
        <cfargument  name="discription">
        <cfset cleanedPagename = trim(arguments.pagename)>
        <cfset cleanedDiscription = trim(arguments.discription)>
        <cfif len(cleanedPagename) gt 0 and len(cleanedDiscription) gt 0>
            <cfquery datasource="MyColdfusiontask" name="adding">
                INSERT INTO page (pagename, pagediscription) VALUES
                (
                    <cfqueryparam value="#cleanedPagename#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#cleanedDiscription#" cfsqltype="cf_sql_varchar">
                )
            </cfquery>
        </cfif>
        
        <cfif isDefined("adding")and adding.recordcount gt 0>
            <cfreturn true>      
        <cfelse>    
            <cfreturn false>
        </cfif>
    </cffunction>
</cfcomponent>