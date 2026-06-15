-- schema.sql
-- Banco de dados da Plataforma Digital para Divulgação de Serviços de Trabalhadores Autônomos
-- SGBD indicado para teste: SQLite

PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS servicos;
DROP TABLE IF EXISTS trabalhadores;
DROP TABLE IF EXISTS categorias;

CREATE TABLE categorias (
    id_categoria INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL UNIQUE,
    descricao TEXT
);

CREATE TABLE trabalhadores (
    id_trabalhador INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    telefone TEXT NOT NULL,
    regiao TEXT NOT NULL,
    horario_atendimento TEXT,
    ativo INTEGER NOT NULL DEFAULT 1 CHECK (ativo IN (0, 1)),
    criado_em TEXT DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE servicos (
    id_servico INTEGER PRIMARY KEY AUTOINCREMENT,
    id_trabalhador INTEGER NOT NULL,
    id_categoria INTEGER NOT NULL,
    titulo TEXT NOT NULL,
    descricao TEXT NOT NULL,
    valor_referencia REAL,
    ativo INTEGER NOT NULL DEFAULT 1 CHECK (ativo IN (0, 1)),
    criado_em TEXT DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_trabalhador) REFERENCES trabalhadores(id_trabalhador) ON DELETE CASCADE,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria) ON DELETE RESTRICT
);
