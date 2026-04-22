package com.backendpi.backend.model;

import jakarta.persistence.*;

@Entity
@Table(name = "posts_salvos")
public class PostSalvo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "id_usuario")
    private Integer idUsuario;

    @Column(name = "id_post")
    private Integer idPost;

    public PostSalvo() {}

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Integer idUsuario) {
        this.idUsuario = idUsuario;
    }

    public Integer getIdPost() {
        return idPost;
    }

    public void setIdPost(Integer idPost) {
        this.idPost = idPost;
    }
}