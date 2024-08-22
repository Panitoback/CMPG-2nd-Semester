<?php
// Start the session to manage user login state
session_start();

// Include the database configuration file
require_once 'config/dbconfig.php';

// Check if the form was submitted using the POST method
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Retrieve and trim the submitted email and password
    $email = trim($_POST['email']);
    $password = trim($_POST['password']);
    
    // Ensure both email and password fields are not empty
    if (!empty($email) && !empty($password)) {
        // Validate the email format
        if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
            // Prepare SQL statement to fetch user by email
            $stmt = $pdo->prepare("SELECT id, password FROM users WHERE email = :email");
            $stmt->execute(['email' => $email]);

            // Check if the user exists in the database
            if ($stmt->rowCount() == 1) {
                $user = $stmt->fetch();

                // Compare the submitted password with the stored password
                if ($password === $user['password']) {
                    // Set session variables for the logged-in user
                    $_SESSION['user_id'] = $user['id'];
                    $_SESSION['user_email'] = $email;

                    // Redirect to the homepage or member page after successful login
                    header("Location:index.php");
                    exit;
                } else {
                    // If the password is incorrect, set an error message
                    $error_message = "Invalid password.";
                }
            } else {
                // If no user is found, set an error message
                $error_message = "No account found with that email.";
            }
        } else {
            // If the email format is invalid, set an error message
            $error_message = "Invalid email format.";
        }
    } else {
        // If either email or password is empty, set an error message
        $error_message = "Please fill in both fields.";
    }
}
?>

<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <title>Login</title>
</head>
<body>
    <!-- Include the header template -->
    <?php include 'templates/header.php'; ?>

    <!-- Login form section -->
    <h2>Login</h2>

    <!-- Display any error message -->
    <?php if (!empty($error_message)) echo "<p style='color:red;'>$error_message</p>"; ?>

    <!-- Form for user to enter email and password -->
    <form action="login.php" method="post">
        <label for="email">Email:</label>
        <input type="email" name="email" required>
        <br><br>
        <label for="password">Password:</label>
        <input type="password" name="password" required>
        <br><br>
        <button type="submit">Login</button>
    </form>

    <!-- Include the footer template -->
    <?php include 'templates/footer.php'; ?>
</body>
</html>
