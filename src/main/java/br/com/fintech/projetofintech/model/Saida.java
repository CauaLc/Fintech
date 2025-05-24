package br.com.fintech.projetofintech.model;

import java.math.BigDecimal;
import java.time.LocalDate;

public class Saida {
    private int idUsuario;
    private String nome;
    private String descricao;
    private BigDecimal valor;
    private LocalDate dataTransacao;
    private String categoria;
    private Integer idCartao; // pode ser null

    // Getters e Setters

    public int getIdUsuario() {
        return idUsuario;
    }
    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNome() {
        return nome;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDescricao() {
        return descricao;
    }
    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public BigDecimal getValor() {
        return valor;
    }
    public void setValor(BigDecimal valor) {
        this.valor = valor;
    }

    public LocalDate getDataTransacao() {
        return dataTransacao;
    }
    public void setDataTransacao(LocalDate dataTransacao) {
        this.dataTransacao = dataTransacao;
    }

    public String getCategoria() {
        return categoria;
    }
    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public Integer getIdCartao() {
        return idCartao;
    }
    public void setIdCartao(Integer idCartao) {
        this.idCartao = idCartao;
    }
}
