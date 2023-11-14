<cfcomponent>
    <cffunction name="fileUpload" access="public" returntype="any">
        <cfargument name="fileupload" required="true" type="string">
        <cfset local.path = ExpandPath("/Coldfusion/uploadfile")>

        <cffile action="upload" filefield="#arguments.fileupload#" destination="#local.path#" nameconflict="overwrite">

        <cfset local.file = cffile.clientFile>
        <cffile action = "read" file = "#local.path#/#local.file#" variable = "inputext">

        <cfset specialCharsPattern = "[^a-zA-Z0-9 ]">
        <cfset local.correctword = rereplace(inputext, specialCharsPattern, "", "all")>
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
</cfcomponent>





