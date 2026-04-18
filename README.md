# 📚 Projetos Escolares

Repositório para armazenar e documentar os projetos desenvolvidos durante as aulas.

## 🚀 Sobre o Repositório

Este espaço contém uma coleção de trabalhos e projetos práticos realizados em diversas disciplinas, abrangendo tecnologias de desenvolvimento web, Java e banco de dados SQL. O objetivo é servir como um portfólio dos meus aprendizados e evolução.

## 🛠️ Tecnologias Utilizadas

As principais tecnologias que você encontrará nos projetos são:

![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white)
![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E)
![PHP](https://img.shields.io/badge/php-%23777BB4.svg?style=for-the-badge&logo=php&logoColor=white)
![Java](https://img.shields.io/badge/java-%23ED8B00.svg?style=for-the-badge&logo=openjdk&logoColor=white)
![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white)
![Spring Boot](https://img.shields.io/badge/springboot-%236DB33F.svg?style=for-the-badge&logo=springboot&logoColor=white)

## 📂 Estrutura de Pastas

Cada projeto está organizado em sua própria pasta para manter tudo limpo e separado.

```text
Projetos-Escolares/
├── 📁 aluguelDeCarros/
├── 📁 postit/
├── 📁 xadrez-tenis/
├── 📁 Calculadora Basica em Java/
│   ├── Calculadora.java
│   ├── index.html
│   └── style.css
├── 📁 Banco de Dados - Queizy/
│   └── queizy.sql
├── 📁 LocacaoEvento-SpringBoot/
│   ├── src/
│   ├── pom.xml
│   └── ...arquivos do projeto
└── ... outros projetos
```

## ✨ Lista de Projetos

Aqui estão alguns dos projetos incluídos neste repositório:

* **aluguelDeCarros**: Uma aplicação em PHP para gerenciamento de aluguel de carros.
* **postit**: Uma interface simples para criar notas, usando HTML e CSS.
* **xadrez-tenis**: Projeto com interfaces visuais para temas de xadrez e tênis.
* **Calculadora Basica em Java**: Calculadora em Java com operações básicas, fatorial, soma de intervalos e histórico de operações, além de uma página HTML/CSS simples de apresentação.
* **Banco de Dados - Queizy**: Script SQL com criação do banco, tabelas relacionais, inserts em todas as tabelas e objetos de teste (views, procedures, function, trigger e índices).
* **LocacaoEvento-SpringBoot**: Aplicação em Spring Boot (Java) com formulário HTML/Thymeleaf para simulação de locação de eventos, cálculo de valor base, desconto, valor final e classificação do tipo de evento.

*(Esta lista pode ser atualizada conforme novos projetos são adicionados)*

## ⚙️ Como Executar

A maioria dos projetos pode ser aberta diretamente no navegador (arquivos `.html`). Para os projetos que usam **PHP** (como o `aluguelDeCarros`), você precisará de um ambiente de servidor local como [XAMPP](https://www.apachefriends.org/pt_br/index.html) ou [WAMP](https://www.wampserver.com/en/).

### Projetos HTML/CSS/JS
1. Clone o repositório:
   ```sh
   git clone https://github.com/Broken157/Projetos-Escolares.git
   ```
2. Navegue até a pasta do projeto desejado.
3. Abra o arquivo `index.html` no seu navegador.

### Projetos PHP
1. Mova a pasta do projeto para o diretório `htdocs` do seu XAMPP.
2. Acesse via `localhost`.

### Projeto Java (Calculadora Basica em Java)
1. Abra o terminal na pasta `Calculadora Basica em Java`.
2. Compile:
   ```sh
   javac Calculadora.java
   ```
3. Execute:
   ```sh
   java Calculadora
   ```

### Projeto SQL (Banco de Dados - Queizy)
1. Abra seu MySQL (Workbench ou terminal).
2. Entre no banco:
   ```sql
   mysql -u root -p
   ```
3. Execute o script:
   ```sql
   source "caminho_completo/Banco de Dados - Queizy/queizy.sql";
   ```
4. Confira as tabelas e dados com os `select` no final do script.

### Projeto Spring Boot (LocacaoEvento-SpringBoot)
1. Abra o terminal na pasta do projeto:
   ```sh
   cd LocacaoEvento-SpringBoot
   ```
2. Execute com Maven:
   ```sh
   mvn spring-boot:run
   ```
3. Abra no navegador:
   ```text
   http://localhost:8080/locacao
   ```

---

Feito por [Broken157](https://github.com/Broken157).
