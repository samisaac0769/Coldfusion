<cfcomponent>
    <cffunction  name="init" access="public">
        <cfargument  name="imgname">
        <cfargument  name="discription">
        <cfargument  name="imageN">

        <cfquery datasource="MyColdfusiontask" name="list">
            insert into imglist (imgname , discreption, imgpath) values('#arguments.imgname#', '#arguments.discription#', '#arguments.imageN#');
        </cfquery>
    </cffunction>

    <cffunction  name="thumpnail">
        <cfquery datasource="MyColdfusiontask" name="thumpnail">
            select *from imglist;
        </cfquery>
        <cfreturn thumpnail>
    </cffunction>

    <cffunction  name="displayDetails">
        <cfargument  name="id">
        <cfquery datasource="MyColdfusiontask" name="singleimg">
            select *from imglist where id = '#arguments.id#';
        </cfquery>
        <cfreturn singleimg>
    </cffunction>
</cfcomponent>