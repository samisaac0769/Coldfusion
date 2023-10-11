<cfcomponent>
    <cffunction name="methodkeyandvalue" access="public">
        <cfargument name="key">
        <cfargument name="value">
                <cfif StructKeyExists(session.struct4, #arguments.key#) AND session.struct4[#arguments.key#] NEQ #arguments.value#>
                    <cfset result[#arguments.key#]="This key is already exist">
                <cfelseif StructKeyExists(session.struct4, #arguments.key#)>
                    <cfset result[#arguments.key#]="This key value pair already exist">
                <cfelse>
                    <cfset Values=structInsert(session.struct4 ,"#arguments.key#", "#arguments.value#")>
                    <cfset local.result="#session.struct4#">
                </cfif>
                <cfreturn result>
    </cffunction>
</cfcomponent>