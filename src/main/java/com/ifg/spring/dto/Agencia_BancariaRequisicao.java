package com.ifg.spring.dto;

import com.ifg.spring.model.Agencia_bancaria;
import com.ifg.spring.model.Tipo;
import org.springframework.lang.NonNull;

import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.*;
import java.math.BigInteger;

public class Agencia_BancariaRequisicao {


    private Integer id_banco;
    @NotBlank
    @NotNull
    private String endereco;

    @Size(min = 9,max = 9)
    private BigInteger fone;

    private Tipo tipo;
    private BigInteger fon1;
    private Tipo tipo1;
    private String agencia;
    @NotBlank
    @NonNull
    private String nome_agencia;

    public Integer getId_banco() {
        return id_banco;
    }

    public void setId_banco(Integer id_banco) {
        this.id_banco = id_banco;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public BigInteger getFone() {
        return fone;
    }

    public void setFone(BigInteger fone) {
        this.fone = fone;
    }

    public Enum<Tipo> getTipo() {
        return tipo;
    }

    public void setTipo(Tipo tipo) {

        this.tipo = tipo;
    }

    public BigInteger getFon1() {
        return fon1;
    }

    public void setFon1(BigInteger fon1) {
        this.fon1 = fon1;
    }

    public Tipo getTipo1() {
        return tipo1;
    }

    public void setTipo1(Tipo tipo1) {
        this.tipo1 = tipo1;
    }

    public String getAgencia() {
        return agencia;
    }

    public void setAgencia(String agencia) {
        this.agencia = agencia;
    }

    @NonNull
    public String getNome_agencia() {
        return nome_agencia;
    }

    public void setNome_agencia(@NonNull String nome_agencia) {
        this.nome_agencia = nome_agencia;
    }

    public Agencia_bancaria toAgencia_bancaria(){
        Agencia_bancaria a = new Agencia_bancaria(
                this.id_banco,
                this.endereco,
                this.fone,this.fon1,
                this.agencia,this.nome_agencia);

        if (this.tipo == Tipo.FIXO){
            a.setTipo(1);
        }else{
            a.setTipo(0);
        }
        if (this.tipo1 == Tipo.FIXO){
            a.setTipo(1);
        }else{
            a.setTipo(0);
        }
        return a;
    }
    public Agencia_bancaria toAgencia_bancaria(Agencia_bancaria agencia_bancaria){
        agencia_bancaria.setId_banco(this.id_banco);
        agencia_bancaria.setEndereco(this.endereco);
        agencia_bancaria.setFone(this.fone);
        agencia_bancaria.setFon1(this.fon1);
        agencia_bancaria.setAgencia(this.agencia);
        agencia_bancaria.setNome_agencia(this.nome_agencia);
        if (this.tipo == Tipo.FIXO)
            agencia_bancaria.setTipo(1);
        else{
            agencia_bancaria.setTipo(0);
        }
        if(this.tipo1 == Tipo.FIXO)
            agencia_bancaria.setTipo1(1);
        else
            agencia_bancaria.setTipo1(0);

        return agencia_bancaria;
    }
    public void fromAgencia_bancaria(Agencia_bancaria a){
        this.id_banco = a.getId_banco();
        this.endereco = a.getEndereco();
        this.fone = a.getFone();
        this.fon1 = a.getFon1();
        this.agencia = a.getAgencia();
        this.nome_agencia = a.getNome_agencia();
        if (a.getTipo() == 1)
            this.tipo = Tipo.FIXO;
        else
            this.tipo = Tipo.MOVEL;

        if (a.getTipo1() == 1)
            this.tipo1 = Tipo.FIXO;
        else
            this.tipo1 = Tipo.MOVEL;
    }
}
