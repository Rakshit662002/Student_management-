<cfset objDB = createObject("component", "db")>
<cfset students = objDB.getStudents()>

<html>
<head>
    <title>Student Management</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h2>Student Management System</h2>
    <a href="add_student.cfm">Add Student</a>
    
    <table border="1">
        <tr>
            <th>ID</th><th>Name</th><th>Email</th><th>Age</th><th>Actions</th>
        </tr>
        <cfoutput query="students">
            <tr>
                <td>#id#</td>
                <td>#name#</td>
                <td>#email#</td>
                <td>#age#</td>
                <td>
                    <a href="edit_student.cfm?id=#id#">Edit</a> |
                    <a href="delete_student.cfm?id=#id#">Delete</a>
                </td>
            </tr>
        </cfoutput>
    </table>
</body>
</html>
