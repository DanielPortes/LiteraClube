<?php
require_once "connectBD.php";

if (!empty($_POST)) {
    try {

        $login = $_POST['login'];
        $clube = $_POST['clube'];

//        apenas inserir novo leitor se leitor ja existir
        $sql = "SELECT * FROM leitor WHERE login = :login";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':login', $login);
        if ($stmt->execute()) {
            $resultadoVerificar = $stmt->fetch(PDO::FETCH_ASSOC);
        } else {
            die("Erro ao recuperar os dados do leitor");
        }

//        resgatar id_clube
        $sqlClube = "SELECT id_clube, data_criacao FROM clube WHERE nome = :clube";

        $stmtClube = $pdo->prepare($sqlClube);
        $stmtClube->bindParam(':clube', $clube);

        if ($stmtClube->execute()) {
            $clube = $stmtClube->fetch();
        } else {
            die("Erro ao recuperar os dados do clube");
        }

// se leitor existir, inserir na tabela participacao
        if ($resultadoVerificar) {

            $sql = "INSERT INTO participacao (id_leitor, id_clube, data_inicio)
                    VALUES (:id_leitor, :id_clube, :data_inicio)";

            date_default_timezone_set('America/Sao_Paulo');
            $stmt = $pdo->prepare($sql);
            $stmt->bindParam(':id_leitor', $resultadoVerificar['id_leitor']);
            $stmt->bindParam(':id_clube', $clube['id_clube']);
            $data_inicio = date("Y-m-d");
            $stmt->bindParam(':data_inicio', $data_inicio);


            if ($stmt->execute()) {
                header('Location: registrar_pessoa_clube.php?msgSucesso=Usuario cadastrado com sucesso&clube=' . $_POST['clube']);
            }

        } else {
            header('Location: home.php?msgErro=Usuario nao existe!&clube=' . $_POST['clube']);
        }

    } catch (PDOException $erro) {
        header('Location: registrar_pessoa_clube.php?msgErro=Erro ao registrar usuario no clube&clube=' . $_POST['clube']);
        die($erro->getMessage());


    }
}
die();
?>