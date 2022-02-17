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
        
         :root {
            --color-white: hsl(0, 0%, 100%);
            --color-light: hsl(206, 33%, 96%);
            --color-black: hsl(0, 0%, 7%);
            --color-night: hsl(214, 100%, 10%);
            --color-purple: hsl(291, 64%, 42%);
            --color-indigo: hsl(255, 100%, 60%);
            --shadow-small: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06);
            --shadow-medium: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            --shadow-large: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
        }
        
        html {
            font-size: 100%;
            box-sizing: border-box;
            scroll-behavior: smooth;
        }
        
        *,
        *::before,
        *::after {
            padding: 0;
            margin: 0;
            box-sizing: inherit;
            list-style: none;
            list-style-type: none;
            text-decoration: none;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
            text-rendering: optimizeLegibility;
        }
        
        body {
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            font-size: 1rem;
            font-weight: 400;
            line-height: 1.5;
            color: var(--color-black);
            background: var(--color-white);
        }
        
        a,
        button {
            font-family: inherit;
            font-size: inherit;
            line-height: inherit;
            cursor: pointer;
            border: none;
            outline: none;
            background: none;
            text-decoration: none;
        }
        
        img,
        video {
            display: block;
            max-width: 100%;
            height: auto;
            -o-object-fit: cover;
            object-fit: cover;
        }
        
        .container {
            max-width: 83rem;
            width: 100%;
            height: auto;
            margin: 0 auto;
            padding: 0 2rem;
        }
        
        .brand {
            font-family: inherit;
            font-size: 1.75rem;
            font-weight: 700;
            line-height: inherit;
            border: none;
            outline: none;
            color: var(--color-indigo);
            text-transform: uppercase;
            text-rendering: optimizeLegibility;
        }
        
        .navbar {
            max-width: 100%;
            height: auto;
            margin: 0 auto;
            padding: 0.75rem 0;
            border: none;
            outline: none;
            color: var(--color-black);
            background: var(--color-white);
            box-shadow: var(--shadow-large);
        }
        
        .navbar .wrapper {
            display: flex;
            flex-direction: row;
            flex-wrap: wrap;
            justify-content: space-between;
            align-items: center;
            width: 100%;
            height: auto;
            margin: 0 auto;
        }
        
        .navbar .burger {
            position: relative;
            display: none;
            cursor: pointer;
            width: 2rem;
            height: 1rem;
            border: none;
            outline: none;
            opacity: 0;
            visibility: hidden;
            background: none;
            transform: rotate(0deg);
            transition: 0.35s ease-in-out;
        }
        
        .navbar .burger-line {
            display: block;
            position: absolute;
            width: 100%;
            height: 2px;
            left: 0;
            border: none;
            outline: none;
            opacity: 1;
            border-radius: 0.25rem;
            background: var(--color-black);
            transform: rotate(0deg);
            transition: 0.25s ease-in-out;
        }
        
        .navbar .burger-line:nth-child(1) {
            top: 0;
        }
        
        .navbar .burger-line:nth-child(2),
        .navbar .burger-line:nth-child(3) {
            top: 0.5rem;
        }
        
        .navbar .burger-line:nth-child(4) {
            top: 1rem;
        }
        
        .navbar .burger.is-active .burger-line:nth-child(1),
        .navbar .burger.is-active .burger-line:nth-child(4) {
            top: 1.25rem;
            width: 0%;
            left: 50%;
        }
        
        .navbar .burger.is-active .burger-line:nth-child(2) {
            transform: rotate(45deg);
        }
        
        .navbar .burger.is-active .burger-line:nth-child(3) {
            transform: rotate(-45deg);
        }
        
        .navbar .menu-inner {
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
            gap: 2rem;
        }
        
        .navbar .menu-link {
            font-family: inherit;
            font-size: 1rem;
            font-weight: 600;
            line-height: inherit;
            border: none;
            color: var(--color-black);
            text-transform: uppercase;
            text-rendering: optimizeLegibility;
            transition: all 0.35s ease-in-out;
        }
        
        @media only screen and (max-width: 768px) {
            .navbar .burger {
                display: block;
                opacity: 1;
                visibility: visible;
            }
            .navbar .menu {
                width: 100%;
                max-height: 0rem;
                padding: 0;
                opacity: 0;
                visibility: hidden;
                overflow: hidden;
                transition: all 0.35s ease;
            }
            .navbar .menu.is-active {
                opacity: 1;
                visibility: visible;
            }
            .navbar .menu-inner {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: flex-start;
                gap: 0.75rem;
                padding: 1rem 0;
            }
        }
    </style>

    <body>
        <nav class="navbar">
            <div class="container">
                <section class="wrapper">
                    <a href="/" class="brand">Employee Record</a>
                    <button type="button" class="burger" id="burger">
            <span class="burger-line"></span>
            <span class="burger-line"></span>
            <span class="burger-line"></span>
            <span class="burger-line"></span>
          </button>
                    <div class="menu" id="menu">
                        <ul class="menu-inner">
                            <li class="menu-item"><a href="/" class="menu-link">Home</a></li>
                            <li class="menu-item">
                                <a href="/empform" class="menu-link">Add Employee</a>
                            </li>
                            <li class="menu-item">
                                <a href="/viewemp" class="menu-link">View Empplyee</a>
                            </li>
                        </ul>
                    </div>
                </section>
            </div>
        </nav>
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
            const burgerMenu = document.getElementById("burger");
            const navbarMenu = document.getElementById("menu");

            // Show and Hide Navbar Menu
            burgerMenu.addEventListener("click", () => {
                burgerMenu.classList.toggle("is-active");
                navbarMenu.classList.toggle("is-active");

                if (navbarMenu.classList.contains("is-active")) {
                    navbarMenu.style.maxHeight = navbarMenu.scrollHeight + "px";
                } else {
                    navbarMenu.removeAttribute("style");
                }
            });
        </script>
    </body>

    </html>