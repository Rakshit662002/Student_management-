<cfif structKeyExists(form, "submit")>
    <cfset objDB = createObject("component", "db")>
    <cfset objDB.addStudent(form.name, form.email, form.age)>
    <cflocation url="index.cfm">
</cfif>

<html>
<head><title>Add Student</title></head>
<body>
    <h2>Add Student</h2>
    <form method="post">
        Name: <input type="text" name="name" required><br>
        Email: <input type="email" name="email" required><br>
        Age: <input type="number" name="age" required><br>
        <input type="submit" name="submit" value="Add Student">
    </form>
</body>
</html>
