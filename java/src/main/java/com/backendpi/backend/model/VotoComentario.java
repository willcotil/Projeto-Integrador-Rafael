package com.backendpi.backend.model;

import jakarta.persistence.*;

@Entity
@Table(name = "votos_comentario")
public class VotoComentario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long usuarioId;
    private Long comentarioId;
    private Boolean positivo;

    public Long getId() { return id; }

    public Long getUsuarioId() { return usuarioId; }
    public void setUsuarioId(Long usuarioId) { this.usuarioId = usuarioId; }

    public Long getComentarioId() { return comentarioId; }
    public void setComentarioId(Long comentarioId) { this.comentarioId = comentarioId; }

    public Boolean getPositivo() { return positivo; }
    public void setPositivo(Boolean positivo) { this.positivo = positivo; }
}