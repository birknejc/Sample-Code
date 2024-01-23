<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require_once('Order.php'); // Include the Order class

session_start(); // Start the session at the beginning

// Initialize variables and error messages
$orderId = $itemDescription = $quantityOrdered = $cost = $orderDate = "";
$nameErr = $quantityErr = $costErr = $orderDateErr = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Validate and sanitize form fields
    if (empty($_POST["itemDescription"])) {
        $nameErr = "Item description is required";
    } else {
        $itemDescription = test_input($_POST["itemDescription"]);
    }

    if (empty($_POST["quantityOrdered"])) {
        $quantityErr = "Quantity is required";
    } else {
        $quantityOrdered = test_input($_POST["quantityOrdered"]);
    }

    if (empty($_POST["cost"])) {
        $costErr = "Cost is required";
    } else {
        $cost = test_input($_POST["cost"]);
    }

    if (empty($_POST["orderDate"])) {
        $orderDateErr = "Order date is required";
    } else {
        $orderDate = test_input($_POST["orderDate"]);
    }

    // Perform additional validations if needed

    if (empty($nameErr) && empty($quantityErr) && empty($costErr) && empty($orderDateErr)) {
        // Perform validation on item availability in the items table
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

        // Prepare and execute the SELECT query to check item availability
        $stmt = $DBConnect->prepare("SELECT * FROM items WHERE name = ?");
        $stmt->bind_param("s", $itemDescription);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows === 0) {
            echo "Item not available in the items table.";
        } else {
            // Create an instance of the Order class
            $newOrder = new Order($orderId, $itemDescription, $quantityOrdered, $cost, $orderDate);

            // Store the Order object in session storage
            $_SESSION['order'] = $newOrder;

            echo "<h2>Order Placed!</h2>";
            echo "Item Description: " . $newOrder->getItemDescription() . "<br>";
            // ... (Display other order details)

            echo "<a href='checkout.php'>Proceed to Checkout</a>";
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

<!DOCTYPE html>
<html>
<head>
    <title>Make Order</title>
    <style>
        /* CSS styling */
        /* ... (existing CSS styles) ... */
    </style>
</head>
<body>
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
        <label for="itemDescription">Item Description:</label>
        <input type="text" id="itemDescription" name="itemDescription">
        <span class="error"><?php echo $nameErr; ?></span>
        <br>

        <label for="quantityOrdered">Quantity Ordered:</label>
        <input type="text" id="quantityOrdered" name="quantityOrdered">
        <span class="error"><?php echo $quantityErr; ?></span>
        <br>

        <label for="cost">Cost:</label>
        <input type="text" id="cost" name="cost">
        <span class="error"><?php echo $costErr; ?></span>
        <br>

        <label for="orderDate">Order Date:</label>
        <input type="text" id="orderDate" name="orderDate">
        <span class="error"><?php echo $orderDateErr; ?></span>
        <br>

        <input type="submit" value="Place Order">
    </form>
</body>
</html>
