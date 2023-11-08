<cfcomponent>
    <cffunction name="cookieCount" access="public">
        <cfif !isDefined("cookie.VisitsCounter") >
            <cfset cookie.VisitsCounter = 1>
        <cfelse>
            <cfset cookie.VisitsCounter = cookie.VisitsCounter + 1>
        </cfif>
        <cfreturn cookie.VisitsCounter>
    </cffunction>
</cfcomponent>