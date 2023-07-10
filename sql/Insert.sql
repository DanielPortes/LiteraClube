--Leitores
INSERT INTO leitor(nome, data_nasc, login, senha, email)
VALUES ('Jaqueline', '2002-01-12', 'jaque.lamas', 'senha', 'jaque.lamas@exemplo.com');

INSERT INTO leitor(nome, data_nasc, login, senha, email)
VALUES ('Maria Fernanda', '2003-05-03', 'maria.silva', 'senha123', 'maria.fernanda@exemplo.com');

INSERT INTO leitor(nome, data_nasc, login, senha, email)
VALUES ('Bel Rodrigues', '1985-09-21', 'bel.rodrigues', 'abcd1234', 'bel.rodrigues@exemplo.com');

INSERT INTO leitor(nome, data_nasc, login, senha, email)
VALUES ('Daniel', '1985-09-21', 'daniel.fagundes', 'senha123', 'daniel.fagundes@exemplo.com');

INSERT INTO leitor(nome, data_nasc, login, senha, email)
VALUES ('Rafaela', '1999-07-18', 'rafaela.santos', 'senha456', 'rafaela.santos@exemplo.com');

INSERT INTO leitor(nome, data_nasc, login, senha, email)
VALUES ('Gabriel', '1997-03-10', 'gabriel.rocha', 'minhasenha', 'gabriel.rocha@exemplo.com');

INSERT INTO leitor(nome, data_nasc, login, senha, email)
VALUES ('Carolina', '1990-09-05', 'carol.souza', '123456', 'carolina.souza@exemplo.com');

INSERT INTO leitor(nome, data_nasc, login, senha, email)
VALUES ('Lucas', '1993-12-22', 'lucas.silva', 'senha789', 'lucas.silva@exemplo.com');

INSERT INTO leitor(nome, data_nasc, login, senha, email)
VALUES ('Pamela Gonçalves', '1995-08-14', 'pamela.goncalves', 'minhasenha123', 'pamela.goncalves@exemplo.com');

--Criadores

INSERT INTO criador
VALUES (9, '(32)999152463');

INSERT INTO criador
VALUES (3, '(31)999155228');

-- Autor
-- Inserção dos autores dos livros
INSERT INTO autor (nome, pseudonimo, data_nasc)
VALUES ('Taylor Jenkins Reid', NULL, '1983-03-25');

INSERT INTO autor (nome, pseudonimo, data_nasc)
VALUES ('Stephen King', NULL, '1947-09-21');

INSERT INTO autor (nome, pseudonimo, data_nasc)
VALUES ('Agatha Christie', NULL, '1890-09-15');

INSERT INTO autor (nome, pseudonimo, data_nasc)
VALUES ('George Orwell', NULL, '1903-06-25');

INSERT INTO autor (nome, pseudonimo, data_nasc)
VALUES ('Harper Lee', NULL, '1926-04-28');

INSERT INTO autor (nome, pseudonimo, data_nasc)
VALUES ('Daniel Handler', 'Lemony Snicket', '1970-02-28');

INSERT INTO autor (nome, pseudonimo, data_nasc)
VALUES ('Jane Austen', NULL, '1775-12-16');

INSERT INTO autor (nome, pseudonimo, data_nasc)
VALUES ('F. Scott Fitzgerald', NULL, '1896-09-24');

INSERT INTO autor (nome, pseudonimo, data_nasc)
VALUES ('Herman Melville', NULL, '1819-08-01');

INSERT INTO autor (nome, pseudonimo, data_nasc)
VALUES ('Homero', NULL, NULL);

INSERT INTO autor (nome, pseudonimo, data_nasc)
VALUES ('Oscar Wilde', NULL, '1854-10-16');

INSERT INTO autor (nome, pseudonimo, data_nasc)
VALUES ('Fiódor Dostoiévski', NULL, '1821-11-11');

INSERT INTO autor (nome, pseudonimo, data_nasc)
VALUES ('Gabriel García Márquez', NULL, '1927-03-06');

INSERT INTO autor (nome, pseudonimo, data_nasc)
VALUES ('Paulo Coelho', NULL, '1947-08-24');


--Editora
INSERT INTO editora (nome, email, telefone)
VALUES ('Companhia das Letras', 'contato@companhiadasletras.com.br', '+55-11-1234-5678');

