<?php
require_once "connectBD.php";
session_start();

if (empty($_SESSION)) {
    header("Location: index.php?msgErro=Você precisa se autenticar no sistema.");
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
    <title>Cadastro de livros</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>

<?php if (!empty($_GET['msgErro'])) { ?>
    <div class="alert alert-danger" role="alert">
        <?= $_GET['msgErro'] ?>

    </div>
<?php } ?>
<?php if (!empty($_GET['msgSucesso'])) { ?>
    <div class="alert alert-success" role="alert">
        <?= $_GET['msgSucesso'] ?>
    </div>
<?php } ?>



<!--this page contain a form register a new club, contains name,participants(seperated by comma) -->
<form action="processa_cad_clube.php" method="post">
    <div class="container col-md-11">
        <h2 class="title">Cadastro de Clube</h2>

        <div class="col-4">
            <label for="nome">Nome</label>
            <input type="text" name="nome" id="nome" class="form-control">
        </div>
        <div class="col-4">
            <label for="participantes">Participantes</label>
            <input type="text" name="participantes" id="participantes" class="form-control">
        </div>

        <a href="home.php" class="btn btn-dark">Voltar</a>
        <button type="submit" name="enviarDados" class="btn btn-success">Enviar</button>

</form>
</body>
</html>