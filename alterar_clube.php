<?php

require_once "connectBD.php";
session_start();

if (empty($_SESSION)) {
    header("Location: index.php?msgErro=Voce precisa se autenticar no sistema.");
    die();
}
// Verificar se foi fornecido o ID do clube
if (!empty(urldecode($_GET['clube']))) {
    try {
        $nomeClube = urldecode($_GET['clube']);

        // Consulta para obter os dados do clube
        $sql = "SELECT * FROM clube WHERE nome = :nome";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':nome', $nomeClube);
        if ($stmt->execute())
        {
            $clube = $stmt->fetch(PDO::FETCH_ASSOC);
        }
        else
        {
            header('Location: home.php?msgErro=Erro ao alterar clube!');
        }

        // Verificar se o clube existe
        if ($stmt->rowCount() > 0) {
//            $clube = $stmt->fetch(PDO::FETCH_ASSOC);

            // Preencher os valores nos campos do formulário
            $id_clube = $clube['id_clube'];
            $nome = $clube['nome'];
            $tema = $clube['tema'];
            $dataCriacao = $clube['data_criacao'];
        } else {
            die();
            header('Location: home.php?msgErro=Clube não encontrado!');
        }
    } catch (PDOException $erro) {
        die();
        header('Location: home.php?msgErro=Erro ao alterar clube!');
    }
} else {
    die();
    header('Location: home.php?msgErro=Clube não encontrado!');
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
    <link rel="stylesheet" href="styles.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>
</body>

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
<h1>Alterar Clube</h1>

    <form method="POST" action="processa_clube.php">

<!--        hidden id_clube-->
        <div class="form-group">
            <input type="hidden" class="form-control" id="id_clube" name="id_clube" value="<?php echo $id_clube; ?>">
        </div>

        <div class="form-group">
            <label for="nome">Nome do Clube</label>
            <input type="text" class="form-control" id="nome" name="nome" value="<?php echo $nome; ?>" required>
        </div>
        <div class="form-group">
            <label for="tema">Tema do Clube</label>
            <input type="text" class="form-control" id="tema" name="tema" value="<?php echo $tema; ?>" required>
        </div>
        <div class="form-group">
            <label for="data_criacao">Data de Criação</label>
            <input type="date" class="form-control" id="data_criacao" name="data_criacao"
                   value="<?php echo $dataCriacao; ?>" required>
        </div>

        <!--    butao de voltar para home-->
        <button type="submit" name="enviarDados" class="btn btn-primary" value="ALT">Alterar</button>
        <a href="home.php" class="btn btn-primary">Voltar</a>


    </form>
</div>

</html>