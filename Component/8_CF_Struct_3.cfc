<cfcomponent>
    <cffunction name="methodkeyandvalue" access="public">
		<cfargument name="key">
		<cfargument name="value">

        <cfset session.stack3["#arguments.key#"] = "#arguments.value#">	
		<cfreturn session.stack3>
    </cffunction>
</cfcomponent>