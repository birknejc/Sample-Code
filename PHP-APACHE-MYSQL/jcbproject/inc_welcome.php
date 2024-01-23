<?php
// Start a session
session_start();

// Use session storage to check if the user is logged in
$isLogin = isset($_SESSION["login_successful"]) && $_SESSION["login_successful"] === true;

// Initialize username from the cookie, if available
$username = isset($_COOKIE["username"]) ? $_COOKIE["username"] : null;

if ($isLogin) {
    echo "Welcome, " . $username . "!";
} else {
    echo "Please log in to continue.";
}
?>
