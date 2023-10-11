<cfcomponent>
    <cffunction name="at_what_age" access="public" returntype="struct">
		<cfargument name="momage" type="date">
        <cfargument name="sonage" type="date">
		<cfset var result={}>
        <cfset momcurrentage = DateDiff("yyyy", arguments.momage, now() )>
        <cfset soncurrentage = DateDiff("yyyy", arguments.sonage, now() )>
        <cfset momageatbirth = DateDiff("yyyy", arguments.momage, arguments.sonage)>
        <cfset momthisyeardob = CreateDate(year(now()), month(arguments.momage), day(arguments.momage))>
        <cfset sonthisyeardob = CreateDate(year(now()), month(arguments.sonage), day(arguments.sonage))>
        <cfset mombirthday =  momthisyeardob -  DateFormat(now(), 'yyyy-mm-dd')>
        <cfset sonbirthday =  sonthisyeardob - DateFormat(now(), 'yyyy-mm-dd')>



        <cfif arguments.momage lt arguments.sonage>
            <cfset var result.momAge="Age of the mom : <span style='color: ORANGE;'>#momcurrentage#</span>" >
            <cfset var result.sonAge="Age of the Son : <span style='color: ORANGE;'>#soncurrentage#</span>" >
            <cfif momageatbirth gt 20>
                <cfset var result.differ="Mom give birth at the age of : #momageatbirth#">
            <cfelse>
                <cfset var result.differ="Marriage age is <span style='color: red;'>Illegal</span>" >
            </cfif>
            
            <cfif momageatbirth gt 20>
            <cfif mombirthday lt 0 and sonbirthday lt 0>
                <cfset momthisyeardob = CreateDate(year(now()) + 1, month(arguments.momage), day(arguments.momage))>
                <cfset sonthisyeardob = CreateDate(year(now()) + 1, month(arguments.sonage), day(arguments.sonage))>
                <cfset mombirthday =  momthisyeardob -  DateFormat(now(), 'yyyy-mm-dd')>
                <cfset sonbirthday =  sonthisyeardob - DateFormat(now(), 'yyyy-mm-dd')>
                <cfset var result.MBD="Days remain for mom's birth day : <span style='color: green;'>#mombirthday#</span>" >
                <cfset var result.SBD="Days remain for son's birth day : <span style='color: green;'>#sonbirthday#</span>" >
            <cfelseif mombirthday lt 0>
                <cfset momthisyeardob = CreateDate(year(now()) +1, month(arguments.momage), day(arguments.momage))>
                <cfset mombirthday =  momthisyeardob -  DateFormat(now(), 'yyyy-mm-dd')>
                <cfset var result.MBD="Days remain for mom's birth day : <span style='color: green;'>#mombirthday#</span>" >
                <cfset var result.SBD="Days remain for son's birth day : <span style='color: green;'>#sonbirthday#</span>" >
            <cfelseif sonbirthday lt 0>
                <cfset sonthisyeardob = CreateDate(year(now())+1, month(arguments.sonage), day(arguments.sonage))>
                <cfset sonbirthday =  sonthisyeardob - DateFormat(now(), 'yyyy-mm-dd')>
                <cfset var result.MBD="Days remain for mom's birth day : <span style='color: green;'>#mombirthday#</span>" >
                <cfset var result.SBD="Days remain for son's birth day : <span style='color: green;'>#sonbirthday#</span>" >
            <cfelse>
                <cfset var result.MBD="Days remain for mom's birth day : <span style='color: green;'>#mombirthday#</span>" >
                <cfset var result.SBD="Days remain for son's birth day : <span style='color: green;'>#sonbirthday#</span>" >
            </cfif>
            </cfif>


        <cfelseif arguments.momage gt arguments.sonage>
            <cfset var result["sonAge"]="<span style='color: red;'>You Enter wrong DOB</span>" >
        </cfif>
        <cfreturn result>        
    </cffunction>
</cfcomponent>

