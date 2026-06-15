-- consultas.sql
-- Operações de manipulação e consulta de dados

PRAGMA foreign_keys = ON;

-- 1. Consultar todos os serviços ativos com trabalhador e categoria
SELECT
    s.id_servico,
    s.titulo,
    s.descricao,
    s.valor_referencia,
    t.nome AS trabalhador,
    t.telefone,
    t.regiao,
    t.horario_atendimento,
    c.nome AS categoria
FROM servicos s
INNER JOIN trabalhadores t ON s.id_trabalhador = t.id_trabalhador
INNER JOIN categorias c ON s.id_categoria = c.id_categoria
WHERE s.ativo = 1 AND t.ativo = 1
ORDER BY c.nome, t.nome;

-- 2. Consultar serviços por categoria
SELECT
    s.titulo,
    t.nome AS trabalhador,
    t.telefone,
    c.nome AS categoria
FROM servicos s
INNER JOIN trabalhadores t ON s.id_trabalhador = t.id_trabalhador
INNER JOIN categorias c ON s.id_categoria = c.id_categoria
WHERE c.nome = 'Alimentação';

-- 3. Inserir um novo trabalhador
INSERT INTO trabalhadores (nome, telefone, regiao, horario_atendimento)
VALUES ('Juliana Rocha', '(67) 99999-1007', 'Santa Terezinha', 'Segunda a sexta, das 9h às 17h');

-- 4. Inserir um novo serviço para o trabalhador cadastrado
INSERT INTO servicos (id_trabalhador, id_categoria, titulo, descricao, valor_referencia)
VALUES (7, 7, 'Ajustes e pequenos consertos de roupas', 'Serviços de costura, bainha e pequenos ajustes.', 45.00);

-- 5. Atualizar o horário de atendimento de um trabalhador
UPDATE trabalhadores
SET horario_atendimento = 'Segunda a sábado, das 8h às 19h'
WHERE id_trabalhador = 1;

-- 6. Atualizar o valor de referência de um serviço
UPDATE servicos
SET valor_referencia = 90.00
WHERE id_servico = 1;

-- 7. Remover logicamente um serviço, mantendo o registro no banco
UPDATE servicos
SET ativo = 0
WHERE id_servico = 6;

-- 8. Remover definitivamente um trabalhador de teste
-- Observação: por causa do ON DELETE CASCADE, os serviços desse trabalhador também serão removidos.
DELETE FROM trabalhadores
WHERE id_trabalhador = 7;

-- 9. Contar quantos serviços ativos existem em cada categoria
SELECT
    c.nome AS categoria,
    COUNT(s.id_servico) AS total_servicos_ativos
FROM categorias c
LEFT JOIN servicos s ON c.id_categoria = s.id_categoria AND s.ativo = 1
GROUP BY c.id_categoria, c.nome
ORDER BY total_servicos_ativos DESC, c.nome;
