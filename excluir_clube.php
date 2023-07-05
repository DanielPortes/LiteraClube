<?php

require_once "connectBD.php";

if (!empty($_GET['clube'])) {
    try {
        $clube = $_GET['clube'];

        $sql = "SELECT id_clube, id_criador FROM clube WHERE nome = :nomeClube";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':nomeClube', $clube);
        $stmt->execute();
        $clubeData = $stmt->fetch(PDO::FETCH_ASSOC);

        $sqlExcluirClube = "DELETE FROM clube WHERE nome = :nomeClube";
        $stmtExcluirClube = $pdo->prepare($sqlExcluirClube);
        $stmtExcluirClube->bindParam(':nomeClube', $clube);
        $stmtExcluirClube->execute();

        $sqlExcluirCriador = "DELETE FROM criador WHERE id_leitor = :idCriador";
        $stmtExcluirCriador = $pdo->prepare($sqlExcluirCriador);
        $stmtExcluirCriador->bindParam(':idCriador', $clubeData['id_criador']);
        $stmtExcluirCriador->execute();

        header('Location: home.php?msgSucesso=Clube excluído com sucesso!');
    } catch (PDOException $erro) {
        header('Location: home.php?msgErro=Erro ao excluir clube!');
        die($erro->getMessage());
    }
} else {
    header('Location: home.php?msgErro=Erro de acesso!');
}



?>