<?php

require_once "connectBD.php";

if (!empty($_POST)) {
    session_start();
    try {
        $titulo = $_POST['titulo'];
        $autor = $_POST['autor'];
        $ano = $_POST['ano'];

        $sql = "INSERT INTO livros
                    (titulo, autor, ano) 
                VALUES
                    (:titulo, :autor, :ano)";

        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':titulo', $titulo);
        $stmt->bindParam(':autor', $autor);
        $stmt->bindParam(':ano', $ano);

        if ($stmt->execute()) {
            header('Location: cad_livros.php?msgSucesso=Livro cadastrado com sucesso!');
        }

    }catch (PDOException $erro) {
//        die($erro->getMessage());
        header('Location: cad_livros.php?msgErro=Erro ao cadastrar livro!');
    }
}
else {
    header('Location: index.php?msgErro=Erro de acesso!');
}
die();

?>
