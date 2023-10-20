<cfcomponent>
    <cffunction name="search" access="public">
        <cfargument name="searchstring">
        <cfset local.string = "the quick brown fox jumps over the lazy dog">
        <cfset myArrayList = ListToArray(local.string, ' ' ,true,true)>
        <cfset local.count=0>

        <cfloop array="#myArrayList#" index="i">
            <cfif i eq arguments.searchstring>
                <cfset local.count = local.count + 1> 
            </cfif>
        </cfloop>
        <cfif local.count gt 0 >
            <cfset local.result = "Found the key word <span style='color:red'>" & local.count & "</span> times in the sentence">
        <cfelse>
            <cfset local.result = "The key word <b>" & arguments.searchstring & "</b> NOT found. Try again">
        </cfif>

        <cfreturn local.result>
    </cffunction>
</cfcomponent>