<cfcomponent>
    <cffunction name="changecolor" access="public">
        <cfargument name="values1">
        <cfset local.result = []>
        <cfset valuesArray = listToArray(arguments.values1, "")>

        <cfloop array="#valuesArray#" index="number">
            <cfif number % 2 eq 0>
                <cfset result.append('<span style="color:red">#number#</span>')>
            <cfelse>
                <cfset result.append('<span style="color:blue">#number#</span>')>
            </cfif>
        </cfloop>
        
        <cfreturn local.result>
    </cffunction>
</cfcomponent>