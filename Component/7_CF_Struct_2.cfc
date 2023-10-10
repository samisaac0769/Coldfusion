<cfcomponent>
    <cffunction name="methodkeyandvalue" access="public">
		<cfargument name="key">
		<cfargument name="value">	

            <cfset Values = structInsert(session.struct2 ,"#arguments.key#", "#arguments.value#")>
            <cfset local.result = "#session.struct2#">
        
		<cfreturn result>
    </cffunction>
</cfcomponent>