-- =========================================
-- ADMINISTRADOR
-- =========================================
INSERT INTO usuarios.usuario (id, usuario, salt, password, id_tipo)
VALUES ('c4f8b857-1111-4d1e-9000-000000000001', 'admin', 'salt123', 'admin123', 1);

INSERT INTO usuarios.persona (dpi, nombre, direccion, correo, ganancias, id_usuario)
VALUES ('1000000000101', 'Administrador General', 'Ciudad de Guatemala', 'admin@ecommerce.gt', 0, 'c4f8b857-1111-4d1e-9000-000000000001');

-- =========================================
-- MODERADORES
-- =========================================
INSERT INTO usuarios.usuario (id, usuario, salt, password, id_tipo) VALUES
('c4f8b857-1111-4d1e-9000-000000000002', 'moderador1', 'salt123', 'mod123', 2),
('c4f8b857-1111-4d1e-9000-000000000003', 'moderador2', 'salt123', 'mod123', 2),
('c4f8b857-1111-4d1e-9000-000000000004', 'moderador3', 'salt123', 'mod123', 2),
('c4f8b857-1111-4d1e-9000-000000000005', 'moderador4', 'salt123', 'mod123', 2),
('c4f8b857-1111-4d1e-9000-000000000006', 'moderador5', 'salt123', 'mod123', 2);

INSERT INTO usuarios.persona (dpi, nombre, direccion, correo, ganancias, id_usuario) VALUES
('2000000000101', 'Moderador 1', 'Quetzaltenango', 'mod1@ecommerce.gt', 0, 'c4f8b857-1111-4d1e-9000-000000000002'),
('2000000000102', 'Moderador 2', 'Quetzaltenango', 'mod2@ecommerce.gt', 0, 'c4f8b857-1111-4d1e-9000-000000000003'),
('2000000000103', 'Moderador 3', 'Quetzaltenango', 'mod3@ecommerce.gt', 0, 'c4f8b857-1111-4d1e-9000-000000000004'),
('2000000000104', 'Moderador 4', 'Quetzaltenango', 'mod4@ecommerce.gt', 0, 'c4f8b857-1111-4d1e-9000-000000000005'),
('2000000000105', 'Moderador 5', 'Quetzaltenango', 'mod5@ecommerce.gt', 0, 'c4f8b857-1111-4d1e-9000-000000000006');

-- =========================================
-- LOGÍSTICA
-- =========================================
INSERT INTO usuarios.usuario (id, usuario, salt, password, id_tipo) VALUES
('c4f8b857-1111-4d1e-9000-000000000007', 'logistica1', 'salt123', 'log123', 3),
('c4f8b857-1111-4d1e-9000-000000000008', 'logistica2', 'salt123', 'log123', 3),
('c4f8b857-1111-4d1e-9000-000000000009', 'logistica3', 'salt123', 'log123', 3);

INSERT INTO usuarios.persona (dpi, nombre, direccion, correo, ganancias, id_usuario) VALUES
('3000000000101', 'Logística 1', 'Ciudad de Guatemala', 'log1@ecommerce.gt', 0, 'c4f8b857-1111-4d1e-9000-000000000007'),
('3000000000102', 'Logística 2', 'Ciudad de Guatemala', 'log2@ecommerce.gt', 0, 'c4f8b857-1111-4d1e-9000-000000000008'),
('3000000000103', 'Logística 3', 'Ciudad de Guatemala', 'log3@ecommerce.gt', 0, 'c4f8b857-1111-4d1e-9000-000000000009');

-- =========================================
-- USUARIOS COMUNES
-- =========================================
INSERT INTO usuarios.usuario (id, usuario, salt, password, id_tipo) VALUES
('c4f8b857-1111-4d1e-9000-000000000010', 'usuario1', 'salt123', 'user123', 4),
('c4f8b857-1111-4d1e-9000-000000000011', 'usuario2', 'salt123', 'user123', 4),
('c4f8b857-1111-4d1e-9000-000000000012', 'usuario3', 'salt123', 'user123', 4),
('c4f8b857-1111-4d1e-9000-000000000013', 'usuario4', 'salt123', 'user123', 4),
('c4f8b857-1111-4d1e-9000-000000000014', 'usuario5', 'salt123', 'user123', 4),
('c4f8b857-1111-4d1e-9000-000000000015', 'usuario6', 'salt123', 'user123', 4),
('c4f8b857-1111-4d1e-9000-000000000016', 'usuario7', 'salt123', 'user123', 4),
('c4f8b857-1111-4d1e-9000-000000000017', 'usuario8', 'salt123', 'user123', 4),
('c4f8b857-1111-4d1e-9000-000000000018', 'usuario9', 'salt123', 'user123', 4),
('c4f8b857-1111-4d1e-9000-000000000019', 'usuario10', 'salt123', 'user123', 4);

INSERT INTO usuarios.persona (dpi, nombre, direccion, correo, ganancias, id_usuario) VALUES
('4000000000101', 'Usuario 1', 'Quetzaltenango', 'user1@correo.gt', 0, 'c4f8b857-1111-4d1e-9000-000000000010'),
('4000000000102', 'Usuario 2', 'Quetzaltenango', 'user2@correo.gt', 0, 'c4f8b857-1111-4d1e-9000-000000000011'),
('4000000000103', 'Usuario 3', 'Quetzaltenango', 'user3@correo.gt', 0, 'c4f8b857-1111-4d1e-9000-000000000012'),
('4000000000104', 'Usuario 4', 'Quetzaltenango', 'user4@correo.gt', 0, 'c4f8b857-1111-4d1e-9000-000000000013'),
('4000000000105', 'Usuario 5', 'Quetzaltenango', 'user5@correo.gt', 0, 'c4f8b857-1111-4d1e-9000-000000000014'),
('4000000000106', 'Usuario 6', 'Quetzaltenango', 'user6@correo.gt', 0, 'c4f8b857-1111-4d1e-9000-000000000015'),
('4000000000107', 'Usuario 7', 'Quetzaltenango', 'user7@correo.gt', 0, 'c4f8b857-1111-4d1e-9000-000000000016'),
('4000000000108', 'Usuario 8', 'Quetzaltenango', 'user8@correo.gt', 0, 'c4f8b857-1111-4d1e-9000-000000000017'),
('4000000000109', 'Usuario 9', 'Quetzaltenango', 'user9@correo.gt', 0, 'c4f8b857-1111-4d1e-9000-000000000018'),
('4000000000110', 'Usuario 10', 'Quetzaltenango', 'user10@correo.gt', 0, 'c4f8b857-1111-4d1e-9000-000000000019');