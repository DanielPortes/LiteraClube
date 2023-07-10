<?php

require_once "connectBD.php";
session_start();

if (empty($_SESSION)) {
    header("Location: index.php?msgErro=Voce precisa se autenticar no sistema.");
    die();
}


if (!empty($_POST)) {
    try {
        $nome = $_POST['nome'];
        $tema = $_POST['tema'];
        $telefone = $_POST['telefone'];
        $id_criador = $_SESSION['id_leitor'];
        $date = date('Y-m-d');

        $sqlCriador = "INSERT INTO criador (id_leitor, telefone) VALUES (:id_leitor, :telefone)";
        $stmtCriador = $pdo->prepare($sqlCriador);
        $stmtCriador->bindParam(':id_leitor', $id_criador);
        $stmtCriador->bindParam(':telefone', $telefone);

        if ($stmtCriador->execute()) {
            $sqlClube = "INSERT INTO clube (nome, id_criador, tema, data_criacao) VALUES (:nome, :id_criador, :tema, :data_criacao)";
            $stmtClube = $pdo->prepare($sqlClube);
            $stmtClube->bindParam(':nome', $nome);
            $stmtClube->bindParam(':id_criador', $id_criador);
            $stmtClube->bindParam(':tema', $tema);
            $stmtClube->bindParam(':data_criacao', $date);

            if ($stmtClube->execute()) {
                header('Location: home.php?msgSucesso=Clube cadastrado com sucesso!');
                exit;
            } else {
                header('Location: criar_clube.php?msgErro=Erro ao cadastrar clube. Por favor, tente novamente.');
                exit;
            }
        } else {
            header('Location: criar_clube.php?msgErro=Erro ao cadastrar criador do clube. Por favor, tente novamente.');
            exit;
        }
    } catch (PDOException $erro) {
        header('Location: criar_clube.php?msgErro=Erro ao cadastrar clube. Por favor, tente novamente.');
        die($erro->getMessage());
    }
} else {
    header('Location: home.php?msgErro=Erro de acesso!');
    exit;
}

?>