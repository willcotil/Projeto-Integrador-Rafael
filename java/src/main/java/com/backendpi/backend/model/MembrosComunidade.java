package com.backendpi.backend.model;

import jakarta.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "membros_comunidade")
public class MembrosComunidade {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long idUsuario;
    private Long idComunidade;

    @Column(name = "data_entrada", insertable = false, updatable = false)
    private Timestamp dataEntrada;

    public MembrosComunidade() {}

    // Getters e Setters (importante para o Spring conseguir ler os dados)
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Long getIdUsuario() { return idUsuario; }
    public void setIdUsuario(Long idUsuario) { this.idUsuario = idUsuario; }

    public Long getIdComunidade() { return idComunidade; }
    public void setIdComunidade(Long idComunidade) { this.idComunidade = idComunidade; }

    public Timestamp getDataEntrada() { return dataEntrada; }
    public void setDataEntrada(Timestamp dataEntrada) { this.dataEntrada = dataEntrada; }
}
