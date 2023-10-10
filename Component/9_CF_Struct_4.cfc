<cfcomponent>
    <cffunction name="methodkeyandvalue" access="public">
        <cfargument name="key">
        <cfargument name="value">
                <cfif StructKeyExists(session.struct4, arguments.key) or session.struct4[arguments.key] EQ #arguments.value#>
                    <cfset result[#arguments.key#]="This key value pair already exist">
                <cfelse>
                    <cfset Values=structInsert(session.struct4 ,"#arguments.key#", "#arguments.value#")>
                    <cfset local.result="#session.struct4#">
                </cfif>
                <cfreturn result>
    </cffunction>
</cfcomponent>