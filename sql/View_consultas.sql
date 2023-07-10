---Algumas consultas e visões implementadas
CREATE VIEW melhor_livro AS
SELECT l.id_livro, ROUND(avg_nota::numeric, 1) AS nota_media_maxima
FROM livro l
JOIN (
  SELECT id_livro, AVG(nota) AS avg_nota
  FROM resenha
  GROUP BY id_livro
) AS subquery ON l.id_livro = subquery.id_livro
WHERE subquery.avg_nota = (
  SELECT MAX(avg_nota)
  FROM (
    SELECT AVG(nota) AS avg_nota
    FROM resenha
    GROUP BY id_livro
  ) AS subquery2
);
SELECT * FROM melhor_livro; 


SELECT a.nome FROM melhor_livro ml natural join livro natural join escrita natural join autor a

SELECT c.id_clube, c.nome
FROM clube c
LEFT JOIN leituraClube lc ON lc.id_clube = c.id_clube AND lc.id_livro in (SELECT id_livro FROM melhor_livro)
WHERE lc.id_livro IS NULL;


SELECT * FROM parceria p right join criador c on (p.id_leitor=c.id_leitor) 

SELECT * FROM parceria p right join editora c on (p.id_editora=c.id_editora)

SELECT l.nome, n.nome
FROM (
  SELECT c.id_leitor, e.nome
  FROM criador c
  CROSS JOIN editora e
  LEFT JOIN parceria p ON p.id_leitor = c.id_leitor AND p.id_editora = e.id_editora
  WHERE p.id_leitor IS NULL
) n
INNER JOIN leitor l ON l.id_leitor = n.id_leitor;

--Clube com maior número de participantes
SELECT id_clube, nome
FROM (
  SELECT id_clube, nome, COUNT(*) AS num_participantes
  FROM clube
  NATURAL JOIN participacao
  GROUP BY id_clube
) AS n
WHERE num_participantes = (
  SELECT MAX(num_participantes)
  FROM (
    SELECT id_clube, COUNT(*) AS num_participantes
    FROM clube
    NATURAL JOIN participacao
    GROUP BY id_clube
  ) AS subquery
);
-- Leitor e os livros que ele ja leu, e os livros que ele ainda pode ler que estao cadastrados no sistema

SELECT id_livro, titulo FROM livro 
EXCEPT
SELECT id_livro, titulo FROM leitura natural join livro natural join leitor where id_leitor = 1;

--Discussoes do clube da rainha

SELECT l.nome, p.id_leitura FROM participa p natural join leitor l where  (SELECT df.id_leituraClube FROM discussaoFinal df natural join leituraClube lc  natural join  clube c
                                                                                               WHERE c.nome='Clube da Rainha');

SELECT l.nome
FROM leitor l
WHERE NOT EXISTS (
  SELECT df.id_leitura
  FROM discussaoFinal df
  WHERE df.id_leitura NOT IN (
    SELECT lc.id_leitura
    FROM leituraClube lc
    INNER JOIN clube c ON c.id_clube = lc.id_clube
    WHERE c.nome = 'Clube da Rainha'
  )
  AND df.id_leitura NOT IN (
    SELECT p.id_leitura
    FROM participa p
    WHERE p.id_leitor = l.id_leitor
  )
)

select * from leituraClube


--Criando indices

SELECT  c.nome as clube, lc.data_inicio as data_inicio, titulo
FROM clube c NATURAL JOIN leituraClube lc NATURAL JOIN livro
WHERE titulo like '%O Assassinato de Roger Ackroyd%';

CREATE INDEX idx_titulo_livro ON livro (titulo);

DROP INDEX idx_titulo_livro;

CREATE INDEX idx_livro_leituraClube ON leituraClube (id_livro);

DROP INDEX idx_livro_leituraClube;

CREATE INDEX idx_clube_leituraClube ON leituraClube (id_clube);

DROP INDEX idx_clube_leituraClube;

select * from leituraClube

CREATE VIEW vw_clubes_livro AS
SELECT
c.id_clube,
c.nome AS nome_clube,
c.data_criacao,
c.tema,
l.id_livro,
l.titulo AS titulo_livro,
e.id_editora,
e.nome AS nome_editora,
l.num_paginas,
a.id_autor,
a.nome AS nome_autor
FROM
clube c
INNER JOIN leituraClube lc ON c.id_clube = lc.id_clube
INNER JOIN livro l ON lc.id_livro = l.id_livro
INNER JOIN escrita es ON l.id_livro = es.id_livro
INNER JOIN autor a ON es.id_autor = a.id_autor
INNER JOIN editora e ON l.id_editora = e.id_editora;


select * from vw_clubes_livro

SELECT
nome_autor,
COUNT(*) AS total_leituras
FROM
vw_clubes_livro
GROUP BY
nome_autor
ORDER BY
total_leituras DESC
LIMIT 1;
