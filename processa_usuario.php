<?php
require_once "connectBD.php";

//echo "<pre>";
//print_r($_POST);
//echo "</pre>";


if (!empty($_POST)) {
    try {
        $nome = $_POST['nome'];
        $data_nascimento = $_POST['data_nascimento'];
        $email = $_POST['email'];
        $senha = md5($_POST['senha']);

        $sql = "INSERT INTO leitor 
                    (nome, data_nascimento, email, senha) 
                VALUES
                    (:nome, :data_nascimento, :email, :senha)";

        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':nome', $nome);
        $stmt->bindParam(':data_nascimento', $data_nascimento);
        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':senha', $senha);

        if ($stmt->execute()) {
            header('Location: index.php?msgSucesso=Usuario cadastrado com sucesso!');
        }

    } catch (PDOException $erro) {
//        die($erro->getMessage());
        header('Location: cad_usuario.php?msgErro=Erro ao cadastrar usuario!');
    }
}
else {
    header('Location: index.php?msgErro=Erro de acesso!');
}
die();

?>
