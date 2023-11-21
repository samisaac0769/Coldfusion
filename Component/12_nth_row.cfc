<cfcomponent>
    <cffunction  name="namelist">
        <cfquery datasource="MyColdfusiontask" name="namelist">
            SELECT * FROM namelist;
        </cfquery>
        <cfreturn namelist>
    </cffunction>

    <cffunction  name="nthrow">
        <cfargument  name="nthplace">
        <cfquery datasource="MyColdfusiontask" name="namelist1">
            SELECT * FROM namelist ORDER BY (SELECT NULL) OFFSET <cfqueryparam value="#arguments.nthplace#" cfsqltype="cf_sql_integer">-1 ROWS fetch next 1
            row only;
        </cfquery>
        <cfreturn namelist1>
    </cffunction>
</cfcomponent>