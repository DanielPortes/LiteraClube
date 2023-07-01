<?php

$endereco = 'localhost';
$banco = 'literaclube';
$usuario = 'postgres';
$senha = '123';


try {
    $pdo = new PDO("pgsql:host=$endereco;port=5432;dbname=$banco", $usuario, $senha);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $erro) {
    echo "Erro na conexao: " . $erro->getMessage();
    die($erro->getMessage());
}







?>



