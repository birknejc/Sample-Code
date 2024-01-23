<!DOCTYPE html>
<html>
<head>
    <title>Orders Display</title>
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

    // Retrieve all rows from the order_info table along with the item description using a table join
    $query = "SELECT order_info.*, items.publisher, items.name, items.issue FROM order_info
              JOIN items ON order_info.item_id = items.item_id";
    $result = $DBConnect->query($query);

    // Close the database connection
    $DBConnect->close();
    ?>

    <h2>Order Information</h2>
    <?php
    if ($result->num_rows > 0) {
        echo "<table border='1'>
                <tr>
                    <th>Order ID</th>
                    <th>Item Description</th>
                    <th>Quantity Ordered</th>
                    <th>Cost</th>
                    <th>Order Date</th>
                </tr>";

        while ($row = $result->fetch_assoc()) {
            echo "<tr>";
            echo "<td>" . $row["order_id"] . "</td>";
            echo "<td>Publisher: " . $row["publisher"] . ", Name: " . $row["name"] . ", Issue: " . $row["issue"] . "</td>";
            echo "<td>" . $row["quantity_ordered"] . "</td>";
            echo "<td>$" . $row["cost"] . "</td>";
            echo "<td>" . $row["order_date"] . "</td>";
            // Display additional fields from the order_info table here as needed
            echo "</tr>";
        }

        echo "</table>";
    } else {
        echo "<p>No orders found.</p>";
    }
    ?>
</body>
</html>