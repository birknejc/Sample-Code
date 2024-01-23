<?php
$isLogin = false;

function searchPasswordFile($username, $password) {
    $file = fopen("enc_password.txt", "r");

    while (($line = fgets($file)) !== false) {
        $storedUsername = trim($line);
        $storedPassword = trim(fgets($file));

        // Compare the encrypted values
        if (password_verify($username, $storedUsername) && password_verify($password, $storedPassword)) {
            return true;
        }
    }

    fclose($file);
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
        $isLogin = searchPasswordFile($username, $password);

        if ($isLogin) {
            echo "Login Successful. Welcome, " . $username . "!";
        } else {
            echo "Login Failed. Invalid username or password.";
        }
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Login Form</title>
</head>
<body>
    <h2>Login Form</h2>
    <form method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>

        <input type="submit" name="login" value="Login">
        <input type="submit" name="create" value="Create Login">
    </form>
</body>
</html>