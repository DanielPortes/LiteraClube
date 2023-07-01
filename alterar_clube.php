<?php
require_once "connectBD.php";

session_start();

if (empty($_SESSION)) {
    header('Location: index.php?msgErro=Usuario nao logado!');
    die();
}

if (!empty($_GET['nome'])) {
    $sql = "SELECT * FROM clubes WHERE nome = :nome";

    try {
        $stmt = $pdo->prepare($sql);
        $stmt->execute(array(':nome' => $_GET['nome']));

        if ($stmt->rowCount() == 1) {
            $result = $stmt->fetchAll();
            $result = $result[0];
        } else {
            header('Location: home.php?msgErro=Clube nao encontrado!');
            die();
        }
    } catch (PDOException $erro) {
        die($erro->getMessage());
    }
} else {
    header('Location: home.php?msgErro=Clube nao encontrado!');
    die();
}

?>


<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Pagina Inicial - Ambiente Logado</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <h1>Alterar Clube</h1>
    <form action="processa_cad_clube.php" method="post">
        <div class="col-4">
            <label for="nome" class="form-label">Nome</label>
            <input type="text" class="form-control" id="nome" name="nome" value="<?= $result['nome'] ?>">
        </div>

        <div class="col-4">
            <label for="autor" class="form-label">Nome</label>
            <input type="text" class="form-control" id="autor" name="autor" value="<?= $result['autor'] ?>">
        </div>

        <!--        table for each participant, should have remove button -->

        <button type="submit" name="enviarDados" class="btn btn-primary" value="ALT">Alterar</button>
        <a href="home.php" class="btn btn-danger">Voltar</a>
    </form>
</div>


</body>
</html>
