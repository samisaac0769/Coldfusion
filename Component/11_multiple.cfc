<cfcomponent>
    <cffunction name="mulitiply" access="public" returntype="numeric">
        <cfset result=1>
            <cfset values=arguments>
                <cfloop index="i" from="1" to="#values.count()#">
                    <cfset result *=values[i]>
                </cfloop>
                <cfreturn result>
    </cffunction>
</cfcomponent>