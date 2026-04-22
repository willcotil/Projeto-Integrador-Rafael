package com.backendpi.backend.controller;

import com.backendpi.backend.model.InteracaoUsuario;
import com.backendpi.backend.service.InteracaoUsuarioService;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/interacoes")
public class InteracaoUsuarioController {

    private final InteracaoUsuarioService service;

    public InteracaoUsuarioController(InteracaoUsuarioService service) {
        this.service = service;
    }

    @GetMapping
    public List<InteracaoUsuario> listar() { return service.listar(); }

    @PostMapping
    public InteracaoUsuario criar(@RequestBody InteracaoUsuario interacao) {
        return service.salvar(interacao);
    }

    @DeleteMapping("/{id}")
    public void deletar(@PathVariable Long id) { service.deletar(id); }
}