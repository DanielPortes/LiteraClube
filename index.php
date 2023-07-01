<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Pagina Inicial</title>
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
    <h1>LiteraClube</h1>
    <form action="processa_login.php" method="post">
        <div class="col-4">
            <label for="email">E-mail</label>
            <input type="email" name="email" id="email" class="form-control">
        </div>
        <div class="col-4">
            <label for="senha">Senha</label>
            <input type="password" name="senha" id="senha" class="form-control">
        </div>
        <button type="submit" name="enviarDados" class="btn btn-primary">Entrar</button>
        <a href="cad_usuario.php" class="btn btn-warning">Cadastrar-se</a>

    </form>

</div>
</body>
</html>
