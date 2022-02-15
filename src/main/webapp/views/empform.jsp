<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Empform</title>
</head>
<style>
    .container {
        font-family: arial;
        font-size: 32px;
        margin: 25px;
        /* Center vertically and horizontally */
        display: flex;
        justify-content: center;
        align-items: center;
    }
    
    .child {
        height: 300px;
        width: 250px;
        outline: dashed 1px black;
        text-align: center;
        padding: 10px;
    }
    
    .text {
        text-align: center;
    }
    
    input {
        padding: 10px;
        font-family: sans-serif;
        font-size: bold;
    }
    
    button {
        padding: 5px;
        font-size: bold;
        background-color: gray;
        border-radius: 20px;
        cursor: pointer;
    }
</style>

<body>
    <h1 class="text">Enter Employee Data</h1>
    <div class="container">
        <div class="child">
            <form action="/save" method="POST">
                <input type="number" placeholder="Enter ID" name="id" required /><br />
                <input type="text" placeholder="Enter your name" name="name" required /><br />
                <input type="number" placeholder="Enter your salary" name="salary" required /><br />
                <input type="" placeholder="Enter your Designation" name="designation" required /><br /><br />
                <button type="submit" style="cursor: pointer">Add Employee</button>
            </form>
        </div>
    </div>
    <h3 class="text"><a href="/viewemp">View Employee</a></h3>
</body>

</html>