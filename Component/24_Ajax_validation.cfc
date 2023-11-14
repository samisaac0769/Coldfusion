<cfcomponent>
    <cffunction name="api" access="remote" returntype="string" contenttype="text/plain">
        <cfargument name="myname" type="string" required="true">
        <cfargument name="mymail" type="string" required="true">

        <cfquery datasource="MyColdfusiontask" name="ajaxvalid"> 
            select count(*) as count from ajaxvalid where mail = <cfqueryparam value='#arguments.mymail#' cfsqltype="cf_sql_varchar">
        </cfquery>

        <cfset local.countrecord = ajaxvalid.count>
        <cfreturn local.countrecord >
    </cffunction>
    <cffunction name="subscription" access="remote" returntype="string" contenttype="text/plain">
        <cfargument name="myname" type="string" required="true">
        <cfargument name="mymail" type="string" required="true">

        <cfset local.result=0>

        <cfquery datasource="MyColdfusiontask" name="ajaxinsert" > 
            insert into ajaxvalid (name ,mail) values(
                <cfqueryparam value='#arguments.myname#' cfsqltype="cf_sql_varchar">,
                <cfqueryparam value='#arguments.mymail#' cfsqltype="cf_sql_varchar">
            );
            <cfset local.result=1>
        </cfquery>

        <cfreturn local.result>

    </cffunction>
</cfcomponent>
