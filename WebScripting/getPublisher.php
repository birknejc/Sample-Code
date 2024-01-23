<?php
// getPublisher.php
// Gets the form value from the "series" widget, looks up the publisher
// for that series, and prints it for the form

$publishers = array(
    "Spider-Man" => "Marvel Comics",
    "Batman" => "DC Comics",
    "Superman" => "DC Comics",
    "X-Men" => "Marvel Comics",
    // Add more series and publishers as needed
);

header("Content-Type: application/json"); // Set content type to JSON
$series = $_GET["series"];
if (array_key_exists($series, $publishers)) {
    // Return the publisher as JSON
    $response = array("publisher" => $publishers[$series]);
    print json_encode($response);
} else {
    // Return an empty JSON if series not found
    $response = array("publisher" => "");
    print json_encode($response);
}
?>
