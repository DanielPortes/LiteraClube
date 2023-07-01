<?php
require_once "connectBD.php";
session_start();

if (empty($_SESSION)) {
    header("Location: index.php?msgErro=Você precisa se autenticar no sistema.");
    die();
}

// list all clubs
try {
    $sql = "SELECT nome, autor FROM clubes";

    $stmt = $pdo->prepare($sql);

    if ($stmt->execute()) {
        $clubs = $stmt->fetchAll();
    } else {
        die("Erro ao recuperar os clubes");
    }
} catch (PDOException $erro) {
    die($erro->getMessage());
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
<div class="container col-md-11">
    <h2 class="title">Ola, <?php echo $_SESSION['nome'] ?></h2>
</div>

<!--tabelar todos os clubes, incluir botoes de de se registrar,excluir, alterar -->
<div class="container col-md-11">
    <h2 class="title">Clubes</h2>
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">Clube</th>
            <th scope="col">Autor</th>
            <th scope="col">Ação</th>
        </tr>
        </thead>
        <tbody>
        <?php foreach ($clubs as $club) { ?>
            <tr>
                <td><?= $club['nome'] ?></td>
                <td><?= $club['autor'] ?></td>
                <td>
                    <a href="form_cad_livros.php?clube=<?= $club['nome'] ?>" class="btn btn-primary">Registrar-se</a>
                    <a href="alterar_clube.php?clube=<?= $club['nome'] ?>" class="btn btn-warning">Alterar</a>
                    <a href="excluir_clube.php?clube=<?= $club['nome'] ?>" class="btn btn-danger">Excluir</a>
                </td>
            </tr>
        <?php } ?>
        </tbody>
    </table>
</div>


<div class="container">
    <a href="cad_livros.php" class="btn btn-primary">Cadastrar Livros</a>
    <a href="criar_clube.php" class="btn btn-primary">Criar Clube</a>
    <a href="listar_livros.php" class="btn btn-primary">Listar Livros</a>
    <a href="logout.php" class="btn btn-dark">Sair</a></div>

</body>
</html>