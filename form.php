<?php
if(isset($_REQUEST['action']) && $_REQUEST['action'] == "login") {
    $email = $_REQUEST['email'];
    $haslo = $_REQUEST['password'];

    $email = filter_var($email, FILTER_SANITIZE_EMAIL);

    $db = new mysqli("localhost", "root", "", "koks");

    $q = $db->prepare("SELECT * FROM user WHERE email = ? LIMIT 1");

    $q->bind_param("s", $email);

    $q->execute();
    $result = $q->get_result();

    $userRow = $result->fetch_assoc();
    if ($userRow == null) {
        echo "Zly login albo haslo";
    } else {
        if (password_verify($haslo, $userRow['passwordHash'])) {
            echo "Zalogowano <br>";
        } else {
            echo "nie ladzia :c <br>";
        }
    }
}
if (isset($_REQUEST['action']) && $_REQUEST['action'] == "register") {
    $db = new mysqli("localhost", "root", "", "auth");
    $email = $_REQUEST['email'];
    $email = filter_var($email, FILTER_SANITIZE_EMAIL);

    $haslo = $_REQUEST['password'];
    $hasloRepeat = $_REQUEST['passwordRepeat'];

    if($haslo == $hasloRepeat) {
        $q = $db->prepare("INSERT INTO user VALUES (NULL, ?, ?)");
        $hasloHash = password_hash($haslo, PASSWORD_ARGON2I);
        $q->bind_param("ss", $email, $hasloHash);
        $result = $q->execute();
        if($result) {
            echo "Konto utworzono";
        } else {
            echo "nie ladzia :c";
        }
    } 
}



?>
<h1> Zaloguj sie </h1>
<form action="form.php" method="post">
    <label for="emailInput">Email:</label>
    <input type="email" name="email" id="emailInput">
    <label for="hasloInput">Haslo:</label>
    <input type="password" name="password" id="passwordInput">
    <input type="hidden" name="action" value="login">
    <input type="submit" value="Zaloguj">
</form>
<h1>Zarejestruj sie</h1>
<form action="form.php" method="post">
    <label for="emailInput">Email:</label>
    <input type="email" name="email" id="emailInput">
    <label for="passwordInput">Haslo:</label>
    <input type="password" name="password" id="passwordInput">
    <label for="passwordRepeatInput">Haslo ponownie:</label>
    <input type="password" name="passwordRepeat" id="passwordRepeatInput">
    <input type="hidden" name="action" value="register">
    <input type="submit" value="Zarejestruj">
</form>