INSERT INTO editora (nome, email, telefone)
VALUES ('Editora Intrínseca', 'contato@editoraintrinseca.com.br', '+55-21-9876-5432');

INSERT INTO editora (nome, email, telefone)
VALUES ('Editora Record', 'contato@editorarecord.com.br', '+55-21-5555-5555');

INSERT INTO editora (nome, email, telefone)
VALUES ('HarperCollins Brasil', 'contato@harpercollins.com.br', '+55-11-9876-5432');

INSERT INTO editora (nome, email, telefone)
VALUES ('Editora Paralela', 'contato@editoraparalela.com.br', '+55-11-9876-5432');

--Livros

INSERT INTO livro (titulo, num_paginas, id_editora)
VALUES ('Mau Começo', 200, 1);

INSERT INTO livro (titulo, num_paginas, id_editora)
VALUES ('A Sala dos Répteis', 220, 1);

INSERT INTO livro (titulo, num_paginas, id_editora)
VALUES ('O Elevador Ersatz', 180, 1);

INSERT INTO livro (titulo, num_paginas, id_editora)
VALUES ('Assassinato no Expresso Oriente', 300, 4);

INSERT INTO livro (titulo, num_paginas, id_editora)
VALUES ('E Não Sobrou Nenhum', 250, 4);

INSERT INTO livro (titulo, num_paginas, id_editora)
VALUES ('O Assassinato de Roger Ackroyd', 280, 4);

INSERT INTO livro (titulo, num_paginas, id_editora)
VALUES ('Daisy Jones & The Six', 368, 5);

INSERT INTO livro (titulo, num_paginas, id_editora)
VALUES ('Os Sete Maridos de Evelyn Hugo', 400, 5);

INSERT INTO livro (titulo, num_paginas, id_editora)
VALUES ('Festa no Covil', 384, 5);

INSERT INTO livro (titulo, num_paginas, id_editora)
VALUES ('O Misterioso Caso de Styles', 256, 4);

INSERT INTO livro (titulo, num_paginas, id_editora)
VALUES ('Orgulho e Preconceito', 432, 2);

INSERT INTO livro (titulo, num_paginas, id_editora)
VALUES ('O Grande Gatsby', 180, 3);

INSERT INTO livro (titulo, num_paginas, id_editora)
VALUES ('O Sol é para Todos', 336, 3);

INSERT INTO livro (titulo, num_paginas, id_editora)
VALUES ('1984', 328, 3);

INSERT INTO livro (titulo, num_paginas, id_editora)
VALUES ('Admirável Mundo Novo', 288, 3);

INSERT INTO livro (titulo, num_paginas, id_editora)
VALUES ('O Apanhador no Campo de Centeio', 224, 3);

INSERT INTO livro (titulo, num_paginas, id_editora)
VALUES ('O Hobbit', 310, 2);

INSERT INTO livro (titulo, num_paginas, id_editora)
VALUES ('O Senhor dos Anéis', 1178, 2);

INSERT INTO livro (titulo, num_paginas, id_editora)
VALUES ('Ao Farol', 209, 1);

INSERT INTO livro (titulo, num_paginas, id_editora)
VALUES ('Moby-Dick', 635, 2);

INSERT INTO livro (titulo, num_paginas, id_editora)
VALUES ('A Odisseia', 442, 3);

INSERT INTO livro (titulo, num_paginas, id_editora)
VALUES ('O Retrato de Dorian Gray', 194, 4);

--Listas

INSERT INTO lista (titulo, descricao, id_leitor)
VALUES ('To be read', 'Lista de livros que pretendo ler em 2023', 1);

INSERT INTO lista (titulo, descricao, id_leitor)
VALUES ('Favoritos', 'Lista de livros favoritos', 3);

-- Livros nas listas

INSERT INTO listaLivro (id_lista, id_livro)
VALUES (1, 7);

INSERT INTO listaLivro (id_lista, id_livro)
VALUES (1, 8);

INSERT INTO listaLivro (id_lista, id_livro)
VALUES (1, 9);

INSERT INTO listaLivro (id_lista, id_livro)
VALUES (2, 1);

INSERT INTO listaLivro (id_lista, id_livro)
VALUES (2, 2);

INSERT INTO listaLivro (id_lista, id_livro)
VALUES (2, 3);


