<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulário de Venda de Carros</title>
    <link rel="stylesheet" href="assets/style.css">
</head>
<body>
    <header>
        <h1>Formulário de Venda de Carros</h1>
        <a href="listar_vendas.php" class="view-button">Exibir Vendas</a>
    </header>
    <main>
        <form action="salvar_venda.php" method="POST">
            
            <div class="container">
                <h2>Informações do Cliente</h2>
                <div class="form-section">
                    <div class="coluna">
                        <p><label for="inome">Nome Completo:</label></p>
                        <input type="text" name="nome_cliente" id="inome" required>
                        <p><label for="itele">Telefone:</label></p>
                        <input type="tel" name="telefone_cliente" id="itele" placeholder="11 99999-9999" required>
                        <p><label for="iend">Endereço:</label></p>
                        <input type="text" name="endereco_cliente" id="iend" required>
                        <p><label for="idata">Data de Nascimento:</label></p>
                        <input type="date" name="nascimento_cliente" id="idata" required>
                        <p><label for="iprofissao">Profissão:</label></p>
                        <input type="text" name="profissao_cliente" id="iprofissao" required>
                    </div>
                    <div class="coluna">
                        <p><label for="icpf">CPF:</label></p>
                        <input type="text" name="cpf_cliente" id="icpf" placeholder="000.000.000-00" required>
                        <p><label for="iemail">E-mail:</label></p>
                        <input type="email" name="email_cliente" id="iemail" required>
                        <p><label for="iestado">Estado:</label></p>
                        <select name="estado_cliente" id="iestado" required>
                            <option value="">Selecione</option>
                            <option value="AC">AC</option><option value="AL">AL</option><option value="AP">AP</option><option value="AM">AM</option><option value="BA">BA</option><option value="CE">CE</option><option value="DF">DF</option><option value="ES">ES</option><option value="GO">GO</option><option value="MA">MA</option><option value="MT">MT</option><option value="MS">MS</option><option value="MG">MG</option><option value="PA">PA</option><option value="PB">PB</option><option value="PR">PR</option><option value="PE">PE</option><option value="PI">PI</option><option value="RJ">RJ</option><option value="RN">RN</option><option value="RS">RS</option><option value="RO">RO</option><option value="RR">RR</option><option value="SC">SC</option><option value="SP">SP</option><option value="SE">SE</option><option value="TO">TO</option>
                        </select>
                        <p><label for="iec">Estado Civil:</label></p>
                        <select name="estadocivil_cliente" id="iec" required>
                            <option value="">Selecione</option>
                            <option value="Solteiro">Solteiro</option>
                            <option value="Casado">Casado</option>
                            <option value="Divorciado">Divorciado</option>
                            <option value="Separado">Separado</option>
                            <option value="Viuvo">Viúvo</option>
                        </select>
                        <p><label for="isalario">Salário (R$):</label></p>
                        <input type="number" name="salario_cliente" id="isalario" step="0.01" required>
                    </div>
                </div>
            </div>

            <div class="container">
                <h2>Informações do Carro</h2>
                <div class="form-section">
                    <div class="coluna">
                        <p><label for="imod">Modelo:</label></p>
                        <input type="text" name="modelo_carro" id="imod" required>
                        <p><label for="iplaca">Placa:</label></p>
                        <input type="text" name="placa_carro" id="iplaca" required>
                        <p><label for="iano">Ano:</label></p>
                        <input type="number" name="ano_carro" id="iano" placeholder="2024" required>
                    </div>
                    <div class="coluna">
                        <p><label for="imarca">Marca:</label></p>
                        <input type="text" name="marca_carro" id="imarca" required>
                        <p><label for="icor">Cor:</label></p>
                        <input type="text" name="cor_carro" id="icor" required>
                        <p><label for="ivalor">Valor da Venda (R$):</label></p>
                        <input type="number" name="valor_venda" id="ivalor" step="0.01" required>
                    </div>
                </div>
            </div>

            <div class="container">
                <h2>Informações da Loja e Atendente</h2>
                <div class="form-section">
                    <div class="coluna">
                        <p><label for="inomel">Nome da Loja:</label></p>
                        <input type="text" name="nome_loja" id="inomel" required>
                        <p><label for="inomeA">Nome do Atendente:</label></p>
                        <input type="text" name="nome_atendente" id="inomeA" required>
                    </div>
                    <div class="coluna">
                        <p><label for="iendl">Endereço da Loja:</label></p>
                        <input type="text" name="endereco_loja" id="iendl" required>
                        <p><label for="iIDA">ID do Atendente:</label></p>
                        <input type="text" name="id_atendente" id="iIDA" required>
                    </div>
                </div>
            </div>

            <button type="submit">Finalizar Venda</button>
        </form>
    </main>
    <footer><p>&copy;2025 Venda de carro IFSP. Todos os direitos reservados.</p></footer>
</body>
</html>