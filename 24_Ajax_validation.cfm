<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>24</title>
    <link rel="stylesheet" href="css/24.css"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
   <!---<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>---> 
    <script src="js/24.js"></script>
</head>
<body>
    <center>
        <h3 style="color:red;">Create a subscribe form with first name, Email id text boxes.Near email id text box, check button should be there.
            Below these text boxes submit button should be there. By default submit button should be disabled. 
            While clicking that, check mail id in Database using Ajax. If user entered mail id there, then give error message
            like "Mail id is already there". If not, enable submit button.
            While click on the submit button it will insert first name & email id in to database.
        </h3>
        <div>
            <form>
                <div>
                    <label for="myname">Name</label>
                    <input id="myname" placeholder="Enter your name" type="text">
                </div>
                <div>
                    <label for="mymail">Email</label>
                    <input id="mymail" placeholder="Enter your mail id" type="text">
                    <input type="checkbox" id="checkbox" >
                </div>
                <p id="error"></p>
                <button type="button" id="submitbtn">Submit</button>
                <p class="success"></p>
            </form>
        </div>
        
    </center>
</body>
</html>