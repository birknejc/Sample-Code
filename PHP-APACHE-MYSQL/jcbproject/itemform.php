<!DOCTYPE html>
<html>
<head>
    <title>Item Form</title>
    <style>
        /* CSS styling */
        /* ... (existing CSS styles) ... */
    </style>
</head>
<body>
    <?php
    $name = $issue = ""; // Initialize variables
    $nameErr = $issueErr = ""; // Initialize error variables

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Validate form fields
        if (empty($_POST["name"])) {
            $nameErr = "Name is required";
        } else {
            $name = test_input($_POST["name"]);
        }

        if (empty($_POST["issue"])) {
            $issueErr = "Issue is required";
        } else {
            $issue = test_input($_POST["issue"]);
        }

        // If all fields are valid, insert data into the database
        if (empty($nameErr) && empty($issueErr)) {
            $host = "localhost";
            $user = "root";
            $password = "";
            $database = "jcbdatabase";

            // Create a new mysqli connection
            $DBConnect = new mysqli($host, $user, $password, $database);

            // Check for database connection errors
            if ($DBConnect->connect_error) {
                die("Connection failed: " . $DBConnect->connect_error);
            }

            // Prepare and execute the INSERT query
            $stmt = $DBConnect->prepare("INSERT INTO items (publisher, name, issue, grade, price) VALUES (?, ?, ?, ?, ?)");
            $stmt->bind_param("sssdd", $_POST["publisher"], $name, $issue, $_POST["grade"], $_POST["price"]);

            if ($stmt->execute()) {
                echo "<h2>Form Accepted!</h2>";
                echo "Publisher: " . $_POST["publisher"] . "<br>";
                echo "Name: " . $name . "<br>";
                echo "Issue: " . $issue . "<br>";
                echo "Grade: " . $_POST["grade"] . "<br>";
                echo "Price: $" . $_POST["price"] . "<br>";
            } else {
                echo "Error inserting data: " . $stmt->error;
            }

            // Close the database connection
            $DBConnect->close();
        }
    }

    // Function to sanitize form inputs
    function test_input($data) {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }
    ?>

    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
        <label>Publisher:</label>
        <input type="radio" id="marvel" name="publisher" value="Marvel">
        <label for="marvel">Marvel</label>
        <input type="radio" id="dc" name="publisher" value="DC">
        <label for="dc">DC</label>
        <br>
        <label for="name">Name:</label>
        <select id="name" name="name">
            <option value="">Select a name</option>
            <option value="The Amazing Spider-Man">The Amazing Spider-Man</option>
            <option value="The Spectacular Spider-Man">The Spectacular Spider-Man</option>
            <option value="Web of Spider-Man">Web of Spider-Man</option>
        </select>
        <span class="error"><?php echo $nameErr; ?></span>
        <br>
        <label for="issue">Issue:</label>
        <input type="text" id="issue" name="issue">
        <span class="error"><?php echo $issueErr; ?></span>
        <br>
        <label for="grade">Grade:</label>
        <input type="text" id="grade" name="grade">
        <br>
        <label for="price">Price:</label>
        <input type="text" id="price" name="price">
        <br>
        <input type="submit" value="Submit">
    </form>
</body>
</html>