---Clubes
INSERT INTO clube (nome, tema, data_criacao, id_criador)
VALUES ('Clube da Rainha', 'Agatha Christie', '2019-07-02', 3);

INSERT INTO clube (nome, tema, data_criacao, id_criador)
VALUES ('Favoritos da Pam', 'Livros da Pam Gonçalves', '2019-07-02', 9);

INSERT INTO clube (nome, tema, data_criacao, id_criador)
VALUES ('Clube dos 5', 'Livros diversos', '2019-07-02', 9);

--Participacao
INSERT INTO participacao (id_leitor, id_clube, data_inicio)
VALUES (1, 1, '2021-01-01');

INSERT INTO participacao (id_leitor, id_clube, data_inicio)
VALUES (3, 1, '2021-01-01');

INSERT INTO participacao (id_leitor, id_clube, data_inicio)
VALUES (2, 1, '2021-01-01');

INSERT INTO participacao (id_leitor, id_clube, data_inicio)
VALUES (4, 1, '2021-01-01');

INSERT INTO participacao (id_leitor, id_clube, data_inicio)
VALUES (5, 1, '2021-01-01');

INSERT INTO participacao (id_leitor, id_clube, data_inicio)
VALUES (6, 1, '2021-01-01');

INSERT INTO participacao (id_leitor, id_clube, data_inicio)
VALUES (7, 1, '2021-01-01');

INSERT INTO participacao (id_leitor, id_clube, data_inicio)
VALUES (1, 2, '2021-01-01');

INSERT INTO participacao (id_leitor, id_clube, data_inicio)
VALUES (3, 2, '2021-01-01');

INSERT INTO participacao (id_leitor, id_clube, data_inicio)
VALUES (2, 2, '2021-01-01');

INSERT INTO participacao (id_leitor, id_clube, data_inicio)
VALUES (4, 2, '2021-01-01');

INSERT INTO participacao (id_leitor, id_clube, data_inicio)
VALUES (9, 2, '2021-01-01');

INSERT INTO participacao (id_leitor, id_clube, data_inicio)
VALUES (5, 2, '2021-01-01');

INSERT INTO participacao (id_leitor, id_clube, data_inicio)
VALUES (6, 2, '2021-01-01');

--INSERT INTO participacao (id_leitor, id_clube, data_inicio)
--VALUES (7, 2, '2018-01-01');

INSERT INTO participacao (id_leitor, id_clube, data_inicio)
VALUES (8, 2, '2021-01-01');

--Enquete
INSERT INTO enquete (id_clube, data_inicio, data_fim)
VALUES (2, '2023-07-02', '2023-07-10');

--Livros enquete
INSERT INTO enqueteLivro (id_enquete, id_livro)
VALUES (1, 7);

INSERT INTO enqueteLivro (id_enquete, id_livro)
VALUES (1, 8);

INSERT INTO enqueteLivro (id_enquete, id_livro)
VALUES (1, 9);

-- Votos das enquetes

INSERT INTO voto (id_leitor, id_enquete, id_livro, data_voto)
VALUES (1, 1, 7, '2023-07-02');

--INSERT INTO voto (id_leitor, id_enquete, id_livro, data_voto)
--VALUES (2, 1, 7, '2024-07-02');

INSERT INTO voto (id_leitor, id_enquete, id_livro, data_voto)
VALUES (4, 1, 7, '2023-07-02');

--INSERT INTO voto (id_leitor, id_enquete, id_livro, data_voto)
--VALUES (5, 1, 7, '2023-07-02');

--Leituras do clube

INSERT INTO leituraClube (id_clube, id_livro, data_inicio)
VALUES (1, 6, '2021-04-10');

INSERT INTO leituraClube (id_clube, id_livro, data_inicio)
VALUES (1, 4, '2021-06-15');

INSERT INTO leituraClube (id_clube, id_livro, data_inicio)
VALUES (1, 5, '2021-08-20');

INSERT INTO leituraClube (id_clube, id_livro, data_inicio)
VALUES (2, 1, '2021-04-05');

INSERT INTO leituraClube (id_clube, id_livro, data_inicio)
VALUES (2, 2, '2021-05-10');

INSERT INTO leituraClube (id_clube, id_livro, data_inicio)
VALUES (2, 3, '2021-06-15');

-- Livro 4
INSERT INTO leituraClube (id_clube, id_livro, data_inicio)
VALUES (2, 4, '2021-10-15');

