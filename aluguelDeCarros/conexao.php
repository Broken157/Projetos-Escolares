<?php

$host = 'localhost';
$db_name = 'aluguel_carros';
$username = 'root';
$password = '1234';

$conexao = new mysqli($host, $username, $password, $db_name);

if ($conexao->connect_error) {
    die("Erro na conexão com o banco de dados: " . $conexao->connect_error);
}

$conexao->set_charset("utf8");

?>