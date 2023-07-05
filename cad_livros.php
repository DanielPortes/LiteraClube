<?php
require_once "connectBD.php";
session_start();

if (empty($_SESSION)) {
    header("Location: index.php?msgErro=Voce precisa se autenticar no sistema.");
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



<!--this page contain a form to a survey, should contain an input for list of books -->
<form action="processa_cad_livros.php" method="post">
    <div class="container col-md-11">
        <h2 class="title">Cadastro de Livros</h2>

        <div class="col-4">
            <label for="titulo">Titulo</label>
            <input type="text" name="titulo" id="titulo" class="form-control">
        </div>
        <div class="col-4">
            <label for="autor">Autor</label>
            <input type="text" name="autor" id="autor" class="form-control">
        </div>
        <div class="col-4">
            <label for="ano">Ano</label>
            <input type="text" name="ano" id="ano" class="form-control">
        </div>

        <a href="home.php" class="btn btn-dark">Voltar</a>
        <button type="submit" name="enviarDados" class="btn btn-success">Enviar</button>

</form>
</body>
</html>