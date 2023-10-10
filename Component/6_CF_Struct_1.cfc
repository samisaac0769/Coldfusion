<cfcomponent>
    <cffunction name="matchkeyandvalue" access="public">
        <cfargument name="key">
        <cfargument name="value">
                 
        <cfset local.struct = StructNew()>

        <cfset local.struct["#arguments.key#"] = arguments.value>
        <cfreturn local.struct>  
    </cffunction>
</cfcomponent>