<?php
include("conexao.php");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    try {

        $nome_cliente = $_POST['nome_cliente'];
        $telefone_cliente = $_POST['telefone_cliente'];
        $endereco_cliente = $_POST['endereco_cliente'];
        $nascimento_cliente = $_POST['nascimento_cliente'];
        $profissao_cliente = $_POST['profissao_cliente'];
        $cpf_cliente = $_POST['cpf_cliente'];
        $email_cliente = $_POST['email_cliente'];
        $estado_cliente = $_POST['estado_cliente'];
        $estadocivil_cliente = $_POST['estadocivil_cliente'];
        $salario_cliente = $_POST['salario_cliente'];
        $modelo_carro = $_POST['modelo_carro'];
        $placa_carro = $_POST['placa_carro'];
        $ano_carro = $_POST['ano_carro'];
        $marca_carro = $_POST['marca_carro'];
        $cor_carro = $_POST['cor_carro'];
        $valor_venda = $_POST['valor_venda'];
        $nome_loja = $_POST['nome_loja'];
        $endereco_loja = $_POST['endereco_loja'];
        $nome_atendente = $_POST['nome_atendente'];
        $id_atendente = $_POST['id_atendente'];

        // Inserção do sql
        $stmt_venda = $conexao->prepare("INSERT INTO vendas (
                    nome_cliente, telefone_cliente, endereco_cliente, nascimento_cliente, profissao_cliente,
                    cpf_cliente, email_cliente, estado_cliente, estadocivil_cliente, salario_cliente,
                    modelo_carro, placa_carro, ano_carro, marca_carro, cor_carro, valor_venda,
                    nome_loja, endereco_loja, nome_atendente, id_atendente
                ) VALUES (
                    ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?
                )");
                $stmt_venda->bind_param(
                    "sssssssssssssssssssi",
                    $nome_cliente, $telefone_cliente, $endereco_cliente, $nascimento_cliente, $profissao_cliente,
                    $cpf_cliente, $email_cliente, $estado_cliente, $estadocivil_cliente, $salario_cliente,
                    $modelo_carro, $placa_carro, $ano_carro, $marca_carro, $cor_carro, $valor_venda,
                    $nome_loja, $endereco_loja, $nome_atendente, $id_atendente
                );

        if ($stmt_venda->execute()) {
            $stmt_venda->close();
        } else {
            throw new Exception("Erro ao salvar a venda: " . $stmt_venda->error);
        }

        $conexao->close();

        // Redireciona para a página de listagem
        header("Location: listar_vendas.php");
        exit();

    } catch (Exception $e) {
        die("Erro ao salvar a venda: " . $e->getMessage());
    }
} else {
    header("Location: index.php");
    exit();
}
?>