-- Livro 5
INSERT INTO leituraClube (id_clube, id_livro, data_inicio)
VALUES (2, 5, '2021-12-15');

-- Livro 6
INSERT INTO leituraClube (id_clube, id_livro, data_inicio)
VALUES (2, 6, '2022-02-15');

-- Livro 7
INSERT INTO leituraClube (id_clube, id_livro, data_inicio)
VALUES (2, 7, '2022-03-15');

-- Livro 8
INSERT INTO leituraClube (id_clube, id_livro, data_inicio)
VALUES (2, 8, '2022-05-15');

-- Livro 9
INSERT INTO leituraClube (id_clube, id_livro, data_inicio)
VALUES (2, 9, '2022-06-15');

-- Livro 10
INSERT INTO leituraClube (id_clube, id_livro, data_inicio)
VALUES (2, 10, '2022-08-15');

-- Livro 11
INSERT INTO leituraClube (id_clube, id_livro, data_inicio)
VALUES (2, 11, '2022-09-15');

-- Livro 12
INSERT INTO leituraClube (id_clube, id_livro, data_inicio)
VALUES (2, 12, '2022-11-15');

-- Livro 13
INSERT INTO leituraClube (id_clube, id_livro, data_inicio)
VALUES (2, 13, '2023-01-15');

-- Livro 14
INSERT INTO leituraClube (id_clube, id_livro, data_inicio)
VALUES (2, 14, '2023-02-15');

-- Livro 15
INSERT INTO leituraClube (id_clube, id_livro, data_inicio)
VALUES (2, 15, '2023-04-15');

--Clube 3

INSERT INTO leituraClube (id_clube, id_livro, data_inicio)
VALUES (3, 4, '2021-10-15');

-- Livro 5
INSERT INTO leituraClube (id_clube, id_livro, data_inicio)
VALUES (3, 5, '2021-12-15');

-- Livro 6
INSERT INTO leituraClube (id_clube, id_livro, data_inicio)
VALUES (3, 6, '2022-02-15');

-- Livro 7
INSERT INTO leituraClube (id_clube, id_livro, data_inicio)
VALUES (3, 7, '2022-03-15');

-- Livro 8
INSERT INTO leituraClube (id_clube, id_livro, data_inicio)
VALUES (3, 8, '2022-05-15');

-- Livro 9
INSERT INTO leituraClube (id_clube, id_livro, data_inicio)
VALUES (3, 9, '2022-06-15');

-- Livro 10
INSERT INTO leituraClube (id_clube, id_livro, data_inicio)
VALUES (3, 10, '2022-08-15');

-- Livro 11
INSERT INTO leituraClube (id_clube, id_livro, data_inicio)
VALUES (3, 11, '2022-09-15');

-- Livro 12
INSERT INTO leituraClube (id_clube, id_livro, data_inicio)
VALUES (3, 12, '2022-11-15');

-- Livro 13
INSERT INTO leituraClube (id_clube, id_livro, data_inicio)
VALUES (1, 12, '2022-11-15');

--Discussoes do clube
INSERT INTO discussaoFinal (id_leitura, data_final)
VALUES (1, '2021-05-20');

INSERT INTO discussaoFinal (id_leitura, data_final)
VALUES (2, '2021-07-25');

INSERT INTO discussaoFinal (id_leitura, data_final)
VALUES (3, '2021-09-30');

INSERT INTO discussaoFinal (id_leitura, data_final)
VALUES (4, '2021-05-30');

INSERT INTO discussaoFinal (id_leitura, data_final)
VALUES (5, '2021-06-30');

INSERT INTO discussaoFinal (id_leitura, data_final)
VALUES (6, '2021-07-31');

--INSERT INTO discussaoFinal (id_leitura, data_final)
--VALUES (27, '2017-07-31');


--Participacao na discussao da leitura do clube

INSERT INTO participa (id_leitura, id_leitor, nota)
VALUES (1, 1, 4.5);

INSERT INTO participa (id_leitura, id_leitor, nota)
VALUES (1, 4, 3.8);

INSERT INTO participa (id_leitura, id_leitor, nota)
VALUES (1, 2, 4.2);

INSERT INTO participa (id_leitura, id_leitor, nota)
VALUES (1, 3, 4.7);


INSERT INTO participa (id_leitura, id_leitor, nota)
VALUES (2, 1, 4.5);

