<cfcomponent>
    <cffunction name="validationc" access="public">
        <cfargument name="ipmail">
        <cfargument name="gchaptcha">
        <cfargument name="ipchaptcha">

        <cfset local.error = "">

        <cfif len(ipmail) eq 0>
            <cfset local.error = "mailempty">
            <cfreturn local.error>

        <cfelseif len(ipchaptcha) eq 0>
            <cfset local.error = "captchaempty">
            <cfreturn local.error>

        <cfelseif reFind("^\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}\b$", arguments.ipmail) eq 0>
            <cfset local.error = "invalidmailid">
            <cfreturn local.error>

        <cfelse>
            <cfset local.captchaMatch = false>
            <cfloop from=1 to="#arrayLen(session.captcha)#" index="i">
                <cfif compare(session.captcha[i],#arguments.ipchaptcha#) eq 0>
                    <cfset local.captchaMatch = true>
                    <cfbreak>
                </cfif>
            </cfloop>
            <cfreturn local.captchaMatch>
        </cfif>  
    </cffunction>

    <cffunction name="generateRandomText" returntype="string" >
        <cfargument name="length" type="numeric" required="true">
        <cfset var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789">
        <cfset var randomText = "">
        
        <cfloop from="1" to="#arguments.length#" index="i">
            <cfset randomText &= mid(chars, randRange(1, len(chars)), 1)>
        </cfloop>

        <cfset arrayAppend(session.captcha,randomText)>

        <cfreturn randomText>
    </cffunction>
</cfcomponent>