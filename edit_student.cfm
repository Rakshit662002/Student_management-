<cfset objDB = createObject("component", "db")>

<!--- Ensure ID is Provided and is a Number --->
<cfif NOT structKeyExists(url, "id") OR NOT isNumeric(url.id)>
    <cfoutput>
        <p style="color:red;">Error: Invalid or missing student ID.</p>
    </cfoutput>
    <cfabort>
</cfif>

<!--- Fetch Student Details --->
<cfquery name="student" datasource="student_management">
    SELECT id, name, email, age FROM students 
    WHERE id = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer">
</cfquery>=

<!--- Check If Student Exists --->
<cfif student.recordCount EQ 0>
    <cfoutput>
        <p style="color:red;">Error: No student found with ID #url.id#.</p>
    </cfoutput>
    <cfabort>
</cfif>

<!--- Debugging Information --->
<cfoutput>
    <p>Debug: URL ID = #url.id#</p>
    <p>Debug: Student Record Count = #student.recordCount#</p>
    <p>Debug: Student ID from DB = #student.id#</p>
</cfoutput>

<!--- Handle Form Submission --->
<cfif structKeyExists(form, "update")>
    <!--- Debug Form Data --->
    <cfoutput>
        <p>Debug: Form ID = #form.id#</p>
        <p>Debug: Form Name = #form.name#</p>
        <p>Debug: Form Email = #form.email#</p>
        <p>Debug: Form Age = #form.age#</p>
    </cfoutput>

    <!--- Ensure ID Exists in Form and is Valid --->
    <cfif NOT structKeyExists(form, "id") OR NOT isNumeric(form.id)>
        <cfoutput>
            <p style="color:red;">Error: Form ID is invalid or missing.</p>
        </cfoutput>
        <cfabort>
    </cfif>

    <!--- Update Student Data --->
    <cfquery datasource="student_management">
        UPDATE students SET
            name = <cfqueryparam value="#form.name#" cfsqltype="cf_sql_varchar">,
            email = <cfqueryparam value="#form.email#" cfsqltype="cf_sql_varchar">,
            age = <cfqueryparam value="#form.age#" cfsqltype="cf_sql_integer">
        WHERE id = <cfqueryparam value="#form.id#" cfsqltype="cf_sql_integer">
    </cfquery>

    <!--- Redirect to Home Page --->
    <cflocation url="index.cfm">
</cfif>

<!--- HTML Form for Editing Student --->
<html>
<head>
    <title>Edit Student</title>
</head>
<body>
    <h2>Edit Student</h2>
    <form method="post" action="edit_student.cfm?id=#url.id#">
        <input type="hidden" name="id" value="<cfoutput>#student.id#</cfoutput>">
        Name: <input type="text" name="name" value="<cfoutput>#student.name#</cfoutput>" required><br>
        Email: <input type="email" name="email" value="<cfoutput>#student.email#</cfoutput>" required><br>
        Age: <input type="number" name="age" value="<cfoutput>#student.age#</cfoutput>" required><br>
        <input type="submit" name="update" value="Update Student">
    </form>
</body>
</html>
