<?php
require_once "connectBD.php";
session_start();

if (empty($_SESSION)) {
    header("Location: index.php?msgErro=Voce precisa se autenticar no sistema.");
    die();
}

// resgate todos leitor pertencentes ao clube
if (!empty(urldecode($_GET['clube']))) {
    try {
        $clube = urldecode($_GET['clube']);
//        consulta dados clube
        $sqlClube = "SELECT * FROM clube WHERE nome = :clube";
        $stmtClube = $pdo->prepare($sqlClube);
        $stmtClube->bindParam(':clube',  $clube);
        if ($stmtClube->execute()) {
            $clube = $stmtClube->fetch();
        } else {
            die("Erro ao recuperar os dados do clube");
        }

        // resgate todos leitor pertencentes ao clube
        $sql = "SELECT l.nome, l.login, l.email FROM leitor l JOIN participacao p ON l.id_leitor = p.id_leitor JOIN clube c ON c.id_clube = p.id_clube WHERE c.nome = :clube";

        $stmt = $pdo->prepare($sql);

        $stmt->bindParam(':clube',  $clube);

        if ($stmt->execute()) {
            $leitores = $stmt->fetchAll();
        }
    } catch (PDOException $erro) {
        die($erro->getMessage());

    }
}else if (empty($_POST)) {
//    header("Location: home.php?msgErro=Voce precisa informar o clube.");
//    die();
}


?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF - 8">
    <meta name="viewport"
          content="width = device - width, user - scalable = no, initial - scale = 1.0, maximum - scale = 1.0, minimum - scale = 1.0">
    <meta http-equiv="X - UA - Compatible" content="ie = edge">
    <title>Clube <?php echo urldecode($_GET['clube']) ?></title>
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



<div class="container col - md - 11">
    <h2 class="title">Clube <?php echo urldecode($_GET['clube']) ?></h2>

<!--crie um formulario para preencher dados de um novo leitor, fornecendo o login deste-->
    <form action="processa_leitor_clube.php" method="post">
        <div class="mb-3">
            <label for="login" class="form-label">Adicionar nova pessoa</label>
            <input type="text" class="form-control" id="login" name="login">
        </div>
        <input type="hidden" name="clube" value="<?= urldecode($_GET['clube']) ?>">
        <button type="submit" class="btn btn-primary">Registrar</button>
    </form>

<!--    tabela contendo todos leitor pertencente ao clube-->

    <div class="container">
        <h1>Lista de Leitores</h1>
        <table class="table">
            <thead>
            <tr>
                <th>Nome</th>
                <th>Login</th>
                <th>Email</th>
            </tr>
            </thead>
            <tbody>
            <?php foreach ($leitores as $leitor): ?>
                <tr>
                    <td><?php echo $leitor['nome']; ?></td>
                    <td><?php echo $leitor['login']; ?></td>
                    <td><?php echo $leitor['email']; ?></td>
                </tr>
            <?php endforeach; ?>
            </tbody>
        </table>
    </div>

    <a href="home.php" class="btn btn-primary">Voltar</a>
</div>
</body>
</html>
