package com.backendpi.backend.service;

import com.backendpi.backend.model.Comunidade;
import com.backendpi.backend.repository.ComunidadeRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ComunidadeService {

    private final ComunidadeRepository repository;

    public ComunidadeService(ComunidadeRepository repository) {
        this.repository = repository;
    }

    public List<Comunidade> listar() {
        return repository.findAll();
    }

    public Comunidade criar(Comunidade comunidade) {
        return repository.save(comunidade);
    }

    public Comunidade atualizar(Long id, Comunidade nova) {
        return repository.findById(id).map(c -> {
            c.setNome(nova.getNome());
            c.setDescricao(nova.getDescricao());
            return repository.save(c);
        }).orElseThrow();
    }

    public void deletar(Long id) {
        repository.deleteById(id);
    }
}