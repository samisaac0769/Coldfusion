<cfcomponent>
    <cffunction name="json" access="public">
        <cfset local.persondetails = [{"Name":"saravanan","Age":27,"LOCATION":"dubai"},{"Name":"Ram","Age":26,"LOCATION":"Kovilpatti"}] >
        <cfset local.myJsonVar = serializeJSON(local.persondetails)>

        <cfset local.table = "">

        <cfset jsonData = deserializeJSON(local.myJsonVar)>

        <cfset local.table &= "<table>
            <tr>
                <th>Name</th>
                <th>Age</th>
                <th>Location</th>
            </tr>">

        <cfloop from="1" to="#ArrayLen(jsonData)#" index="i">
            <cfset local.table &= '<tr>
                <td>#jsonData[i].Name#</td>
                <td>#jsonData[i].Age#</td>
                <td>#jsonData[i].LOCATION#</td>
            </tr>'>
        </cfloop>

        <cfset local.table &= "</table">

        <cfreturn local.table>
    </cffunction>
</cfcomponent>
