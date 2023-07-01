<?php

session_start();

if (empty($_SESSION)) {
    header("Location: index.php?msgErro=Voce precisa se autenticar no sistema.");
}
else {
    session_destroy();
    header("Location: index.php?msgSucesso=Usuario deslogado com sucesso!");
}
die();

?>
