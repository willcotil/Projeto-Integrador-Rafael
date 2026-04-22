package com.backendpi.backend.controller;

import com.backendpi.backend.model.Comunidade;
import com.backendpi.backend.repository.ComunidadeRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/comunidades")
public class ComunidadeController {

    private final ComunidadeRepository repository;

    public ComunidadeController(ComunidadeRepository repository) {
        this.repository = repository;
    }

    @GetMapping
    public List<Comunidade> listar() {
        return repository.findAll();
    }

    @PostMapping
    public Comunidade criar(@RequestBody Comunidade comunidade) {
        return repository.save(comunidade);
    }

    @PutMapping("/{id}")
    public Comunidade atualizar(@PathVariable Long id, @RequestBody Comunidade nova) {
        return repository.findById(id).map(c -> {
            c.setNome(nova.getNome());
            c.setDescricao(nova.getDescricao());
            return repository.save(c);
        }).orElseThrow();
    }

    @DeleteMapping("/{id}")
    public void deletar(@PathVariable Long id) {
        repository.deleteById(id);
    }
}