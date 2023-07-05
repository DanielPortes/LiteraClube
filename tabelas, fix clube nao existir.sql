CREATE TABLE leitor(
  id_leitor serial PRIMARY KEY,
  nome varchar (200) NOT NULL,
  data_nasc date,
  login varchar (100) unique NOT NULL,
  senha varchar (50) NOT NULL,
  email varchar (200) unique NOT NULL
);

CREATE TABLE criador(
  id_leitor serial REFERENCES leitor (id_leitor) ON UPDATE CASCADE ON DELETE CASCADE,
  telefone varchar (50) NOT NULL,
  PRIMARY KEY (id_leitor)
);

CREATE TABLE autor(
  id_autor serial PRIMARY KEY,
  nome varchar (200) NOT NULL,
  pseudonimo varchar (200) UNIQUE,
  data_nasc date 
);

CREATE TABLE editora(
  id_editora serial PRIMARY KEY,
  nome varchar (200) UNIQUE NOT NULL,
  email varchar (200) UNIQUE NOT NULL,
  telefone varchar (50) NOT NULL
);


CREATE TABLE livro(
  id_livro serial PRIMARY KEY,
  titulo varchar (100) NOT NULL,
  num_paginas integer NOT NULL,
  id_editora integer NOT NULL REFERENCES editora (id_editora) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE lista(
  id_lista serial PRIMARY KEY,
  titulo varchar (100) NOT NULL,
  descricao varchar (100000),
  id_leitor integer NOT NULL REFERENCES leitor (id_leitor) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE listaLivro(
  id_lista serial NOT NULL REFERENCES lista (id_lista)  ON UPDATE CASCADE ON DELETE CASCADE,
  id_livro serial NOT NULL REFERENCES livro (id_livro)  ON UPDATE CASCADE ON DELETE CASCADE,
  PRIMARY KEY (id_lista, id_livro)
);



CREATE TABLE clube(
  id_clube serial PRIMARY KEY,
  nome varchar (200) UNIQUE NOT NULL,
  tema varchar (200) NOT NULL,
  data_criacao date NOT NULL,
  id_criador integer NOT NULL REFERENCES criador (id_leitor) ON UPDATE CASCADE ON DELETE CASCADE
);



CREATE TABLE participacao(
  id_leitor integer NOT NULL REFERENCES leitor (id_leitor) ON UPDATE CASCADE ON DELETE CASCADE,
  id_clube integer NOT NULL REFERENCES clube (id_clube) ON UPDATE CASCADE ON DELETE CASCADE,
  data_inicio date NOT NULL,
  PRIMARY KEY (id_leitor, id_clube)
);


CREATE TABLE enquete(
  id_enquete serial PRIMARY KEY,
  id_clube integer NOT NULL REFERENCES clube (id_clube) ON UPDATE CASCADE ON DELETE CASCADE,
  data_inicio date NOT NULL,
  data_fim date NOT NULL
);

CREATE TABLE enqueteLivro(
  id_enquete integer NOT NULL REFERENCES enquete (id_enquete) ON UPDATE CASCADE ON DELETE CASCADE,
  id_livro integer NOT NULL REFERENCES livro (id_livro) ON UPDATE CASCADE ON DELETE CASCADE,
  PRIMARY KEY (id_enquete, id_livro)
);

CREATE TABLE voto(
  id_leitor integer NOT NULL REFERENCES leitor (id_leitor) ON UPDATE CASCADE ON DELETE CASCADE,
  id_enquete integer NOT NULL REFERENCES enquete (id_enquete) ON UPDATE CASCADE ON DELETE CASCADE,
  id_livro integer NOT NULL REFERENCES livro (id_livro) ON UPDATE CASCADE ON DELETE CASCADE,
  data_voto date NOT NULL,
  PRIMARY KEY (id_leitor, id_enquete, id_livro)
);



CREATE TABLE leituraClube(
  id_leitura serial PRIMARY KEY,
  id_clube integer NOT NULL REFERENCES clube (id_clube) ON UPDATE CASCADE ON DELETE CASCADE,
  id_livro integer NOT NULL REFERENCES livro (id_livro) ON UPDATE CASCADE ON DELETE CASCADE,
  data_inicio date NOT NULL
);

ALTER TABLE leituraClube ADD CONSTRAINT unicidade_leitura  UNIQUE (id_clube, id_livro, data_inicio);

CREATE TABLE discussaoFinal(
  id_leitura serial REFERENCES leituraClube (id_leitura) ON UPDATE CASCADE ON DELETE CASCADE,
  data_final date NOT NULL,
  PRIMARY KEY (id_leitura)
);

CREATE TABLE participa(
  id_leitura integer NOT NULL REFERENCES discussaoFinal (id_leitura) ON UPDATE CASCADE ON DELETE CASCADE,
  id_leitor integer NOT NULL REFERENCES leitor (id_leitor) ON UPDATE CASCADE ON DELETE CASCADE,
  nota numeric(2,1) CHECK (nota >= 1 AND nota <= 5) NOT NULL,
  PRIMARY KEY (id_leitura, id_leitor)
);

CREATE TABLE leitura(
  id_leitor integer NOT NULL REFERENCES leitor (id_leitor) ON UPDATE CASCADE ON DELETE CASCADE ,
  id_livro integer NOT NULL REFERENCES livro (id_livro) ON UPDATE CASCADE ON DELETE CASCADE,
  data_inicio date NOT NULL,
  PRIMARY KEY (id_leitor, id_livro)
);

CREATE TABLE resenha(
  id_leitor integer NOT NULL,
  id_livro integer NOT NULL,
  data_fim date NOT NULL,
  nota numeric(2,1) CHECK (nota >= 1 AND nota <= 5) NOT NULL,
  titulo varchar (100) NOT NULL,
  texto varchar (1000000) NOT NULL,
  PRIMARY KEY (id_leitor, id_livro)
);

ALTER TABLE resenha ADD FOREIGN KEY (id_leitor,id_livro) REFERENCES leitura(id_leitor,id_livro) ON UPDATE CASCADE ON DELETE CASCADE;

CREATE TABLE escrita(
  id_livro integer NOT NULL REFERENCES livro (id_livro) ON UPDATE CASCADE ON DELETE CASCADE,
  id_autor integer NOT NULL REFERENCES autor (id_autor) ON UPDATE CASCADE ON DELETE CASCADE,
  PRIMARY KEY (id_livro, id_autor)
);

CREATE TABLE parceria(
  id_leitor integer NOT NULL REFERENCES criador (id_leitor) ON UPDATE CASCADE ON DELETE CASCADE,
  id_editora integer NOT NULL REFERENCES editora (id_editora) ON UPDATE CASCADE ON DELETE CASCADE,
  data_inicio date NOT NULL,
  data_validade date check (data_validade>data_inicio) NOT NULL,
  PRIMARY KEY (id_leitor, id_editora)
);

CREATE TABLE cupom(
  id_cupom serial PRIMARY KEY,
  id_leitor integer NOT NULL,
  id_editora integer NOT NULL,
  codigo varchar(20) NOT NULL,
  data_inicio date NOT NULL,
  data_fim date NOT NULL
);

ALTER TABLE cupom ADD FOREIGN KEY (id_leitor,id_editora) REFERENCES parceria (id_leitor,id_editora) ON UPDATE CASCADE ON DELETE CASCADE;

--Restrição de voto
CREATE OR REPLACE FUNCTION validar_voto() RETURNS TRIGGER AS $$
  BEGIN
IF NOT EXISTS (
  SELECT 1
  FROM participacao p 
  JOIN enquete e ON p.id_clube = e.id_clube
  WHERE p.id_leitor = NEW.id_leitor
  AND e.id_enquete = NEW.id_enquete
  AND NEW.data_voto BETWEEN e.data_inicio AND e.data_fim
) THEN
RAISE EXCEPTION 'O voto não é válido para o leitor e enquete especificados.';
END IF;

RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER validar_voto_trigger
BEFORE INSERT ON voto
FOR EACH ROW
EXECUTE FUNCTION validar_voto();


CREATE OR REPLACE FUNCTION validar_parceria() RETURNS TRIGGER AS $$
  BEGIN
IF NOT EXISTS (
  SELECT 1
  FROM parceria p
  WHERE p.id_leitor = NEW.id_leitor
  AND p.id_editora = NEW.id_editora
  AND NEW.data_inicio > p.data_inicio
  AND NEW.data_fim > NEW.data_inicio
) THEN
RAISE EXCEPTION 'A data inválida.';
END IF;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER validar_parceria_trigger
BEFORE INSERT ON cupom
FOR EACH ROW
EXECUTE FUNCTION validar_parceria();


CREATE OR REPLACE FUNCTION validar_existencia_clube()
    RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM clube c
        WHERE c.id_clube = NEW.id_clube
          AND NEW.data_inicio < c.data_criacao
    ) THEN
        RAISE EXCEPTION 'O clube não existia nessa data.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_validar_existencia_clube
    BEFORE INSERT ON participacao
    FOR EACH ROW
EXECUTE FUNCTION validar_existencia_clube();



CREATE TRIGGER validar_participacao
BEFORE INSERT ON participacao
FOR EACH ROW
EXECUTE FUNCTION validar_existencia_clube();


CREATE TRIGGER validar_leituraClube
BEFORE INSERT ON leituraClube
FOR EACH ROW
EXECUTE FUNCTION validar_existencia_clube();


CREATE OR REPLACE FUNCTION validar_data_final() RETURNS TRIGGER AS $$
  BEGIN
IF NOT EXISTS (
  SELECT 1
  FROM leituraClube lc
  WHERE lc.id_leitura = NEW.id_leitura
  AND NEW.data_final >= lc.data_inicio
) THEN
RAISE EXCEPTION 'A discussao final deve aconter depois do da data que iniciou a leitura do livro.';
END IF;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER validar_discussao
BEFORE INSERT ON discussaoFinal
FOR EACH ROW
EXECUTE FUNCTION validar_data_final();
