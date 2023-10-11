<cfcomponent>
    <cffunction name="methodkeyandvalue" access="public">
        <cfargument name="key">
        <cfargument name="value">
                <cfset session.struct5["#arguments.key#"] = "#arguments.value#">	

                <cfset keysArray = []>

<!-- Extract keys from the structure and store them in an array -->
<cfloop collection="#session.struct5#" item="key">
    <cfset arrayAppend(keysArray, key)>
    
</cfloop>
<!-- Sort the array of keys -->
<cfset arraySort(keysArray, "textnocase", "asc")>

<!-- Create a new structure with sorted keys -->
<cfset sortedStruct = {}>
<cfloop array="#keysArray#" index="key">
    <cfset sortedStruct[key] = session.struct5[key]>
</cfloop>

<!-- Now, sortedStruct contains the structure with keys sorted -->
<cfdump var="#sortedStruct#">

		<cfreturn session.struct5>
    </cffunction>
</cfcomponent>