USE ComicTavern;

-- --- UPDATES ---
-- 1. Atualizar preço de capa
UPDATE VOLUME SET preco_capa = 45.90 WHERE id_volume = 1;

-- 2. Atualizar telefone do cliente
UPDATE CLIENTE SET telefone = '(11) 90000-0000' WHERE id_cliente = 1;

-- 3. Pausar assinatura de um cliente
UPDATE ASSINATURA SET status = 'Pausada' WHERE id_cliente = 1 AND id_obra = 1;


-- --- DELETES ---
-- 1. Remover um item específico de uma venda (Devolução)
DELETE FROM ITEM_VENDA WHERE id_venda = 1 AND id_volume = 2;

-- 2. Remover assinaturas canceladas antigas
DELETE FROM ASSINATURA WHERE status = 'Cancelada';

-- 3. Remover funcionário demitido
-- Só funciona se ele não tiver vendas. 
DELETE FROM FUNCIONARIO WHERE id_funcionario = 99;
