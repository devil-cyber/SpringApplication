<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    <html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer"
        />
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
        
        .edit {
            cursor: pointer;
            color: black;
        }
        
        .delete {
            cursor: pointer;
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
                    <th>Action</th>
                </tr>
                <c:forEach items="${list}" var="emp">
                    <tr>
                        <td>${emp.id}</td>
                        <td>${emp.name}</td>
                        <td>${emp.age}</td>
                        <td>&#8377; ${emp.salary}</td>
                        <td>${emp.department}</td>
                        <td>${emp.designation}</td>
                        <td>
                            <a id="href" href="/editform/${emp.id}/secret${emp.designation}###${emp.salary}${emp.name}"><i class="fas fa-edit ${emp.id} edit"></i
              ></a> &nbsp;
                            <i class="fa-solid fa-trash-can ${emp.id} delete"></i>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <p class="text"><a href="/empform">Add More Employee</a></p>
            <p class="text"><a href="/">Home</a></p>
        </div>
        <script>
            const del = document.querySelectorAll(".delete");
            const edit = document.querySelectorAll(".edit");
            const a = document.getElementById("href");
            const xhttp = new XMLHttpRequest();
            const modalBtns = [...document.querySelectorAll(".button")];
            let closeBtns = [...document.querySelectorAll(".close")];

            function xhr(data, path, request_type) {
                xhttp.onreadystatechange = function() {
                    if (this.readyState == 4 && this.status == 200) {
                        // Typical action to be performed when the document is ready:
                        console.log(xhttp.responseText);
                        if (xhttp.responseText === "true") {
                            window.location.reload();
                        }
                    }
                };
                xhttp.open(request_type, "http://127.0.0.1:8000/" + path);
                xhttp.send(data);
            }
            del.forEach((del) => {
                del.addEventListener("click", (e) => {
                    let id = parseInt(del.classList[2]);
                    console.log(id);
                    xhr(id, "delete", "POST");
                });
            });
            edit.forEach((edit) => {
                edit.addEventListener("click", (e) => {
                    let id = parseInt(edit.classList[2]);
                    console.log(id);
                });
            });
        </script>
    </body>

    </html>