USE ComicTavern;

-- 1. Inserindo Cadastros Básicos
INSERT INTO EDITORA (nome_editora, CNPJ) VALUES 
('Panini Comics', '12.345.678/0001-99'), ('JBC', '98.765.432/0001-11');

INSERT INTO AUTOR (nome_autor) VALUES 
('Eiichiro Oda'), ('Masashi Kishimoto'), ('Katsuhiro Otomo');

INSERT INTO GENERO (descricao) VALUES 
('Shonen'), ('Seinen');

INSERT INTO FUNCIONARIO (nome_funcionario, cpf, cargo) VALUES 
('Tanjiro Kamado', '111.111.111-11', 'Vendedor'),
('Monkey D. Luffy', '222.222.222-22', 'Estoquista');

INSERT INTO CLIENTE (nome_cliente, cpf, email, telefone, observacoes_loja) VALUES 
('João de Andrade', '444.444.444-44', 'joao@email.com', '(11) 99999-1234', 'Cliente VIP'),
('Yasmin Torres', '555.555.555-55', 'maria@email.com', '(21) 98888-5678', 'Só compra edições raras');

-- 2. Inserindo Obras e Volumes
INSERT INTO OBRA (titulo, sinopse, id_editora, id_autor, id_genero) VALUES 
('One Piece', 'Piratas...', 1, 1, 1),
('Akira', 'Neo-Tokyo...', 2, 3, 2);

INSERT INTO VOLUME (numero_edicao, isbn, preco_capa, estoque_atual, tipo_capa, id_obra, foto_capa_url) VALUES 
(100, '978-1', 39.90, 50, 'Cartao', 1, '/img/op100.jpg'),
(1, '978-3', 69.90, 10, 'Dura', 2, '/img/akira1.jpg');

-- 3. Inserindo Movimentação
INSERT INTO ASSINATURA (data_inicio, status, id_cliente, id_obra) VALUES 
('2023-01-10', 'Ativa', 1, 1);

INSERT INTO VENDA (valor_total, mensagem_presente, id_cliente, id_funcionario) VALUES 
(109.80, 'Feliz Aniversário!', 1, 1);

INSERT INTO ITEM_VENDA (id_venda, id_volume, quantidade, preco_praticado) VALUES 
(1, 1, 1, 39.90), (1, 2, 1, 69.90);
