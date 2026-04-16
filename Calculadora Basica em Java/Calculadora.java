import java.util.Scanner;
import java.util.List;
import java.util.ArrayList;

public class Calculadora {
    private static List<String> historico = new ArrayList<>();

    public static int calcular(int x, int y, String operacao) {
        int z;

        switch (operacao) {
            case "+":
                z = x + y;
                adicionarAoHistorico("Somar: " + x + " + " + y + " = " + z);
                return z;

            case "-":
                z = x - y;
                adicionarAoHistorico("Subtrair: " + x + " - " + y + " = " + z);
                return z;

            case "*":
                z = x * y;
                adicionarAoHistorico("Multiplicar: " + x + " * " + y + " = " + z);
                return z;

            case "/":
                if (y == 0) {
                    System.out.println("Erro: Não é possível dividir por zero.");
                    adicionarAoHistorico("Tentativa de divisão por zero: " + x + " / " + y);
                    return 0;
                }
                z = x / y;
                adicionarAoHistorico("Dividir: " + x + " / " + y + " = " + z);
                return z;

            default:
                System.out.println("Operação inválida!");
                return 0;
        }
    }

    public static int leia(String mensagem, Scanner ler) {
        System.out.println(mensagem);
        while (!ler.hasNextInt()) {
            System.out.println("Entrada inválida. Digite um número inteiro:");
            ler.next();
        }
        return ler.nextInt();
    }

    public static void doisParametros(String operacao, Scanner ler) {
        int n1 = leia("Digite um valor: ", ler);
        int n2 = leia("Digite outro valor: ", ler);
        System.out.println("O resultado é: " + calcular(n1, n2, operacao));
    }

    public static void main(String[] arg) {
        Scanner ler = new Scanner(System.in);
        String opcao;

        do {
            System.out.println("=======================================================");
            System.out.println("Bem vindo!! O que deseja?");
            System.out.println("");
            System.out.println("1 - Somar");
            System.out.println("2 - Subtrair");
            System.out.println("3 - Multiplicar");
            System.out.println("4 - Dividir");
            System.out.println("5 - Fatorial");
            System.out.println("6 - Soma dos intervalos");
            System.out.println("0 - Histórico");
            System.out.println("Digite 'sair' para encerrar");
            System.out.println("=======================================================");

            opcao = ler.next();

            switch (opcao) {
                case "1":
                    doisParametros("+", ler);
                    break;
                case "2":
                    doisParametros("-", ler);
                    break;
                case "3":
                    doisParametros("*", ler);
                    break;
                case "4":
                    doisParametros("/", ler);
                    break;
                case "5":
                    int i = leia("Digite um número para calcular o fatorial:", ler);

                    if (i < 0) {
                        System.out.println("Não existe fatorial de número negativo.");
                        adicionarAoHistorico("Tentativa de fatorial inválido: " + i);
                        break;
                    }

                    long rr = 1;
                    for (int v = 1; v <= i; v++) {
                        rr *= v;
                    }

                    System.out.println("O fatorial do número é: " + rr);
                    adicionarAoHistorico("O fatorial de " + i + " é: " + rr);
                    break;

                case "6":
                    int inicio = leia("Início do intervalo:", ler);
                    int fim = leia("Fim do intervalo:", ler);

                    int soma = 0;
                    for (int v = Math.min(inicio, fim); v <= Math.max(inicio, fim); v++) {
                        soma += v;
                    }

                    System.out.println("A soma do intervalo é: " + soma);
                    adicionarAoHistorico("A soma do intervalo de " + inicio + " e " + fim + " é: " + soma);
                    break;

                case "0":
                    verHistorico();
                    break;

                case "sair":
                case "Sair":
                case "SAIR":
                    System.out.println("Programa encerrado!");
                    break;

                default:
                    System.out.println("Opção inválida. Tente novamente.");
                    break;
            }

        } while (!opcao.equalsIgnoreCase("sair"));

        ler.close();
    }

    private static void adicionarAoHistorico(String operacao) {
        historico.add(operacao);
    }

    private static void verHistorico() {
        System.out.println("Histórico de operações:");
        if (historico.isEmpty()) {
            System.out.println("Nenhuma operação realizada ainda.");
            return;
        }

        for (String operacao : historico) {
            System.out.println(operacao);
        }
    }
}