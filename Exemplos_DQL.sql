--DQL
--1.Obtenha os nomes de todos os Itens
SELECT * FROM ITEM;

--2. Obtenha o nome e codigo dos fornacedores de cupertino CA
SELECT NOME, ID FROM FORNECEDOR WHERE CIDADE = 'Cupertino CA';

--3. Obtenha o nome e a dura��o em dias (valor*30) de cada projeto
SELECT NOME, (DURACAO*30) AS DUR_DIAS FROM PROJETO;

--4. Obtenha o nome dos projetos de custo menor que R$28000
SELECT NOME FROM PROJETO WHERE VALOR < 28000;

--5. Obtenha os nome dos itens de cor vermelha 
--e com pre�o maior que 15
SELECT NOME, VALOR FROM ITEM WHERE COR = 'Vermelho' AND VALOR > 15;

--6. Obtenha o Codigo dos fornecedores que forneceram a pe�a 5
SELECT FORNECEDORID FROM FORNECE_ITENS WHERE ITEMID = 5;

--7. Obtenha o c�digo dos forencedores concorrentes entre si(fornecem o mesmo item)
SELECT X.FORNECEDORID FROM FORNECE_ITENS AS X, FORNECE_ITENS AS Y
WHERE X.ITEMID = Y.ITEMID AND X.FORNECEDORID <> Y.FORNECEDORID;

--8. Obetenha o codigo dos itens de mesma cor
SELECT X.ID FROM ITEM AS X, ITEM AS Y
WHERE X.COR = Y.COR AND X.ID <> Y.ID;

--9.Obtenha o nome dura��o e custo do projeto de nome Watson
SELECT UPPER(NOME), DURACAO, VALOR FROM PROJETO WHERE NOME = 'WATSON';

--10. Obtenha o nome dos projetos com pre�o entre R$20.000 e R$30.000
SELECT NOME, VALOR FROM PROJETO WHERE VALOR BETWEEN 20000 AND 30000;

--11. Obetenha o nome dos itens de cor vermelha ou amarela e com pre�o de $09, $18, $22, $40 ou $90
SELECT NOME FROM ITEM WHERE (COR = 'VERMELHO' OR COR = 'AMARELO') 
		AND VALOR IN (9, 18, 22, 40, 90);
-- O Operador Like permite recuperar uma linha da tabela sem saber exatamente o valor que est� sendo procurado,
-- utilizando para isso s�mbolos (%) e (_)

--12. Obtenha o nome dos fornecedores residentes em cidades iniciadas com a letra C
SELECT NOME FROM FORNECEDOR WHERE CIDADE LIKE 'C%';

--DEMAIS CEN�RIOS PARA O OPERADOR LIKE

-- Encontra resultados que comecem com caractere 'A'
SELECT CIDADE FROM FORNECEDOR WHERE CIDADE LIKE 'A%'

-- Encontra resultados que terminem com o caractere 'A'
SELECT CIDADE FROM FORNECEDOR WHERE CIDADE LIKE '%A'

-- Encontra resultados que contenham os caracteres 'UP' em algum trecho
SELECT CIDADE FROM FORNECEDOR WHERE CIDADE LIKE '%UP%'

-- Encontra resultados no qual o caractere 'r' esteja na segunda posi��o
SELECT CIDADE FROM FORNECEDOR WHERE CIDADE LIKE '_r&'

-- Encontra resultados no qual o caractere 'a' terminem com o caractere 'o'
SELECT CIDADE FROM FORNECEDOR WHERE CIDADE LIKE 'A%O'

-- Operador is NULL
-- O Operador is NULL teste os valores da coluna e recupera somente as linhas da tabela que possuem valor null

-- 13. Obtenha o nome dos itens que n�o possuem cor 
SELECT NOME, COR FROM ITEM WHERE COR IS NULL;
--UPDATE ITEM SET COR = NULL WHERE ID =0;

-- Os operadores BETWEEN...AND.., IN, LIKE, E is null podem ser combinados om o operador de nega��o not
-- NOT BETWEEN N�O ENTRE DOIS VALORES ESPECIFICADOS
-- NOT IN N�O ENTRE UMA LISTA DE VALORES
-- NOT LIKE N�O ENTRE UM PADR�O ESPECIFICADO
-- IS NOT NULL N�O IGUAL AO VALOR NULL

--14. Obtenha o nome dos itens cujos o pre�os n�o s�o $ 09, $14, $60.
   -- Criar consulta que utilize o operador not between
SELECT NOME FROM ITEM WHERE VALOR NOT IN(09, 14, 60)
SELECT NOME FROM ITEM WHERE VALOR NOT BETWEEN 09 AND 14 
SELECT * FROM ITEM

--15. Obtenha os c�digo de todos os itens fornecidos.
 -- Cl�usula DISTINCT � utilizada para eliminar os valores duplicados de resultados
 -- EXEMPLO ADICIONAL: Identifique todas as cores disponibilizadas para os items.
 SELECT DISTINCT ITEMID FROM FORNECE_ITENS
 SELECT DISTINCT COR FROM ITEM WHERE COR IS NOT NULL

-- A cl�usula ORDER BY � utilizada para ordenar (classificar) as linhas da tabela.
-- 16. Obtenha em ordem decrescente de pre�o, os nomes dos itens de cor vermelha e com pre�o maior que 15$;
SELECT NOME, VALOR FROM ITEM
WHERE COR = 'Vermelho' AND VALOR > 15
ORDER BY VALOR DESC
---A cl�usula GROUP BY referencia uma coluna especificada da tabela
---relacionada na cl�usula FROM e agrupa as linhas com base nos
---valores iguais dessa coluna.

---17. Obtenha a quantidade de cada item utilizado em todo o projeto
SELECT ITEMID, SUM(QTD) AS QUANTIDADE FROM FORNECE_ITENS
GROUP BY ITEMID
       --- EXEMPLO ADICIONAL: Criar enunciado e resolu��o para aplicar uma fun��o de agrupamento
	   --- 
	   --- 18. Qual o menor valor da tabela dos itens
SELECT ID, MIN(VALOR) AS PRE�O_TOTAL FROM ITEM GROUP BY ID ORDER BY PRE�O_TOTAL
--SUM 
 SELECT * FROM FORNECE_ITENS;
 SELECT ITEMID, SUM(QTD) AS QTD FROM FORNECE_ITENS GROUP BY ITEMID;
 
 SELECT COR, AVG(VALOR) FROM ITEM GROUP BY COR; 

 ---COUNT
 SELECT COUNT(*) FROM ITEM --QUANTIDADE DE REGISTRO NA TABELA DE ITEM
 SELECT COUNT(*) FROM ITEM WHERE COR = 'VERMELHO';

 ---max RETORNA O VALOR MAXIMO DE UMA COLUNA
 SELECT MAX(VALOR) FROM PROJETO;

 ---min RETORNA O VALOR MINIMO DE UMA COLUNA
 SELECT MIN(VALOR) FROM PROJETO;

 --18. Obtenha os c�digos dos itens que s�o utilizados
 --em uma quantidade inferior a 5 unidades na soma de todos os projetos
SELECT ITEMID, SUM(QTD) AS QUANTIDADE FROM FORNECE_ITENS
GROUP BY ITEMID
HAVING SUM(QTD) < 5;
