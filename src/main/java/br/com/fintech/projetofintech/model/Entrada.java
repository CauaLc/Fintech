package br.com.fintech.projetofintech.model;

public class Entrada {
    private int idUsuario;
    private String nome;
    private double valor;
    private String dataTransacao; // formato: YYYY-MM-DD
    private String categoria;

    // Getters e Setters
    public int getIdUsuario() { return idUsuario; }
    public void setIdUsuario(int idUsuario) { this.idUsuario = idUsuario; }

    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }

    public double getValor() { return valor; }
    public void setValor(double valor) { this.valor = valor; }

    public String getDataTransacao() { return dataTransacao; }
    public void setDataTransacao(String dataTransacao) { this.dataTransacao = dataTransacao; }

    public String getCategoria() { return categoria; }
    public void setCategoria(String categoria) { this.categoria = categoria; }
}
