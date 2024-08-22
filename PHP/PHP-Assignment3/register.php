<?php
// Start the session to manage user registration state
session_start();

// Include the database configuration file to connect to the database
require_once 'config/dbconfig.php';

// Check if the form was submitted using the POST method
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Retrieve and trim the submitted form data
    $first_name = trim($_POST['first_name']);
    $last_name = trim($_POST['last_name']);
    $email = trim($_POST['email']);
    $password = trim($_POST['password']);

    // Validate the length of each input field
    if (strlen($first_name) > 30 || strlen($last_name) > 30) {
        // Check if the first or last name exceeds the maximum length
        echo "First name or last name exceeds the maximum length of 30 characters.";
    } elseif (strlen($email) > 50) {
        // Check if the email exceeds the maximum length
        echo "Email exceeds the maximum length of 50 characters.";
    } elseif (strlen($password) > 12) {
        // Check if the password exceeds the maximum length
        echo "Password exceeds the maximum length of 12 characters.";
    } elseif (empty($first_name) || empty($last_name) || empty($email) || empty($password)) {
        // Ensure all fields are filled out
        echo "All fields are required.";
    } else {
        try {
            // Prepare and execute the SQL statement to insert the new user
            $stmt = $pdo->prepare("INSERT INTO users (first_name, last_name, email, password) VALUES (:first_name, :last_name, :email, :password)");
            $stmt->execute([
                'first_name' => $first_name,
                'last_name' => $last_name,
                'email' => $email,
                'password' => $password
            ]);
            // Display a success message upon successful registration
            echo "Registration successful!";
        } catch (PDOException $e) {
            // Display an error message if the registration fails
            echo "Error: " . $e->getMessage();
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
</head>
<body>
    <!-- Include the header template -->
    <?php include 'templates/header.php'; ?>

    <!-- Registration form for new users -->
    <h1>Register</h1>
    <form action="register.php" method="POST">
        <label>First Name:</label>
        <input type="text" name="first_name" required><br>
        <label>Last Name:</label>
        <input type="text" name="last_name" required><br>
        <label>Email:</label>
        <input type="email" name="email" required><br>
        <label>Password:</label>
        <input type="password" name="password" required><br>
        <input type="submit" value="Register">
    </form>

    <!-- Include the footer template -->
    <?php include 'templates/footer.php'; ?>
</body>
</html>
