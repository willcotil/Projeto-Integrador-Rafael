package com.backendpi.backend.controller;

import com.backendpi.backend.model.Comentario;
import com.backendpi.backend.repository.ComentarioRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/comentarios")
public class ComentarioController {

    private final ComentarioRepository repository;

    public ComentarioController(ComentarioRepository repository) {
        this.repository = repository;
    }

    @GetMapping
    public List<Comentario> listar() {
        return repository.findAll();
    }

    @PostMapping
    public Comentario criar(@RequestBody Comentario comentario) {
        return repository.save(comentario);
    }

    @PutMapping("/{id}")
    public Comentario atualizar(@PathVariable Long id, @RequestBody Comentario novo) {
        return repository.findById(id).map(c -> {
            c.setConteudo(novo.getConteudo());
            c.setUsuarioId(novo.getUsuarioId());
            c.setPostId(novo.getPostId());
            return repository.save(c);
        }).orElseThrow();
    }

    @DeleteMapping("/{id}")
    public void deletar(@PathVariable Long id) {
        repository.deleteById(id);
    }
}