<cfquery datasource="student_management">
    DELETE FROM students WHERE id = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer">
</cfquery>
<cflocation url="index.cfm">
