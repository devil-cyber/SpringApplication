<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    <html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Employee</title>
    </head>
    <style>
        body {
            font-family: sans-serif;
            font-weight: bold;
            font-size: 32px;
        }
        
        .center {
            margin-left: auto;
            margin-right: auto;
        }
        
        .text {
            text-align: center;
        }
        
        table {
            border-collapse: collapse;
            border-spacing: 0;
            width: 100%;
            border: 1px solid #ddd;
        }
        
        th,
        td {
            text-align: left;
            padding: 8px;
        }
        
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        /* table,
        th,
        td {
            border-collapse: collapse;
            padding: 5px;
            border-spacing: 0;
            border: 1px solid #ddd;
        } */
        
        .container {
            /* overflow-y: scroll; */
            height: 500px;
            width: 700px;
            margin-left: auto;
            margin-right: auto;
        }
    </style>

    <body>
        <h1 class="text">View Employee</h1>
        <div class="container">
            <table class="center">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Age</th>
                    <th>Salary</th>
                    <th>Department</th>
                    <th>Designation</th>
                </tr>
                <c:forEach items="${list}" var="emp">
                    <tr>
                        <td>${emp.id}</td>
                        <td>${emp.name}</td>
                        <td>${emp.age}</td>
                        <td>&#8377; ${emp.salary}</td>
                        <td>${emp.department}</td>
                        <td>${emp.designation}</td>
                    </tr>
                </c:forEach>
            </table>
            <p class="text"><a href="/empform">Add More Employee</a></p>
            <p class="text"><a href="/">Home</a></p>
        </div>
    </body>

    </html>