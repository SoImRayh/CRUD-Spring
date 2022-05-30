package com.ifg.spring.model;

import net.bytebuddy.dynamic.loading.InjectionClassLoader;
import org.springframework.lang.NonNull;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.*;
import java.math.BigInteger;

@Entity
public class Agencia_bancaria {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private Integer id_banco;

    @NotBlank
    @NotNull
    private String endereco;


    private BigInteger fone;

    @Min(0)
    @Max(1)
    private Integer tipo;
    private BigInteger fon1;
    private Integer tipo1;
    private String agencia;
    @NotBlank
    @NonNull
    private String nome_agencia;

    public Agencia_bancaria() {

    }
    public Agencia_bancaria(Integer id_banco, @NonNull String endereco, BigInteger fone, Integer tipo, BigInteger fon1, Integer tipo1,
                            String agencia, @NonNull String nome_agencia) {
        this.id_banco = id_banco;
        this.endereco = endereco;
        this.fone = fone;
        this.tipo = tipo;
        this.fon1 = fon1;
        this.tipo1 = tipo1;
        this.agencia = agencia;
        this.nome_agencia = nome_agencia;
    }

    public Agencia_bancaria( Integer id_banco, String endereco, BigInteger fone, BigInteger fon1, String agencia, @NonNull String nome_agencia) {
        this.id_banco = id_banco;
        this.endereco = endereco;
        this.fone = fone;
        this.fon1 = fon1;
        this.agencia = agencia;
        this.nome_agencia = nome_agencia;
    }

    public Agencia_bancaria(Integer id_banco, @NonNull String endereco, BigInteger fone, Integer tipo, String agencia, @NonNull String nome_agencia) {
        this.id_banco = id_banco;
        this.endereco = endereco;
        this.fone = fone;
        this.tipo = tipo;
        this.agencia = agencia;
        this.nome_agencia = nome_agencia;
    }

    public Agencia_bancaria(Integer id_banco, @NonNull String endereco, String agencia, @NonNull String nome_agencia) {
        this.id_banco = id_banco;
        this.endereco = endereco;
        this.agencia = agencia;
        this.nome_agencia = nome_agencia;
    }

    @NonNull
    public Integer getId() {
        return id;
    }

    public void setId(@NonNull Integer id) {
        this.id = id;
    }

    public Integer getId_banco() {
        return id_banco;
    }

    public void setId_banco(Integer id_banco) {
        this.id_banco = id_banco;
    }

    @NonNull
    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(@NonNull String endereco) {
        this.endereco = endereco;
    }

    public BigInteger getFone() {
        return fone;
    }

    public void setFone(BigInteger fone) {
        this.fone = fone;
    }

    public Integer getTipo() {
        return tipo;
    }

    public void setTipo(Integer tipo) {
        this.tipo = tipo;
    }

    public BigInteger getFon1() {
        return fon1;
    }

    public void setFon1(BigInteger fon1) {
        this.fon1 = fon1;
    }

    public Integer getTipo1() {
        return tipo1;
    }

    public void setTipo1(Integer tipo1) {
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
}
