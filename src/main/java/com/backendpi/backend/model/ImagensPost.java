package com.backendpi.backend.model;

import jakarta.persistence.*;

@Entity
@Table(name = "imagens_post")
public class ImagensPost {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idImagem;

    private Long idPost;
    private String urlImagem;

    public ImagensPost() {}

    public Long getIdImagem() { return idImagem; }
    public void setIdImagem(Long idImagem) { this.idImagem = idImagem; }

    public Long getIdPost() { return idPost; }
    public void setIdPost(Long idPost) { this.idPost = idPost; }

    public String getUrlImagem() { return urlImagem; }
    public void setUrlImagem(String urlImagem) { this.urlImagem = urlImagem; }
}