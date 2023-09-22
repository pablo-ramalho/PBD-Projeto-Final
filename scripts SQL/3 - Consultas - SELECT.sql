-- consultas nas tabelas criadas e demais operações - -> mínimo de 6 consultas no banco, sendo no mínimo 4 delas contendo junções entre tabelas
USE AEROPORTO;


SELECT * FROM COMPANHIA_AEREA;
SELECT * FROM RESERVA_EMBARQUE;
SELECT * FROM VOO;


/* Consulta 1 - Liste todos os passageiros que 
têm nacionalidade portuguesa */
SELECT NOME_PASSAGEIRO 
FROM PASSAGEIRO 
WHERE NACIONALIDADE = 'Portugues';


/* Consulta 2 - Liste o nome e o número de telefone 
dos funcionários que usam o hotmail como email */
SELECT NOME_FUNCIONARIO, TELEFONE 
FROM FUNCIONARIO
WHERE EMAIL LIKE '%@hotmail.com';


/* Consulta 3 - Liste o nome, a data de nascimento 
e o gênero dos passageiros 
que pegaram mais de um voo */
SELECT P.NOME_PASSAGEIRO, P.DATA_NASCIMENTO, P.GENERO
FROM PASSAGEIRO AS P
JOIN RESERVA_EMBARQUE AS RE 
ON P.ID_PASSAGEIRO = RE.ID_PASSAGEIRO
GROUP BY P.ID_PASSAGEIRO
HAVING COUNT(RE.ID_VOO) > 1;


/* Consulta 4 - Liste o tipo de avião, a empresa de carga
e o nome do funcionário responsável por todos
os voos em aviões com capacidade de assentos 
maior do que 100 */
SELECT A.TIPO_AVIAO, O.EMPRESA_CARGA, F.NOME_FUNCIONARIO
FROM OPERADOR_DE_CARGA AS O
JOIN FUNCIONARIO AS F 
ON O.ID_FUNCIONARIO = F.ID_FUNCIONARIO
JOIN VOO AS V 
ON F.ID_FUNCIONARIO = V.ID_FUNCIONARIO
JOIN AVIAO AS A 
ON V.ID_AVIAO = A.ID_AVIAO
WHERE A.CAPACIDADE_ASSENTOS > 100;


/* Consulta 5 - Liste o nome e a nacionalidade de todos os passageiros 
que têm o voo encerrado */
SELECT P.NOME_PASSAGEIRO, P.NACIONALIDADE
FROM PASSAGEIRO AS P
JOIN RESERVA_EMBARQUE AS RE ON P.ID_PASSAGEIRO = RE.ID_PASSAGEIRO
JOIN VOO AS V ON RE.ID_VOO = V.ID_VOO
WHERE RE.STATUS_EMBARQUE = 'encerrado'
ORDER BY P.NOME_PASSAGEIRO;


/* Consulta 6 - Liste o destino de todos os voos que tenham 
bagagem de peso igual a 16 */
SELECT V.DESTINO
FROM VOO AS V
JOIN BAGAGEM AS B ON V.ID_VOO = B.ID_VOO
WHERE B.PESO = 16;


/* Consulta 7 - Liste os dados e para onde viajou o passageiro
"Marcelo Mattos". */
SELECT P.NOME_PASSAGEIRO, P.GENERO, P.DATA_NASCIMENTO, V.DATA_PARTIDA, V.DESTINO
FROM PASSAGEIRO P
JOIN RESERVA_EMBARQUE RE ON P.ID_PASSAGEIRO = RE.ID_PASSAGEIRO
JOIN VOO V ON RE.ID_VOO = V.ID_VOO
WHERE P.NOME_PASSAGEIRO = 'Marcelo Mattos';


/* Consulta 8 - Liste os nomes, a nacionalidade e o número de reservas 
de cada passageiro do sexo feminino. */
SELECT P.NOME_PASSAGEIRO, P.NACIONALIDADE, (SELECT COUNT(*) FROM RESERVA_EMBARQUE AS RE 
                                            WHERE RE.ID_PASSAGEIRO = P.ID_PASSAGEIRO) AS NUMERO_DE_RESERVAS
                                            FROM PASSAGEIRO AS P
WHERE P.GENERO = 'F';


/* Consulta 9 - Liste a quantidade de voos realizados pela 
companhia aérea "Azul". */
SELECT COUNT(*) AS QuantidadeDeVoos
FROM VOO
WHERE ID_AVIAO IN (SELECT ID_AVIAO
                   FROM AVIAO
                   WHERE ID_COMPANHIA IN (SELECT ID_COMPANHIA
                                          FROM COMPANHIA_AEREA
                                          WHERE NOME_COMPANHIA = 'Azul'
                                         )

);




