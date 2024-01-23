<?php
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["username"])) {
    // Set a cookie for the username (30 days expiration)
    setcookie("username", $_POST["username"], time() + (30 * 24 * 60 * 60), "/");
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Login Form</title>
</head>
<body>
    <h2>Login Form</h2>
    <form method="post" action="logindisplay.php">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" value="<?php echo $_COOKIE["username"] ?? ""; ?>" required><br><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>

        <input type="submit" name="login" value="Login">
        <input type="submit" name="create" value="Create Login">
    </form>
</body>
</html>
