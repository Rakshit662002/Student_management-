<cfcomponent>
    <cfset this.dsn = "student_management"> <!-- Your Data Source Name -->

    <!-- Fetch Students -->
    <cffunction name="getStudents" access="public" returntype="query">
        <cfquery name="students" datasource="#this.dsn#">
            SELECT * FROM students ORDER BY id DESC;
        </cfquery>
        <cfreturn students>
    </cffunction>

    <!-- Add Student -->
    <cffunction name="addStudent" access="public">
        <cfargument name="name" required="yes">
        <cfargument name="email" required="yes">
        <cfargument name="age" required="yes">

        <cfquery datasource="#this.dsn#">
            INSERT INTO students (name, email, age) VALUES (
                <cfqueryparam value="#arguments.name#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.age#" cfsqltype="cf_sql_integer">
            );
        </cfquery>
    </cffunction>
</cfcomponent>
