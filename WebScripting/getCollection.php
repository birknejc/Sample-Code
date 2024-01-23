<?php
// getCollection.php
// Fetches the comic book collection from the database

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
    // Assuming you have a table named 'comics'
    $selectQuery = "SELECT series, issue_number, purchase_price, grade, publisher FROM comics ORDER BY series, issue_number";
    $result = $DBConnect->query($selectQuery);

    $collection = array();
    while ($row = $result->fetch_assoc()) {
        $collection[] = $row;
    }

    header("Content-Type: application/json"); // Set content type to JSON
    print json_encode($collection);
}

$DBConnect->close();
?>
