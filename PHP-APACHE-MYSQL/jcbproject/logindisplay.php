<?php
$isLogin = false;

function readPasswordFile() {
    $file = fopen("enc_password.txt", "r");
    $usernames = [];
    $passwords = [];

    while (($line = fgets($file)) !== false) {
        $storedUsername = trim($line);
        $storedPassword = trim(fgets($file));

        // Store the usernames and passwords in parallel arrays
        $usernames[] = $storedUsername;
        $passwords[] = $storedPassword;
    }

    fclose($file);
    return [$usernames, $passwords];
}

function searchPasswords($username, $password, $usernames, $passwords) {
    // Search for matching username and password
    for ($i = 0; $i < count($usernames); $i++) {
        // Compare the encrypted values
        if (password_verify($username, $usernames[$i]) && password_verify($password, $passwords[$i])) {
            return true;
        }
    }

    return false;
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST["username"];
    $password = $_POST["password"];

    if (isset($_POST["create"])) {
        $file = fopen("enc_password.txt", "a");

        // Encrypt the username and password
        $encryptedUsername = password_hash($username, PASSWORD_DEFAULT);
        $encryptedPassword = password_hash($password, PASSWORD_DEFAULT);

        fwrite($file, $encryptedUsername . PHP_EOL);
        fwrite($file, $encryptedPassword . PHP_EOL);
        fclose($file);
        echo "Login Created. Username: " . $username . ", Password: " . $password;
    } else {
        list($usernames, $passwords) = readPasswordFile();
        $isLogin = searchPasswords($username, $password, $usernames, $passwords);

        if ($isLogin) {
            // Set a cookie for the username if login is successful (30 days expiration)
            setcookie("username", $username, time() + (30 * 24 * 60 * 60), "/");

            // Start a session
            session_start();
            $_SESSION["login_successful"] = true;

            echo "Login Successful. Welcome, " . $username . "!";

        } else {
            // Start a session
            session_start();
            $_SESSION["login_successful"] = false;

            echo "Login Failed. Invalid username or password.";
        }
    }
}
?>
