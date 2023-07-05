<?php

require_once "connectBD.php";

if (!empty($_GET['clube'])) {
    try {
        $clube = $_GET['clube'];

        $sql = "DELETE FROM clube WHERE nome = :nomeClube";

        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':nomeClube', $clube);

        if ($stmt->execute()) {
            header('Location: home.php?msgSucesso=Clube excluido com sucesso!');
        } else {
            header('Location: home.php?msgErro=Erro ao excluir clube!');
        }
    } catch (PDOException $erro) {
        die($erro->getMessage());
        header('Location: home.php?msgErro=Erro ao excluir clube!');
    }
} else {
    header('Location: home.php?msgErro=Erro de acesso!');
}




?>