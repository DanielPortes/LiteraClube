<?php
require_once "connectBD.php";
session_start();

if (empty($_SESSION)) {
    header("Location: index.php?msgErro=Voce precisa se autenticar no sistema.");
    die();
}


if (!empty($_POST))
{
    if ($_POST['enviarDados'] == 'ALT') // alterar dados
    {
        try {
//            echo "<pre>";
//            print_r($_POST);
//            echo "</pre>";

            $sql = "UPDATE clube SET nome = :nome, tema = :tema , data_criacao = :data_criacao WHERE id_clube = :id_clube";

            $nome = $_POST['nome'];
            $tema = $_POST['tema'];
            $data_criacao = $_POST['data_criacao'];
            $id_clube = $_POST['id_clube'];

            $stmt = $pdo->prepare($sql);
            $stmt->bindParam(':nome', $nome);
            $stmt->bindParam(':tema', $tema);
            $stmt->bindParam(':data_criacao', $data_criacao);
            $stmt->bindParam(':id_clube', $id_clube);

            if ($stmt->execute())
            {
                header('Location: home.php?msgSucesso=Clube alterado com sucesso!');
            }
            else
            {
                header('Location: home.php?msgErro=Erro ao alterar clube!');
            }

        }catch (PDOException $erro) {
            die($erro->getMessage());
            header('Location: home.php?msgErro=Erro ao alterar clube!');
        }
    }

}
?>
