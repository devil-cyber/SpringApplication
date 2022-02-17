<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Edit Data</title>
    </head>
    <style>
        @import url("https://fonts.googleapis.com/css?family=Yanone+Kaffeesatz");
        * {
            box-sizing: border-box;
            margin: 0;
        }
        
        html,
        body {
            margin: 0 auto;
            min-height: 100%;
            font-family: "Yanone Kaffeesatz", Consolas;
        }
        
        h1 {
            text-align: center;
            margin: 40px auto;
            padding: 10px;
            width: 260px;
            border: 3px dashed #3fc380;
            color: #34495e;
            letter-spacing: 1px;
            word-spacing: 3px;
            font-size: 26px;
            font-weight: 400;
        }
        
        .details {
            margin: 0 auto;
            font-size: 18px;
            font-weight: 300;
            width: 200px;
            padding: 2px 5px;
            letter-spacing: 1px;
            position: relative;
            right: 30px;
            bottom: 30px;
            color: #6c7a89;
        }
        
        form {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }
        
        .col {
            width: 400px;
            min-width: 300px;
            text-align: center;
        }
        
        form .minput {
            position: relative;
            margin: 26px 10px;
            width: 90%;
            max-width: 400px;
        }
        
        .minput input {
            font-size: 20px;
            padding: 1px 4px;
            display: block;
            width: 100%;
            border: none;
            font-family: "Yanone Kaffeesatz", sans-serif;
            letter-spacing: 1px;
            color: #3e4651;
            -webkit-border-radius: 2px 0 0 2px;
            -moz-border-radius: 2px 0 0 2px;
            border-radius: 2px 0 0 2px;
            border-bottom: 1px solid #dadada;
        }
        /* .minput input[type="number"] {
        width: 60px;
        padding-right: 0;
    }
    
    input[type="number"]~.bar {
        width: 60px;
    }
    
    input[type="number"]~label {
        margin: 0;
    } */
        
        .minput input:focus {
            outline: none;
        }
        
        .minput label {
            color: #afafaf;
            font-size: 20px;
            font-weight: normal;
            position: absolute;
            pointer-events: none;
            left: 5px;
            top: -2px;
            transition: 0.2s ease all;
            -moz-transition: 0.2s ease all;
            -webkit-transition: 0.2s ease all;
        }
        
        textarea:focus~label,
        textarea:valid~label,
        input:focus~label,
        input:valid~label,
        .up~label {
            top: -19px;
            font-size: 18px;
        }
        
        .bar {
            position: relative;
            display: block;
            width: 100%;
        }
        
        .bar:before,
        .bar:after {
            content: "";
            height: 2px;
            width: 0;
            bottom: 0;
            background-color: #afafaf;
            position: absolute;
            transition: 0.2s ease all;
            -moz-transition: 0.2s ease all;
            -webkit-transition: 0.2s ease all;
        }
        
        .bar:before {
            left: 50%;
        }
        
        .bar:after {
            right: 50%;
        }
        
        input:focus~.bar:before,
        input:focus~.bar:after {
            width: 50%;
        }
        
        input[type="submit"] {
            cursor: pointer;
            background-color: #1abc9c;
            color: white;
            border-radius: 3px;
            border: none;
            max-width: 125px;
        }
        
        input:disabled {
            background: #3b7e87;
            cursor: not-allowed;
        }
        /* Button radio/checkbox/select */
        
        .control {
            display: block;
            position: relative;
            padding-left: 30px;
            margin-bottom: 10px;
            cursor: pointer;
            font-size: 20px;
            color: #afafaf;
            margin: 6px 10px;
        }
        
        .sex {
            margin: 26px 10px;
            font-size: 20px;
            color: #afafaf;
            top: -7px;
        }
        
        .control input {
            position: absolute;
            z-index: -1;
            opacity: 0;
        }
        
        label.control--radio {
            width: 80px;
        }
        
        .control__indicator {
            position: absolute;
            top: -2px;
            left: 0;
            height: 20px;
            width: 20px;
            background: #afafaf;
        }
        
        .control--radio .control__indicator {
            border-radius: 50%;
        }
        
        .control:hover input~.control__indicator,
        .control input:focus~.control__indicator {
            background: #ccc;
        }
        
        .control input:checked~.control__indicator {
            background: #66cc99;
        }
        
        .control:hover input:not([disabled]):checked~.control__indicator,
        .control input:checked:focus~.control__indicator {
            background: #66cc99;
        }
        
        .control input:disabled~.control__indicator {
            background: #e6e6e6;
            opacity: 0.6;
            pointer-events: none;
        }
        
        .control__indicator:after {
            content: "";
            position: absolute;
            display: none;
        }
        
        .control input:checked~.control__indicator:after {
            display: block;
        }
        
        .control--checkbox .control__indicator:after {
            left: 8px;
            top: 4px;
            width: 3px;
            height: 8px;
            border: solid #fff;
            border-width: 0 2px 2px 0;
            transform: rotate(45deg);
        }
        
        .control--checkbox input:disabled~.control__indicator:after {
            border-color: #7b7b7b;
        }
        
        .control--radio .control__indicator:after {
            left: 7px;
            top: 7px;
            height: 6px;
            width: 6px;
            border-radius: 50%;
            background: #fff;
        }
        
        .control--radio input:disabled~.control__indicator:after {
            background: #7b7b7b;
        }
        
        .select {
            position: relative;
            display: inline-block;
            margin-bottom: 0;
            width: 160px;
        }
        
        .select select {
            display: inline-block;
            width: 160px;
            cursor: pointer;
            padding: 10px;
            outline: 0;
            border: 0;
            border-bottom: 1px solid #afafaf;
            border-radius: 5px 5px 0 0;
            background: #fff;
            color: #afafaf;
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            font-family: "Yanone Kaffeesatz", sans-serif;
            font-size: 22px;
        }
        
        .select option {
            font-family: Consolas, "monospace";
            font-size: 18px;
        }
        
        .select select::-ms-expand {
            display: none;
        }
        
        .select select:disabled {
            opacity: 0.5;
            pointer-events: none;
        }
        
        .select__arrow {
            position: absolute;
            top: 17px;
            right: 14px;
            width: 0;
            height: 0;
            pointer-events: none;
            border-style: solid;
            border-width: 8px 5px 0 5px;
            border-color: #7b7b7b transparent transparent transparent;
        }
        
        .select select:disabled~.select__arrow {
            border-top-color: #ccc;
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
                            <li class="menu-item"><a href="/empform" class="menu-link">Add Employee</a></li>
                            <li class="menu-item"><a href="/viewemp" class="menu-link">View Empplyee</a></li>

                        </ul>
                    </div>
                </section>
            </div>
        </nav>
        <h1>Update Employee Data</h1>
        <form method="POST" action="/update">
            <c:forEach items="${list}" var="emp">
                <div class="col">
                    <div class="minput">
                        <input type="number" id="fname" dir="auto" name="id" value="${emp.id}" readonly="readonly" required />
                        <span class="bar"></span>
                        <!-- <label>Id</label> -->
                    </div>
                    <div class="minput">
                        <input type="text" id="fname" dir="auto" name="name" value="${emp.name}" required />
                        <span class="bar"></span>
                        <label>Name</label>
                    </div>
                    <div class="minput">
                        <input type="number" id="age" dir="auto" name="age" value="${emp.age}" required />
                        <span class="bar"></span>
                        <label>Age</label>
                    </div>
                    <div class="minput">
                        <input type="number" id="fname" dir="auto" name="salary" value="${emp.salary}" required />
                        <span class="bar"></span>
                        <label>Salary</label>
                    </div>
                    <div class="minput">
                        <input type="text" id="fname" dir="auto" name="department" value="${emp.department}" required />
                        <span class="bar"></span>
                        <label>Department</label>
                    </div>
                    <div class="minput">
                        <input type="text" id="fname" dir="auto" name="designation" value="${emp.designation}" required />
                        <span class="bar"></span>
                        <label>Designation</label>
                    </div>
                    <div>
                        <input type="submit" id="send" value="Update" style="padding: 10px; padding-top: 8px;" />
                    </div>
                </div>

                </div>
            </c:forEach>
        </form>
        <script>
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