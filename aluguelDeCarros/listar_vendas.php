<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Vendas Realizadas</title>
    <link rel="stylesheet" href="assets/style.css">
    <style>
        .table-container {
            width: 100%;
            overflow-x: auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #380861;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
    <header>
        <h1>Vendas Realizadas</h1>
        <a href="index.php" class="view-button">Cadastrar Nova Venda</a>
    </header>
    <main>
        <div class="container">
            <h2>Registros</h2>
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Cliente</th>
                            <th>CPF</th>
                            <th>Carro</th>
                            <th>Placa</th>
                            <th>Valor (R$)</th>
                            <th>Atendente</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        include("conexao.php");

                        $sql = "SELECT id, nome_cliente, cpf_cliente, modelo_carro, placa_carro, valor_venda, nome_atendente FROM vendas ORDER BY id DESC";
                        $result = $conexao->query($sql);
                        
                        if ($result->num_rows > 0) {
                            while ($venda = $result->fetch_assoc()) {
                                echo "<tr>";
                                echo "<td>" . htmlspecialchars($venda['id']) . "</td>";
                                echo "<td>" . htmlspecialchars($venda['nome_cliente']) . "</td>";
                                echo "<td>" . htmlspecialchars($venda['cpf_cliente']) . "</td>";
                                echo "<td>" . htmlspecialchars($venda['modelo_carro']) . "</td>";
                                echo "<td>" . htmlspecialchars($venda['placa_carro']) . "</td>";
                                echo "<td>" . number_format($venda['valor_venda'], 2, ',', '.') . "</td>";
                                echo "<td>" . htmlspecialchars($venda['nome_atendente']) . "</td>";
                                echo "</tr>";
                            }
                        } else {
                            echo "<tr><td colspan='7'>Nenhuma venda encontrada.</td></tr>";
                        }
                        $conexao->close();
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
    <footer><p>&copy;2025 Venda de carro IFSP. Todos os direitos reservados.</p></footer>
</body>
</html>