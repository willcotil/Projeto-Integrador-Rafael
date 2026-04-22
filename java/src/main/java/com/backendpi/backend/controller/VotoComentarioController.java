package com.backendpi.backend.controller;

import com.backendpi.backend.model.VotoComentario;
import com.backendpi.backend.repository.VotoComentarioRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/votos-comentario")
public class VotoComentarioController {

    private final VotoComentarioRepository repository;

    public VotoComentarioController(VotoComentarioRepository repository) {
        this.repository = repository;
    }

    @GetMapping
    public List<VotoComentario> listar() {
        return repository.findAll();
    }

    @PostMapping
    public VotoComentario criar(@RequestBody VotoComentario voto) {
        return repository.save(voto);
    }

    @DeleteMapping("/{id}")
    public void deletar(@PathVariable Long id) {
        repository.deleteById(id);
    }
}