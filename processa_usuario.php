<?php
require_once "connectBD.php";
session_start();


//echo "<pre>";
//print_r($_POST);
//echo "</pre>";


if (!empty($_POST)) {
    try {
        $nome = $_POST['nome'];
        $data_nasc = $_POST['data_nasc'];
        $login = $_POST['login'];
        $senha = md5($_POST['senha']);
        $email = $_POST['email'];

        $sql = "INSERT INTO leitor (nome, data_nasc, login, senha, email)
                VALUES (:nome, :data_nasc, :login, :senha, :email)";

        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':nome', $nome);
        $stmt->bindParam(':data_nasc', $data_nasc);
        $stmt->bindParam(':login', $login);
        $stmt->bindParam(':senha', $senha);
        $stmt->bindParam(':email', $email);

        if ($stmt->execute()) {
            header('Location: index.php?msgSucesso=Usuario cadastrado com sucesso!');
        }

    } catch (PDOException $erro) {
        header('Location: cad_usuario.php?msgErro=Erro ao cadastrar usuario!');
        die($erro->getMessage());
    }
} else {
    header('Location: index.php?msgErro=Erro de acesso!');
}
die();

?>
