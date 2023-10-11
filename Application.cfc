<cfcomponent>    
    <cfset this.name = "Task"> 
    <cfset this.applicationTimeout = createTimeSpan(0, 0, 0, 60)> 
    <cfset this.sessionManagement = true> 
    <cfset this.sessionTimeout = createTimeSpan(0, 0, 1, 0)> 
    <cffunction name="onApplicationStart" returnType="void">

    </cffunction>

    <cffunction name="onSessionStart" returnType="boolean" output="false">
        <cfset session.struct2 = StructNew()>
        <cfset session.struct3 = StructNew()>
        <cfset session.struct4 = StructNew()>
        <cfset session.struct5 = StructNew()>

        <cfreturn true>
    </cffunction>    

    <cffunction name="onRequestStart" returnType="void">
    </cffunction>

    <cffunction name="onRequestEnd" returnType="void">  
    </cffunction>

    <cffunction name="onSessionEnd" returnType="void">
    </cffunction>

    <cffunction name="onApplicationEnd" returnType="void" > 
        <cfset StructClear(session.struct2)>
        <cfset StructClear(session.struct3)>
        <cfset StructClear(session.struct4)>
    </cffunction>
</cfcomponent>
