<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Empform</title>
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
</style>

<body>
    <h1>Employee Registration Form</h1>
    <form method="POST" action="/save">
        <div class="col">
            <div class="minput">
                <input type="number" id="fname" dir="auto" name="id" required />
                <span class="bar"></span>
                <label>Id</label>
            </div>
            <div class="minput">
                <input type="text" id="fname" dir="auto" name="name" required />
                <span class="bar"></span>
                <label>Name</label>
            </div>
            <div class="minput">
                <input type="number" id="age" dir="auto" name="age" required />
                <span class="bar"></span>
                <label>Age</label>
            </div>
            <div class="minput">
                <input type="number" id="fname" dir="auto" name="salary" required />
                <span class="bar"></span>
                <label>Salary</label>
            </div>
            <div class="minput">
                <input type="text" id="fname" dir="auto" name="department" required />
                <span class="bar"></span>
                <label>Department</label>
            </div>
            <div class="minput">
                <input type="text" id="fname" dir="auto" name="designation" required />
                <span class="bar"></span>
                <label>Designation</label>
            </div>
            <div>
                <input type="submit" id="send" value="Submit" style="padding: 10px; padding-top: 8px;" />
            </div>
            <div style="margin-top: 15px; padding: 5px;">
                <span class="text"><a href="/viewemp">View Employee</a></span>&nbsp;
                <span class="text"><a href="/">Home</a></span>
            </div>
        </div>

        </div>
    </form>
</body>

</html>