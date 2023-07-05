<?php

require_once "connectBD.php";
session_start();

if (empty($_SESSION)) {
    header("Location: index.php?msgErro=Voce precisa se autenticar no sistema.");
    die();
}

if (!empty($_POST)) {
//    insira um novo clube na tabela clubes, contendo nome, id do autor, tema, data de criacao
    try {
        echo "<pre>";
        print_r($_POST);
        print_r($_SESSION);
        echo "</pre>";


        $nome = $_POST['nome'];
        $tema = $_POST['tema'];
        $telefone = $_POST['telefone'];
        $id_criador = $_SESSION['id_leitor'];
        $date = date('y-m-d');

//        especializa leitor para criador primeiro, restricao
        $sqlCriador = "INSERT INTO criador (id_leitor, telefone) VALUES (:id_leitor, :telefone)";
        $stmtCriador = $pdo->prepare($sqlCriador);
        $stmtCriador->bindParam(':id_leitor', $id_criador);
        $stmtCriador->bindParam(':telefone', $telefone);
        if ($stmtCriador->execute()) {
            header('Location: home.php?msgSucesso=Clube cadastrado com sucesso!');
        }

//        cria novo clube
        $sql = "INSERT INTO clube (nome, id_criador, tema, data_criacao) VALUES (:nome, :id_criador, :tema, :data_criacao)";

        $stmt = $pdo->prepare($sql);

        $stmt->bindParam(':nome', $nome);
        $stmt->bindParam(':id_criador', $id_criador);
        $stmt->bindParam(':tema', $tema);
        $stmt->bindParam(':data_criacao', $date);

        if ($stmt->execute()) {
            header('Location: home.php?msgSucesso=Clube cadastrado com sucesso!');
        }

    } catch (PDOException $erro) {
        die($erro->getMessage());
        header('Location: criar_clube.php?msgErro=Erro ao cadastrar clube! Possivelmente voce ja tem um clube.');
    }
} else {
    header('Location: home.php?msgErro=Erro de acesso!');
}
die();
?>