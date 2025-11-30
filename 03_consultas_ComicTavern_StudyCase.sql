USE ComicTavern;

-- 1. CONSULTA SIMPLES COM ORDENAÇÃO (ORDER BY)
-- Objetivo: Listar os clientes em ordem alfabética para facilitar a busca.
SELECT nome_cliente, email, telefone
FROM CLIENTE
ORDER BY nome_cliente ASC;

-- 2. CONSULTA COM FILTRO (WHERE)
-- Objetivo: Achar os produtos "Premium" (Capa Dura).
SELECT numero_edicao, preco_capa, estoque_atual
FROM VOLUME
WHERE tipo_capa = 'Dura';

-- 3. CONSULTA COM JUNÇÃO (INNER JOIN) - OBRIGATÓRIA
-- Objetivo: Mostrar o nome da Obra junto com o nome da Editora (Cruzando as tabelas).
-- Explicação: "Estou pegando o Titulo na tabela Obra e o Nome na tabela Editora".
SELECT o.titulo AS Nome_Obra, e.nome_editora AS Editora
FROM OBRA o
INNER JOIN EDITORA e ON o.id_editora = e.id_editora;

-- 4. CONSULTA DE VENDAS SIMPLIFICADA (LIMIT)
-- Objetivo: Ver as 5 vendas mais caras da história da loja.
SELECT id_venda, data_venda, valor_total
FROM VENDA
ORDER BY valor_total DESC
LIMIT 5;
