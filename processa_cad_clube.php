<?php

require_once "connectBD.php";

if (!empty($_POST)) {
//    insira um novo clube na tabela clubes, contendo nome, nome do autor que criou e uma chave estrangeira para a tabela de participantes
    try {
        $nome = $_POST['nome'];
        $participantes = $_POST['participantes'];
        $autor = $_SESSION['nome'];

        $sql = "INSERT INTO clubes 
                    (nome, autor, participantes) 
                VALUES
                    (:nome, :autor, :participantes)";

        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':nome', $nome);
        $stmt->bindParam(':autor', $autor);
        $stmt->bindParam(':participantes', $participantes);

        if ($stmt->execute()) {
            header('Location: home.php?msgSucesso=Clube cadastrado com sucesso!');
        }

    } catch (PDOException $erro) {
//        die($erro->getMessage());
        header('Location: criar_clube.php?msgErro=Erro ao cadastrar clube!');
    }
} else {
    header('Location: home.php?msgErro=Erro de acesso!');
}

?>