<?php
// Start the session to access session variables
session_start();

// Unset all session variables to clear user data
session_unset();

// Destroy the session to log the user out
session_destroy();

// Redirect the user to the homepage after logout
header("Location: index.php");
exit(); // Ensure the script stops executing after the redirect
?>

