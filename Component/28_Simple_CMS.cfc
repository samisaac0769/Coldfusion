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
        <cfquery datasource="MyColdfusiontask" name="qryUserData">
            select *from page
        </cfquery>
        <cfreturn qryUserData>
    </cffunction>

    <cffunction  name="logout">
        <cfset session.CMSvalidated = false>
        <cflocation  url="28_Simple_CMS.cfm">
    </cffunction>
    
    <cffunction  name="add" returntype="any" access="remote">
        <cfargument  name="namepage" type="string" required="true">
        <cfargument  name="discriptionpage" type="string" required="true">
        <cfset local.cleanedPagename = trim(arguments.namepage)>
        <cfset local.cleanedDiscription = trim(arguments.discriptionpage)>

        <cfset local.result = "false">
        <cfif len(local.cleanedPagename) gt 0 and len(local.cleanedDiscription) gt 0>
            <cfquery datasource="MyColdfusiontask" name="qryAdding">
                INSERT INTO page (pagename, pagediscription) VALUES
                (
                    <cfqueryparam value="#local.cleanedPagename#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#local.cleanedDiscription#" cfsqltype="cf_sql_varchar">
                )
            </cfquery>
            <cfset local.result = "true">
        </cfif>
        <cfreturn local.result>
    </cffunction>

    <cffunction  name="getPageById" access="remote" returnformat="json">
        <cfargument  name="pageId" type="numeric" required="true">
        <cfquery datasource="MyColdfusiontask" name="qryGetPage"> 
            select pagename, pagediscription from page where pageid = <cfqueryparam value="#arguments.pageId#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn serializeJSON(qryGetPage)>
    </cffunction>

    <cffunction  name="update" access="remote" returntype="boolean">
        <cfargument  name="pageId" type="numeric" required="true">
        <cfargument  name="pagename" type="string" required="true">
        <cfargument  name="pagedescription" type="string" required="true">

        <cfquery name="qryForUpdate" result="pageUpdate">
            UPDATE page SET pagename =<cfqueryparam value="#arguments.pagename#" cfsqltype="cf_sql_varchar">,
                pagediscription =<cfqueryparam value="#arguments.pagedescription#" cfsqltype="cf_sql_varchar"> 
                WHERE pageid = <cfqueryparam value="#arguments.pageId#" cfsqltype="cf_sql_integer">
        </cfquery>

        <cfif pageUpdate.recordcount>
            <cfreturn 1>
        <cfelse>
            <cfreturn 0>
        </cfif>
        
    </cffunction>

    <cffunction  name="delete" access="remote" returntype="boolean" >
        <cfargument  name="pageId" type="numeric" required="true">
        <cfquery name="qryDelete" result="pageDelete">
            DELETE FROM page WHERE pageid = <cfqueryparam value="#arguments.pageId#" cfsqltype="cf_sql_integer">
        </cfquery>

        <cfif pageDelete.recordcount>
            <cfreturn 1>
        <cfelse>
            <cfreturn 0>
        </cfif>
    </cffunction>
    
</cfcomponent>