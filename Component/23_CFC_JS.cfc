<cfcomponent>
    <cffunction name="dbinput">
        <cfquery datasource="MyColdfusiontask" name="formpost">
            insert into forminsert (fullname, mailid, phone, position, willing, startdate, Portfolio, resume, Salary) 
            values(
                <cfqueryparam value="#arguments.fullname#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.Emailid#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.phnum#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.position#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.willing#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.Sdate#" cfsqltype="CF_SQL_DATE">,
                <cfqueryparam value="#arguments.Portfolio#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.Attachment#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.cash#" cfsqltype="CF_SQL_VARCHAR">
                );
        </cfquery>
    </cffunction>
</cfcomponent>