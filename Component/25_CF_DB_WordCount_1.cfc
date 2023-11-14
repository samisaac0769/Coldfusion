<cfcomponent>
    <cffunction name="textareacount" access="public">
        <cfargument name="iptext" type="string">
        <cfset specialCharsPattern = "[^a-zA-Z0-9 ]">
        <cfset local.correctword = rereplace(arguments.iptext, specialCharsPattern, "", "all")>
        <cfset local.wordlist = listToArray(local.correctword, " ")>
        <cfset local.wordCount = {}>

        <cfquery datasource="MyColdfusiontask">
            delete from wordcount;
        </cfquery>
        <cfloop from="1" to="#arrayLen(local.wordlist)#" index="i">
            <cfset word = trim(local.wordlist[i])>
            <cfif len(word)>
                <cfif structKeyExists(local.wordCount, word)>
                    <cfset local.wordCount[word] = local.wordCount[word] + 1>
                <cfelse>
                    <cfset local.wordCount[word] = 1>
                </cfif>
            </cfif>
        </cfloop>
        <cfloop collection="#local.wordCount#" item="word">
            <cfif len(word) gt 2>
                <cfquery datasource="MyColdfusiontask" name="checkWord">
                    INSERT INTO wordcount (textwords) VALUES (
                        <cfqueryparam value="#word# #local.wordCount[word]#" cfsqltype="cf_sql_varchar">
                    );
                </cfquery>
            </cfif>
        </cfloop>   
        <cfreturn #local.wordCount#>
    </cffunction>

    <cffunction name="sotedtext" access="public">
        <cfquery datasource="MyColdfusiontask" name="sotedretrive">
            SELECT SUBSTRING(textwords , 1, CHARINDEX(' ', textwords ) - 1) AS first,
            SUBSTRING(textwords , CHARINDEX(' ', textwords ) + 1, LEN(textwords )) AS lastword 
            from wordcount
            ORDER BY (lastword) DESC,len(textwords) DESC,textwords ASC
        </cfquery>
        <cfset query = "#sotedretrive#"> 
        <cfreturn query>
        <cfabort>
    </cffunction>


</cfcomponent>

