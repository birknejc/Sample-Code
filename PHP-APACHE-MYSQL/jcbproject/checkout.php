<?php
// checkout.php
require_once('Order.php'); // Include the Order class

session_start();

// Check if there is an order object in session storage
if (isset($_SESSION['order'])) {
    // Get the order object from session storage
    $order = $_SESSION['order'];

    // Database connection details
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

    // Prepare and execute the INSERT query to add the order to the database
    $stmt = $DBConnect->prepare("INSERT INTO order_info (item_id, quantity_ordered, cost, order_date) VALUES (?, ?, ?, ?)");

    // Get the order details from the Order object
    $itemDescription = $order->getItemDescription();
    $quantityOrdered = $order->getQuantityOrdered();
    $cost = $order->getCost();
    $orderDate = $order->getOrderDate();

    // Bind parameters to the prepared statement
    $stmt->bind_param("ssds", $itemDescription, $quantityOrdered, $cost, $orderDate);

    if ($stmt->execute()) {
        echo "<h2>Order Placed Successfully!</h2>";
        echo "Item Description: " . $itemDescription . "<br>";
        echo "Quantity Ordered: " . $quantityOrdered . "<br>";
        echo "Cost: " . $cost . "<br>";
        echo "Order Date: " . $orderDate . "<br>";

        // Clear the order object from session storage
        unset($_SESSION['order']);
    } else {
        echo "Error inserting data: " . $stmt->error;
    }

    // Close the database connection
    $DBConnect->close();
} else {
    echo "<h2>No Order Found</h2>";
    echo "Please go back and make an order.";
}
?>
