DROP DATABASE IF EXISTS ComicTavern;
CREATE DATABASE ComicTavern;
USE ComicTavern;

-- TABELAS DE CADASTRO
CREATE TABLE EDITORA (
    id_editora INT AUTO_INCREMENT PRIMARY KEY,
    nome_editora VARCHAR(100) NOT NULL,
    CNPJ VARCHAR(18) NOT NULL UNIQUE
);

CREATE TABLE AUTOR (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome_autor VARCHAR(100) NOT NULL
);

CREATE TABLE GENERO (
    id_genero INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL
);

CREATE TABLE FUNCIONARIO (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome_funcionario VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    cargo ENUM('Vendedor', 'Estoquista') NOT NULL
);

CREATE TABLE CLIENTE (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    observacoes_loja TEXT
);

-- TABELAS DE PRODUTO
CREATE TABLE OBRA (
    id_obra INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    sinopse TEXT,
    id_editora INT NOT NULL,
    id_autor INT NOT NULL,
    id_genero INT NOT NULL,
    FOREIGN KEY (id_editora) REFERENCES EDITORA(id_editora),
    FOREIGN KEY (id_autor) REFERENCES AUTOR(id_autor),
    FOREIGN KEY (id_genero) REFERENCES GENERO(id_genero)
);

CREATE TABLE VOLUME (
    id_volume INT AUTO_INCREMENT PRIMARY KEY,
    numero_edicao INT NOT NULL,
    isbn VARCHAR(20),
    preco_capa DECIMAL(10, 2) NOT NULL,
    estoque_atual INT NOT NULL DEFAULT 0,
    tipo_capa ENUM('Dura', 'Cartao', 'Especial', 'Variante') NOT NULL,
    foto_capa_url VARCHAR(500),
    arquivo_nota_fiscal VARCHAR(500),
    id_obra INT NOT NULL,
    FOREIGN KEY (id_obra) REFERENCES OBRA(id_obra)
);

-- TABELAS DE NEGÓCIO
CREATE TABLE ASSINATURA (
    id_assinatura INT AUTO_INCREMENT PRIMARY KEY,
    data_inicio DATE NOT NULL,
    status ENUM('Ativa', 'Hiato', 'Cancelada') NOT NULL DEFAULT 'Ativa',
    motivo_cancelamento TEXT,
    id_cliente INT NOT NULL,
    id_obra INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente),
    FOREIGN KEY (id_obra) REFERENCES OBRA(id_obra)
);

CREATE TABLE VENDA (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    data_venda DATETIME DEFAULT CURRENT_TIMESTAMP,
    valor_total DECIMAL(10, 2) NOT NULL,
    mensagem_presente TEXT,
    id_cliente INT NOT NULL,
    id_funcionario INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente),
    FOREIGN KEY (id_funcionario) REFERENCES FUNCIONARIO(id_funcionario)
);

CREATE TABLE ITEM_VENDA (
    id_venda INT NOT NULL,
    id_volume INT NOT NULL,
    quantidade INT NOT NULL,
    preco_praticado DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (id_venda, id_volume),
    FOREIGN KEY (id_venda) REFERENCES VENDA(id_venda),
    FOREIGN KEY (id_volume) REFERENCES VOLUME(id_volume)
);
