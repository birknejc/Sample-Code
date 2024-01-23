<?php
// processForm.php
// Handles the form submission and inserts data into the database

$host = "localhost";
$user = "root";
$password = "";
$database = "comic_book_collection";

$DBConnect = @new mysqli($host, $user, $password, $database);

if ($DBConnect->connect_error) {
    die("The database server is not available at the moment. " .
        "Connect Error is " . $DBConnect->connect_errno .
        " " . $DBConnect->connect_error . ".");
} else {
    $series = $_POST["series"];
    $issueNumber = $_POST["issueNumber"];
    $purchasePrice = $_POST["purchasePrice"];
    $grade = $_POST["grade"];
    $publisher = $_POST["publisher"];

    // Assuming you have a table named 'comics'
    $insertQuery = "INSERT INTO comics (series, issue_number, purchase_price, grade, publisher) VALUES (?, ?, ?, ?, ?)";
    $stmt = $DBConnect->prepare($insertQuery);
    $stmt->bind_param("sdsds", $series, $issueNumber, $purchasePrice, $grade, $publisher);
    $stmt->execute();
    $stmt->close();

    echo "Data inserted successfully!";
}

$DBConnect->close();
?>
