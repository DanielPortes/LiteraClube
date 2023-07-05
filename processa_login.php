<?php

require_once "connectBD.php";

if (!empty($_POST)) {
    session_start();
    try {
        $sql = "SELECT * FROM leitor WHERE login = :login AND senha = :senha";

        $stmt = $pdo->prepare($sql);

        $dados = array(
            ':login' => $_POST['login'],
            ':senha' => md5($_POST['senha'])
        );

        $stmt->execute($dados);

        $result = $stmt->fetchAll();
        echo "<pre>";
        print_r($result);
        echo "</pre>";



        if ($stmt->rowCount() == 1) {
            $result = $result[0];
            $_SESSION['id_leitor'] = $result['id_leitor'];
            $_SESSION['nome'] = $result['nome'];
            $_SESSION['login'] = $result['login'];
            $_SESSION['email'] = $result['email'];
            $_SESSION['data_nasc'] = $result['data_nasc'];

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