package com.meia.ecommerce.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import com.meia.ecommerce.dto.UsuarioDto;
import com.meia.ecommerce.dto.UsuarioLoginDto;
import com.meia.ecommerce.dto.UsuarioRegisterDto;
import com.meia.ecommerce.model.usuarios.Persona;
import com.meia.ecommerce.model.usuarios.TipoUsuario;
import com.meia.ecommerce.model.usuarios.Usuario;
import com.meia.ecommerce.repository.UsuarioRepo;

@Service
public class UsuarioService {

    @Autowired
    private UsuarioRepo usuarioRepo;

    public void createUsuario(UsuarioDto usuarioDto, TipoUsuario tipoUsuario, Persona persona) {
        Usuario usuario = new Usuario();
        usuario.setUsuario(usuario.getUsuario());
        usuario.setPassword(null);
        usuario.setTipoUsuario(tipoUsuario);
        usuario.setPersona(persona);

        usuarioRepo.save(usuario);
    }

    public List<UsuarioDto> listUsuarios() {
        List<Usuario> usuarios = usuarioRepo.findAll();
        List<UsuarioDto> usuarioDtos = new ArrayList<>();

        for (Usuario usuario : usuarios) {
            usuarioDtos.add(getDto(usuario));
        }
        return usuarioDtos;
    }

    public UsuarioDto getUsuario(UUID id) {
        Optional<Usuario> usuario = usuarioRepo.findById(id);
        if (!usuario.isPresent()) {
            return null;
        }
        return getDto(usuario.get());
    }

    public Usuario getUsuarioEntity(UUID id) {
        Optional<Usuario> usuario = usuarioRepo.findById(id);
        if (!usuario.isPresent()) {
            return null;
        }
        return usuario.get();
    }

    public void registerUsuario(UsuarioRegisterDto uregis, TipoUsuario tipoUsuario, Persona persona) {
        Usuario usuario = new Usuario();
        usuario.setUsuario(uregis.getUsuario());
        usuario.setTipoUsuario(tipoUsuario);
        usuario.setPersona(persona);
        usuario.setSalt(generateSalt());
        usuario.setPassword(hashPassword(uregis.getPassword(), usuario.getSalt()));
        
        usuarioRepo.save(usuario);
    }

    public UsuarioDto loginUsuario(UsuarioLoginDto ulogin) {
        Usuario usuario = usuarioRepo.findByUsuario(ulogin.getUsuario());
        if (usuario == null) {
            throw new RuntimeException("Usuario no encontrado");
        }

        String hashed = hashPassword(ulogin.getPassword(), usuario.getSalt());

        if (!hashed.equals(usuario.getPassword())) {
            throw new RuntimeException("Credenciales inválidas");
        }

        return getDto(usuario);
    }

    private String generateSalt() {
        return UUID.randomUUID().toString();
    }

    private String hashPassword(String password, String salt) {
        return DigestUtils.md5DigestAsHex((password + salt).getBytes());
    }

    public UsuarioDto getDto(Usuario usuario) {
        UsuarioDto usuarioDto = new UsuarioDto();
        usuarioDto.setId(usuario.getId());
        usuarioDto.setUsuario(usuario.getUsuario());
        usuarioDto.setIdTipo(usuario.getTipoUsuario().getId());
        usuarioDto.setIdPersona(usuario.getPersona().getDpi());
        return usuarioDto;
    }
}