INSERT INTO participa (id_leitura, id_leitor, nota)
VALUES (2, 4, 3.8);

INSERT INTO participa (id_leitura, id_leitor, nota)
VALUES (3, 2, 4.2);

INSERT INTO participa (id_leitura, id_leitor, nota)
VALUES (4, 3, 4.7);

INSERT INTO participa (id_leitura, id_leitor, nota)
VALUES (3, 1, 4.5);

INSERT INTO participa (id_leitura, id_leitor, nota)
VALUES (4, 1, 4.0);

INSERT INTO participa (id_leitura, id_leitor, nota)
VALUES (5, 1, 4.5);

INSERT INTO participa (id_leitura, id_leitor, nota)
VALUES (3, 4, 3.8);

INSERT INTO participa (id_leitura, id_leitor, nota)
VALUES (4, 2, 4.2);

INSERT INTO participa (id_leitura, id_leitor, nota)
VALUES (5, 3, 4.7);

INSERT INTO participa (id_leitura, id_leitor, nota)
VALUES (6, 1, 4.5);




--- Parceria
INSERT INTO parceria (id_leitor, id_editora, data_inicio, data_validade)
VALUES (3, 4, '2021-07-01', '2023-12-31');
--Cupom
--INSERT INTO cupom (id_leitor, id_editora, codigo, data_inicio, data_fim)
--VALUES (3, 4, 'CARIBE15', '2020-08-02', '2020-09-30');

INSERT INTO cupom (id_leitor, id_editora, codigo, data_inicio, data_fim)
VALUES (3, 4, 'Evans10', '2023-08-02', '2023-09-30');

INSERT INTO cupom (id_leitor, id_editora, codigo, data_inicio, data_fim)
VALUES (3, 4, 'NILO15', '2021-08-02', '2021-09-30');




--Definindo os autores dos livros
INSERT INTO escrita (id_livro, id_autor)
VALUES (1, 7);

INSERT INTO escrita (id_livro, id_autor)
VALUES (2, 7);

INSERT INTO escrita (id_livro, id_autor)
VALUES (3, 7);

INSERT INTO escrita (id_livro, id_autor)
VALUES (4, 3);

INSERT INTO escrita (id_livro, id_autor)
VALUES (5, 3);

INSERT INTO escrita (id_livro, id_autor)
VALUES (6, 2);

INSERT INTO escrita (id_livro, id_autor)
VALUES (7, 2);

INSERT INTO escrita (id_livro, id_autor)
VALUES (8, 2);

INSERT INTO escrita (id_livro, id_autor)
VALUES (9, 2);

INSERT INTO escrita (id_livro, id_autor)
VALUES (10, 4);

INSERT INTO escrita (id_livro, id_autor)
VALUES (11, 5);

INSERT INTO escrita (id_livro, id_autor)
VALUES (12, 5);

INSERT INTO escrita (id_livro, id_autor)
VALUES (13, 6);

INSERT INTO escrita (id_livro, id_autor)
VALUES (14, 6);

INSERT INTO escrita (id_livro, id_autor)
VALUES (15, 6);

INSERT INTO escrita (id_livro, id_autor)
VALUES (16, 6);

INSERT INTO escrita (id_livro, id_autor)
VALUES (17, 6);

INSERT INTO escrita (id_livro, id_autor)
VALUES (18, 2);

INSERT INTO escrita (id_livro, id_autor)
VALUES (19, 2);

INSERT INTO escrita (id_livro, id_autor)
VALUES (20, 7);

INSERT INTO escrita (id_livro, id_autor)
VALUES (21, 3);

INSERT INTO escrita (id_livro, id_autor)
VALUES (22, 3);

---
  INSERT INTO leitura (id_leitor, id_livro, data_inicio)
VALUES (3, 1, '2020-01-01');

INSERT INTO leitura (id_leitor, id_livro, data_inicio)
VALUES (3, 2, '2020-02-15');

INSERT INTO leitura (id_leitor, id_livro, data_inicio)
VALUES (3, 3, '2020-05-10');

INSERT INTO leitura (id_leitor, id_livro, data_inicio)
VALUES (3, 4, '2021-03-20');

INSERT INTO leitura (id_leitor, id_livro, data_inicio)
VALUES (3, 5, '2021-06-05');

