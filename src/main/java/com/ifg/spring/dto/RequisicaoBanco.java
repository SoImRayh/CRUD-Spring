package com.ifg.spring.dto;

//uma classe 'dto' (data transfer object)

import com.ifg.spring.model.Banco;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

public class RequisicaoBanco {
    @NotBlank
    private String nome;
    @NotBlank
    private String numero;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public Banco toBanco(){
        Banco banco = new Banco();
        banco.setNumero(this.getNumero());
        banco.setNome(this.getNome());
        return banco;
    }

    public Banco toBanco(Banco banco){
        banco.setNome(this.nome);
        banco.setNumero(this.numero);
        return banco;
    }

    public void fromBanco(Banco banco){
        this.nome = banco.getNome();;
        this.numero = banco.getNumero();

    }

    @Override
    public String toString() {
        return "RequisicaoNovoBanco{" +
                "nome='" + nome + '\'' +
                ", numero='" + numero + '\'' +
                '}';
    }
}
