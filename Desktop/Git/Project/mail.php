<?php

$recepient = "allidemocracy@gmail.com, 52921@bk.ru";
$siteName = "Куртка Saint Laurent";


$name = trim($_POST["name"]);
$email = trim($_POST["email"]);
$phone = trim($_POST["phone"]);
$standard = trim($_POST["standard"]);
$shoulders = trim($_POST["shoulders"]);
$chest = trim($_POST["chest"]);
$sleeve = trim($_POST["sleeve"]);
$length = trim($_POST["length"]);

$message = "Имя: $name \nE-mail: $email\nТелефон: $phone \nРазмер: $standard \nПлечи: $shoulders \nГрудь: $chest \nРукав: $sleeve \nДлина: $length";

$pagetitle = "Заявка с сайта \"$siteName\"";
mail($recepient, $pagetitle, $message, "Content-type: text/plain; charset=\"utf-8\"\n From: $recepient");

?>