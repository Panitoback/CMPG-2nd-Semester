<?php
// Start the session to manage user login state
session_start();

// Include the database configuration file
require_once 'config/dbconfig.php'; 

// Initialize variables for error, success messages, and login status
$error_message = '';
$login_successful = false;

// Check if the form was submitted
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
                    // Set session variables for logged-in user
                    $_SESSION['user_id'] = $user['id'];
                    $_SESSION['user_email'] = $email;

                    // Set login success flag and redirect to the homepage
                    $login_successful = true;
                    header("Location: index.php");
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


// Check if the user is logged in by verifying the session variable
$is_logged_in = isset($_SESSION['user_id']);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
</head>
<body class="index">
    <!-- Include the header template -->
    <?php include 'templates/header.php'; ?>

    <div class="main_index">
        <!-- Main content of the homepage -->
        <h1>Welcome to sad kittens</h1>
        <p>Your safe haven for when love doesn't go as planned. Whether you're healing from a breakup or simply need a space to reflect, our site offers comfort, support, and a sense of community.</p>
        <img src="assets/sadcat.jpg" alt="catsad" width=400px height=400px>

        <!-- Display the login form if the user is not logged in -->
        <?php if (!$is_logged_in): ?>
            <div class="login-form">
                <h2>Login</h2>
                <?php 
                // Display any error message
                if (!empty($error_message)) echo "<p style='color:red;'>$error_message</p>"; 
                ?>
                <form action="index.php" method="post">
                    <label for="email">Email:</label>
                    <input type="email" name="email" required>
                    <br><br>
                    <label for="password">Password:</label>
                    <input type="password" name="password" required>
                    <br><br>
                    <button type="submit">Login</button>
                </form>
            </div>
        <?php endif; ?>

        <!-- Links to the registration and login pages -->
        <a href="register.php">Register</a> ---------- <a href="login.php">Login</a>
    </div>

    <!-- Include the footer template -->
    <?php include 'templates/footer.php'; ?>
</body>
</html>

