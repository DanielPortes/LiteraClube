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

<div class="container">
    <div class="col-md-6">
        <h2 class="title">Cadastro de Clube</h2>

        <form action="processa_cad_clube.php" method="post">
            <div class="form-group">
                <label for="nome">Nome</label>
                <input type="text" name="nome" id="nome" class="form-control campo">
            </div>

            <div class="form-group">
                <label for="tema">Tema</label>
                <input type="text" name="tema" id="tema" class="form-control campo">
            </div>

            <div class="form-group">
                <label for="telefone">Telefone</label>
                <input type="text" name="telefone" id="telefone" class="form-control campo">
            </div>

            <a href="home.php" class="btn btn-dark mt-3">Voltar</a>

            <button type="submit" name="enviarDados" class="btn btn-success mt-3">Enviar</button>
        </form>
    </div>
</div>
</body>
</html>