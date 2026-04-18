package com.ifsp.br.estudo1.model;

public class Evento {
    private String nomeCliente;
    private int qntdConvidados;
    private int qntdHoras;
    private int valorH;
    private double desconto;
    private double valorBase;
    private double valorFinal;
    private String tipoE;

    public Evento() {
    }

    public String tipoEvento() {
        if (qntdConvidados < 51) {
            tipoE = "Evento Pequeno";
        } else if (qntdConvidados < 151) { // já cobre >= 51
            tipoE = "Evento Médio";
        } else {
            tipoE = "Evento Grande";
        }
        return tipoE;
    }

    public double calcularValorBase() {
        valorBase = this.qntdHoras * this.valorH;
        return valorBase;
    }

    public double calcularDesconto() {
        double valorPraDesconto = calcularValorBase();

        if (valorPraDesconto <= 1000) {
            desconto = 0.0;
        } else if (valorPraDesconto <= 3000) {
            desconto = 0.05;
        } else {
            desconto = 0.12;
        }
        return desconto;
    }

    public double calcularValorFinal() {
        double valorPraDesconto = calcularValorBase();
        double percentual = calcularDesconto();
        valorFinal = valorPraDesconto - (valorPraDesconto * percentual);
        return valorFinal;
    }

    public String getNomeCliente() {
        return nomeCliente;
    }

    public int getConvidados() {
        return qntdConvidados;
    }

    public int getHoras() {
        return qntdHoras;
    }

    public int getValorH() {
        return valorH;
    }

    public double getDesconto() {
        return desconto;
    }

    public double getValorBase() {
        return valorBase;
    }

    public double getValorFinal() {
        return valorFinal;
    }

    public String getTipoE() {
        return tipoE;
    }

    public void setNomeCliente(String nomeCliente) {
        this.nomeCliente = nomeCliente;
    }

    public void setConvidados(int qntdConvidados) {
        this.qntdConvidados = qntdConvidados;
    }

    public void setHoras(int qntdHoras) {
        this.qntdHoras = qntdHoras;
    }

    public void setValorH(int valorH) {
        this.valorH = valorH;
    }

    public void setValorBase(double valorBase) {
        this.valorBase = valorBase;
    }

    public void setDesconto(double desconto) {
        this.desconto = desconto;
    }

    public void setValorFinal(double valorFinal) {
        this.valorFinal = valorFinal;
    }

    public void setCategoria(String tipoE) {
        this.tipoE = tipoE;
    }
}