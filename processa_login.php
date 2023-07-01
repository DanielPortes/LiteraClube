<?php

require_once "connectBD.php";

if (!empty($_POST)) {
    session_start();
    try {
        $sql = "SELECT nome, email, data_nascimento, senha FROM leitor WHERE email = :email AND senha = :senha";

        $stmt = $pdo->prepare($sql);

        $dados = array(
            ':email' => $_POST['email'],
            ':senha' => md5($_POST['senha'])
        );

        $stmt->execute($dados);

        $result = $stmt->fetchAll();

        if ($stmt->rowCount() == 1) {
            $result = $result[0];
            $_SESSION['nome'] = $result['nome'];
            $_SESSION['email'] = $result['email'];
            $_SESSION['data_nascimento'] = $result['data_nascimento'];

            header("Location: home.php");
        } else {
            session_destroy();
            header('Location: index.php?msgErro=Usuario nao logadoo!');
        }
    } catch (PDOException $erro) {
        die($erro->getMessage());
//        header('Location: index.php?msgErro=Erro ao cadastrar usuario!');
    }

} else {
    header('Location: index.php?msgErro=Erro de acesso!');
}
die();
?>