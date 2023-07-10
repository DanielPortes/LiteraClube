<?php

require_once "connectBD.php";
session_start();

if (empty($_SESSION)) {
    header("Location: index.php?msgErro=Voce precisa se autenticar no sistema.");
    die();
}

if (isset($_GET['clube']) && !empty($_GET['clube'])) {
    try {
        $clube = urldecode($_GET['clube']);

        $sqlExcluirClube = "DELETE FROM clube WHERE nome = :nomeClube";
        $stmtExcluirClube = $pdo->prepare($sqlExcluirClube);
        $stmtExcluirClube->bindParam(':nomeClube', $clube);

        if ($stmtExcluirClube->execute()) {
            $count = $stmtExcluirClube->rowCount(); // Verifica quantas linhas foram afetadas

            if ($count > 0) {
                // Clube excluído com sucesso
                header('Location: home.php?msgSucesso=Clube excluído com sucesso!');
                exit;
            } else {
                // Nenhum clube correspondente encontrado
                header('Location: home.php?msgErro=Clube não encontrado!');
                exit;
            }
        } else {
            // Erro ao excluir clube
            header('Location: home.php?msgErro=Erro ao excluir clube!');
            exit;
        }
    } catch (PDOException $erro) {
        header('Location: home.php?msgErro=Erro ao excluir clube!');
        die($erro->getMessage());
    }
} else {
    header('Location: home.php?msgErro=Erro de acesso!');
    exit;
}

?>