-- dados.sql
-- Inserção de dados de exemplo para teste do banco

PRAGMA foreign_keys = ON;

INSERT INTO categorias (nome, descricao) VALUES
('Alimentação', 'Serviços relacionados à produção e venda de alimentos.'),
('Limpeza', 'Serviços de limpeza residencial e organização de ambientes.'),
('Manutenção', 'Serviços gerais de manutenção residencial.'),
('Elétrica', 'Serviços elétricos simples e instalações residenciais.'),
('Beleza', 'Serviços de cuidados pessoais e estética.'),
('Construção', 'Serviços de pequenos reparos e obras.'),
('Costura', 'Serviços de ajustes, consertos e produção de peças.'),
('Transporte', 'Serviços de frete, entrega e transporte local.');

INSERT INTO trabalhadores (nome, telefone, regiao, horario_atendimento) VALUES
('Maria Oliveira', '(67) 99999-1001', 'Santa Terezinha', 'Segunda a sábado, das 8h às 18h'),
('João Santos', '(67) 99999-1002', 'Santa Terezinha e bairros próximos', 'Segunda a sexta, das 7h às 17h'),
('Ana Paula', '(67) 99999-1003', 'Santa Terezinha', 'Terça a sábado, das 8h às 16h'),
('Carlos Mendes', '(67) 99999-1004', 'Aquidauana/MS', 'Segunda a sexta, das 8h às 18h'),
('Fernanda Lima', '(67) 99999-1005', 'Santa Terezinha', 'Quarta a sábado, das 9h às 19h'),
('Pedro Almeida', '(67) 99999-1006', 'Santa Terezinha', 'Segunda a sábado, das 8h às 17h');

INSERT INTO servicos (id_trabalhador, id_categoria, titulo, descricao, valor_referencia) VALUES
(1, 1, 'Bolos e salgados por encomenda', 'Produção de bolos, salgados e encomendas para pequenos eventos.', 80.00),
(2, 3, 'Pequenos reparos residenciais', 'Montagem de móveis, troca de fechaduras e manutenção geral.', 120.00),
(3, 2, 'Limpeza residencial', 'Serviços de limpeza residencial e organização de ambientes.', 150.00),
(4, 4, 'Serviços elétricos simples', 'Troca de tomadas, instalação de luminárias e pequenos reparos elétricos.', 100.00),
(5, 5, 'Corte de cabelo e manicure', 'Atendimento com horário marcado para serviços de beleza.', 60.00),
(6, 6, 'Pequenos serviços de construção', 'Reparos simples, pintura e apoio em pequenas obras residenciais.', 200.00);
