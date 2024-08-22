<?php
// Check if the form has been submitted using the POST method
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Retrieve the submitted form data
    $name = $_POST['name'];
    $email = $_POST['email'];
    $message = $_POST['message'];

    // Define the recipient email address
    $to = "your_email@example.com";

    // Set the subject of the email
    $subject = "Contact Us Form";

    // Set the email headers, including the sender's email address
    $headers = "From: $email";

    // Send the email using the mail() function
    mail($to, $subject, $message, $headers);

    // Display a confirmation message to the user
    echo "Message sent!";
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
</head>
<body>

    <!-- Include the header template -->
    <?php include 'templates/header.php'; ?>

    <!-- Main content for the Contact Us page -->
    <h1>Contact Us</h1>
    
    <!-- Contact form that submits data to the same page using POST method -->
    <form action="contact.php" method="POST">
        <label>Name:</label>
        <input type="text" name="name" required><br>
        <label>Email:</label>
        <input type="email" name="email" required><br>
        <label>Message:</label>
        <textarea name="message" required></textarea><br>
        <input type="submit" value="Send">
    </form>

    <!-- Include the footer template -->
    <?php include 'templates/footer.php'; ?>
</body>
</html>

