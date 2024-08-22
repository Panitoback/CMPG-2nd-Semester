<?php
// Start the session to manage user login state
session_start();

// Check if the user is logged in by verifying the presence of a session variable
if (!isset($_SESSION['user_id'])) {
    // If the user is not logged in, redirect them to the login page
    header("Location: login.php");
    exit();
}

// Retrieve user information from session variables
$user_id = $_SESSION['user_id'];
$user_email = $_SESSION['user_email'];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Member Area</title>
    <!-- Link to your external CSS file -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <!-- Include the header template -->
    <?php include 'templates/header.php'; ?>

    <!-- Main content of the member area -->
    <h1>Welcome</h1>
    <!-- Display the user's email address, ensuring it is safely encoded -->
    <p>Email: <?php echo htmlspecialchars($user_email); ?></p>
    
    <!-- Additional content specific to the member area -->
    <div class="extra-content">
        <h2>Healing Hub</h2>
        <p>Discover interactive journaling, curated playlists, and community forums to support and uplift you during this challenging time.</p>
        <ul>
            <li>Self-Care Tips</li>
            <li>Virtual Pet Companion</li>
            <li>Breakup Playlists</li>
        </ul>
    </div>

    <!-- Logout link to end the session -->
    <a href="logout.php">Logout</a>

    <!-- Include the footer template -->
    <?php include 'templates/footer.php'; ?>
</body>
</html>