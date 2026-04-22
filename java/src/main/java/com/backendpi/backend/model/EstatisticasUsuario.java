package com.backendpi.backend.model;

import jakarta.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "estatisticas_usuario")
public class EstatisticasUsuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idEstatistica;

    private Long idUsuario;
    private Integer tempoTotalUso;
    private Integer postsVisualizados;
    private Integer postsCriados;
    private Integer comentariosFeitos;
    private Integer votosRealizados;

    @Column(name = "ultimo_acesso", insertable = false, updatable = false)
    private Timestamp ultimoAcesso;

    public EstatisticasUsuario() {}

    // Getters e Setters
    public Long getIdEstatistica() { return idEstatistica; }
    public void setIdEstatistica(Long idEstatistica) { this.idEstatistica = idEstatistica; }

    public Long getIdUsuario() { return idUsuario; }
    public void setIdUsuario(Long idUsuario) { this.idUsuario = idUsuario; }

    public Integer getTempoTotalUso() { return tempoTotalUso; }
    public void setTempoTotalUso(Integer tempoTotalUso) { this.tempoTotalUso = tempoTotalUso; }

    public Integer getPostsVisualizados() { return postsVisualizados; }
    public void setPostsVisualizados(Integer postsVisualizados) { this.postsVisualizados = postsVisualizados; }

    public Integer getPostsCriados() { return postsCriados; }
    public void setPostsCriados(Integer postsCriados) { this.postsCriados = postsCriados; }

    public Integer getComentariosFeitos() { return comentariosFeitos; }
    public void setComentariosFeitos(Integer comentariosFeitos) { this.comentariosFeitos = comentariosFeitos; }

    public Integer getVotosRealizados() { return votosRealizados; }
    public void setVotosRealizados(Integer votosRealizados) { this.votosRealizados = votosRealizados; }

    public Timestamp getUltimoAcesso() { return ultimoAcesso; }
    public void setUltimoAcesso(Timestamp ultimoAcesso) { this.ultimoAcesso = ultimoAcesso; }
}