INSERT INTO leitura (id_leitor, id_livro, data_inicio)
VALUES (3, 6, '2022-01-10');

INSERT INTO leitura (id_leitor, id_livro, data_inicio)
VALUES (3, 7, '2022-08-15');

INSERT INTO leitura (id_leitor, id_livro, data_inicio)
VALUES (3, 8, '2023-02-28');

INSERT INTO leitura (id_leitor, id_livro, data_inicio)
VALUES (3, 9, '2023-07-10');

INSERT INTO leitura (id_leitor, id_livro, data_inicio)
VALUES (1, 1, '2020-01-15');

INSERT INTO leitura (id_leitor, id_livro, data_inicio)
VALUES (1, 2, '2020-02-20');

INSERT INTO leitura (id_leitor, id_livro, data_inicio)
VALUES (1, 3, '2020-05-01');

INSERT INTO leitura (id_leitor, id_livro, data_inicio)
VALUES (1, 4, '2021-03-05');


--Resenhas

INSERT INTO resenha (id_leitor, id_livro, data_fim, nota, titulo, texto)
VALUES (3, 1, '2020-02-01', 4.0, 'Ótimo livro', 'Gostei muito desse livro. A trama é envolvente e os personagens são cativantes.');

INSERT INTO resenha (id_leitor, id_livro, data_fim, nota, titulo, texto)
VALUES (3, 2, '2020-03-10', 4.0, 'Recomendo', 'Uma história intrigante e cheia de reviravoltas. Fiquei ansioso para saber o desfecho.');

INSERT INTO resenha (id_leitor, id_livro, data_fim, nota, titulo, texto)
VALUES (3, 3, '2020-06-20', 3.8, 'Interessante', 'Achei a trama um pouco previsível, mas ainda assim foi uma leitura agradável.');

INSERT INTO resenha (id_leitor, id_livro, data_fim, nota, titulo, texto)
VALUES (3, 4, '2021-04-10', 4.7, 'Surpreendente', 'Esse livro me deixou sem fôlego do início ao fim. Recomendo para quem gosta de mistérios.');

INSERT INTO resenha (id_leitor, id_livro, data_fim, nota, titulo, texto)
VALUES (3, 5, '2021-07-25', 4.3, 'Vale a pena', 'Uma trama instigante e personagens bem desenvolvidos. Não consegui largar o livro.');

INSERT INTO resenha (id_leitor, id_livro, data_fim, nota, titulo, texto)
VALUES (3, 6, '2022-02-15', 3.5, 'Ok', 'Esperava mais desse livro, mas ainda assim foi uma leitura razoável.');

INSERT INTO resenha (id_leitor, id_livro, data_fim, nota, titulo, texto)
VALUES (3, 7, '2022-09-30', 4.8, 'Incrível', 'Uma história emocionante e com personagens memoráveis. Não consigo parar de pensar nesse livro.');

INSERT INTO resenha (id_leitor, id_livro, data_fim, nota, titulo, texto)
VALUES (3, 8, '2023-03-15', 4.6, 'Maravilhoso', 'Uma narrativa envolvente e personagens cativantes.');

INSERT INTO resenha (id_leitor, id_livro, data_fim, nota, titulo, texto)
VALUES (3, 9, '2023-07-15', 4.2, 'Recomendo', 'Um livro fascinante que me prendeu do início ao fim.');

INSERT INTO resenha (id_leitor, id_livro, data_fim, nota, titulo, texto)
VALUES (1, 1, '2020-02-01', 4.2, 'Recomendo', 'Uma história envolvente que me cativou desde o começo.');

INSERT INTO resenha (id_leitor, id_livro, data_fim, nota, titulo, texto)
VALUES (1, 2, '2020-03-15', 4.8, 'Excelente livro', 'Fiquei surpreso com as reviravoltas e adorei o desfecho.');

INSERT INTO resenha (id_leitor, id_livro, data_fim, nota, titulo, texto)
VALUES (1, 3, '2020-06-25', 3.5, 'Leitura interessante', 'Embora a trama tenha sido um pouco previsível, ainda aproveitei a leitura.');

INSERT INTO resenha (id_leitor, id_livro, data_fim, nota, titulo, texto)
VALUES (1, 4, '2021-04-20', 4.5, 'Incrível', 'Esse livro me prendeu do início ao fim. Recomendo para os fãs de mistério.');


