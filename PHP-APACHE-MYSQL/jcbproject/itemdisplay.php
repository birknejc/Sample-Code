<!DOCTYPE html>
<html>
<head>
    <title>Item Display</title>
    <style>
        /* CSS styling */
        /* ... (existing CSS styles) ... */
    </style>
</head>
<body>
    <?php
    $host = "localhost";
    $user = "root";
    $password = "";
    $database = "jcbdatabase";

    // Create a connection to the database
    $DBConnect = new mysqli($host, $user, $password, $database);
    if ($DBConnect->connect_error) {
        die("Connection failed: " . $DBConnect->connect_error);
    }

    // Retrieve unique publisher names, names, and issues from the items table
    $query = "SELECT DISTINCT publisher, name, issue FROM items";
    $result = $DBConnect->query($query);

    // Store the unique publisher names, names, and issues in an array for generating the select list
    $items = array();
    while ($row = $result->fetch_assoc()) {
        $items[] = $row['publisher'] . " | Name: " . $row['name'] . " | Issue: " . $row['issue'];
    }

    // Close the database connection
    $DBConnect->close();

    $selectedItem = ""; // Initialize the selected item variable

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $selectedItem = $_POST["item"]; // Get the selected item from the form

        // Find the selected item in the items array
        $selectedItemInfo = null;
        foreach ($items as $key => $display_text) {
            if ($display_text == $selectedItem) {
                $selectedItemInfo = $key;
                break;
            }
        }

        // Display the information if the selected item is found
        if ($selectedItemInfo !== null) {
            $selectedPublisherNameIssue = explode(" | Name: ", $items[$selectedItemInfo]);
            $selectedPublisherIssue = explode(" | Issue: ", $selectedPublisherNameIssue[1]);
            $selectedPublisher = $selectedPublisherNameIssue[0];
            $selectedName = $selectedPublisherIssue[0];
            $selectedIssue = $selectedPublisherIssue[1];

            $DBConnect = new mysqli($host, $user, $password, $database);
            if ($DBConnect->connect_error) {
                die("Connection failed: " . $DBConnect->connect_error);
            }

            // Retrieve all occurrences that match the selected publisher, name, and issue from the items table
            $query = "SELECT * FROM items WHERE publisher='$selectedPublisher' AND name='$selectedName' AND issue='$selectedIssue'";
            $result = $DBConnect->query($query);

            // Close the database connection
            $DBConnect->close();

            if ($result->num_rows > 0) {
                echo "<h2>Item Information</h2>";
                while ($row = $result->fetch_assoc()) {
                    echo "Item ID: " . $row["item_id"] . "<br>";
                    echo "Publisher: " . $row["publisher"] . "<br>";
                    echo "Name: " . $row["name"] . "<br>";
                    echo "Issue: " . $row["issue"] . "<br>";
                    echo "Grade: " . $row["grade"] . "<br>";
                    echo "Price: $" . $row["price"] . "<br>";
                    // Display additional fields from the table here as needed
                    echo "<br>";
                }
            } else {
                echo "<h2>No Items Found</h2>";
            }
        }
    }
    ?>

    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
        <label for="item">Select an Item:</label>
        <select id="item" name="item">
            <option value="">Select an item</option>
            <?php
            // Generate the select list options from the items array
            foreach ($items as $display_text) {
                echo "<option value='" . $display_text . "'>";
                echo $display_text;
                echo "</option>";
            }
            ?>
        </select>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
