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

        // If all fields are valid, display the information
        if (empty($nameErr) && empty($issueErr)) {
            echo "<h2>Form Accepted!</h2>";
            echo "Publisher: " . $_POST["publisher"] . "<br>";
            echo "Name: " . $name . "<br>";
            echo "Issue: " . $issue . "<br>";

            $products = array(
                array("Marvel", "The Amazing Spider-Man", 121, 7.5, 2.00),
                array("Marvel", "The Amazing Spider-Man", 122, 4.5, 1.00),
                array("Marvel", "The Amazing Spider-Man", 198, 8.5, 4.00),
                array("Marvel", "The Amazing Spider-Man", 212, 9.0, 2.00),
                array("Marvel", "The Amazing Spider-Man", 300, 9.6, 2143.00)
            );

            foreach ($products as $product) {
                if ($product[0] == $_POST["publisher"] && $product[1] == $name && $product[2] == $issue) {
                    echo "Grade: " . $product[3] . "<br>";
                    echo "Price: $" . $product[4] . "<br>";
                    break;
                }
            }
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
        <input type="submit" value="Submit">
    </form>
</body>
</html>