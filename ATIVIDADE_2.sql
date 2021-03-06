CREATE DATABASE LOJA_DE_ROUPAS;

USE LOJA_DE_ROUPAS;

CREATE TABLE CLIENTES
 
 ( CLI_CODIGO INT PRIMARY KEY IDENTITY NOT NULL,
   CLI_NOM VARCHAR (50) NOT NULL,
   CLI_CPF VARCHAR (11) NOT NULL UNIQUE,
);

DROP TABLE CLIENTES

CREATE TABLE FORNECEDOR 
( FOR_CODIGO INT PRIMARY KEY IDENTITY NOT NULL,
  FOR_NOM VARCHAR (50) NOT NULL,
  FOR_CNPJ VARCHAR (14) NOT NULL UNIQUE
  );

 CREATE TABLE FORMAS_PAGTO
 ( PAG_COD INT PRIMARY KEY IDENTITY NOT NULL,
   PAG_DES VARCHAR (30) NOT NULL,
);

 CREATE TABLE PRODUTO
  ( PRO_COD INT PRIMARY KEY IDENTITY NOT NULL,
    PRO_DES VARCHAR (30) NOT NULL,
	PRO_PRECO DECIMAL(7,2) CHECK (PRO_PRECO > 0)
	);

 CREATE TABLE VENDA
 ( VENDA_CODIGO INT PRIMARY KEY IDENTITY NOT NULL,
   VENDA_DATA DATETIME,
   VENDA_VALOR DECIMAL (7,2) CHECK (VENDA_VALOR > 0),
   CLI_CODIGO INT,
   PAG_COD INT,
   FOREIGN KEY (CLI_CODIGO) REFERENCES CLIENTES (CLI_CODIGO),
   FOREIGN KEY (PAG_COD) REFERENCES FORMAS_PAGTO (PAG_COD)
   );

   CREATE TABLE ITEM_VENDA
   ( IV_QTD INT NOT NULL CHECK (IV_QTD > 0),
   VENDA_CODIGO INT,
   PRO_COD INT,
   FOREIGN KEY (VENDA_CODIGO) REFERENCES VENDA (VENDA_CODIGO),
   FOREIGN KEY (PRO_COD) REFERENCES PRODUTO (PRO_COD)
   );

   INSERT INTO CLIENTES VALUES ('GUILHERME', 11203283201)
   INSERT INTO CLIENTES VALUES ('ALLISON', 23232323232)
   INSERT INTO CLIENTES VALUES ('MATHEUS', 32030212343)
   INSERT INTO CLIENTES VALUES ('SAMUEL', 30202012032)
   INSERT INTO CLIENTES VALUES ('MATHEUS', 4023023452)

   SELECT * FROM CLIENTES

   INSERT INTO FORMAS_PAGTO VALUES ('BOLETO')
   INSERT INTO FORMAS_PAGTO VALUES ('CART?O CREDITO')
   INSERT INTO FORMAS_PAGTO VALUES ('CART?O DEBITO')
   INSERT INTO FORMAS_PAGTO VALUES ('PIX')
   INSERT INTO FORMAS_PAGTO VALUES ('DEPOSITO BANCARIO')

   SELECT * FROM FORMAS_PAGTO
   
   INSERT INTO FORNECEDOR VALUES ('NIKE', 14023023723923)
   INSERT INTO FORNECEDOR VALUES ('LOJA DE TENIS', 30238203821323)
   INSERT INTO FORNECEDOR VALUES ('LOJA DE TECIDOS', 20372937290273)
   INSERT INTO FORNECEDOR VALUES ('LOJA DE CAL?AS', 93729283754023)
   INSERT INTO FORNECEDOR VALUES ('LOJA DE CAL?ADOS', 20392827262832)

   SELECT * FROM FORNECEDOR

   
 SELECT GETDATE()

  SELECT * FROM VENDA

   INSERT INTO VENDA VALUES ('2022-02-20', 100.00, 1, 1) 
   INSERT INTO VENDA VALUES ('2020-01-10', 200.00, 2, 2)
   INSERT INTO VENDA VALUES ('2019-02-20', 300.00, 3, 3)
   INSERT INTO VENDA VALUES ('2015-01-10', 450.00, 4, 4)
   INSERT INTO VENDA VALUES ('2014-02-15', 500.00, 5, 5)

   INSERT PRODUTO VALUES ('T?NIS DA NIKE', 300.00)
   INSERT PRODUTO VALUES ('CAL?A LEGGING', 140.00)
   INSERT PRODUTO VALUES ('CAL?A JEANS', 130.00)
   INSERT PRODUTO VALUES ('CAMISETA DE ANIME', 100.00)
   INSERT PRODUTO VALUES ('CAMISETA POLO', 130.00)

   SELECT * FROM PRODUTO

   INSERT ITEM_VENDA VALUES (23, 1, 1)
   INSERT ITEM_VENDA VALUES (21, 2, 2)
   INSERT ITEM_VENDA VALUES (92, 3, 3)
   INSERT ITEM_VENDA VALUES (12, 4, 4)
   INSERT ITEM_VENDA VALUES (32, 5, 5)

   SELECT * FROM ITEM_VENDA

   UPDATE CLIENTES SET CLI_NOM = 'GUILHERME MORAES' WHERE CLI_CODIGO = 1
   UPDATE CLIENTES SET CLI_NOM = 'ALLISON RODRIGUES' WHERE CLI_CODIGO = 2
   UPDATE CLIENTES SET CLI_NOM = 'MATHEUS FELLIPE' WHERE CLI_CODIGO = 3
    
	SELECT * FROM CLIENTES

	UPDATE FORMAS_PAGTO SET PAG_DES = 'BOLETO_1' WHERE PAG_COD = 1
	UPDATE FORMAS_PAGTO SET PAG_DES = 'CART?O DE CREDITO' WHERE PAG_COD = 2
	UPDATE FORMAS_PAGTO SET PAG_DES = 'CART?O DE DEBITO' WHERE PAG_COD = 3

	SELECT * FROM FORMAS_PAGTO

	UPDATE FORNECEDOR SET FOR_NOM = 'FABRICA DA NIKE' WHERE FOR_CODIGO = 1
	UPDATE FORNECEDOR SET FOR_CNPJ = 12039283720312 WHERE FOR_CODIGO = 1
	UPDATE FORNECEDOR SET FOR_NOM = 'LOJA DA ADIDAS' WHERE FOR_CODIGO = 2

	SELECT * FROM FORNECEDOR

	UPDATE ITEM_VENDA SET IV_QTD = 10 WHERE PRO_COD = 1 
	UPDATE ITEM_VENDA SET IV_QTD = 6 WHERE PRO_COD = 3
	UPDATE ITEM_VENDA SET IV_QTD = 12 WHERE PRO_COD = 5

	SELECT * FROM ITEM_VENDA

	UPDATE PRODUTO SET PRO_DES = 'CHINELO DA NIKE' WHERE PRO_COD = 1
	UPDATE PRODUTO SET PRO_DES = 'CAL?A JEANS TAM 32' WHERE PRO_COD = 3
	UPDATE PRODUTO SET PRO_PRECO = 250.00 WHERE PRO_COD = 1
	SELECT * FROM PRODUTO

	UPDATE VENDA SET VENDA_VALOR = 200.00 WHERE VENDA_CODIGO = 1
	UPDATE VENDA SET VENDA_VALOR = 150.00 WHERE VENDA_CODIGO = 2
	UPDATE VENDA SET VENDA_DATA = '2022-03-10' WHERE VENDA_CODIGO = 1

	SELECT * FROM VENDA

	DELETE FROM ITEM_VENDA WHERE VENDA_CODIGO = 1;
	DELETE FROM ITEM_VENDA WHERE VENDA_CODIGO = 2;
	
	DELETE FROM VENDA WHERE VENDA_CODIGO = 1;
	DELETE FROM VENDA WHERE VENDA_CODIGO = 2;

	DELETE FROM PRODUTO WHERE PRO_COD = 1;
	DELETE FROM PRODUTO WHERE PRO_COD = 2;

	DELETE FROM FORNECEDOR WHERE FOR_CODIGO = 1;
	DELETE FROM FORNECEDOR WHERE FOR_CODIGO = 2;
	
	DELETE FROM FORMAS_PAGTO WHERE PAG_COD = 1;
	DELETE FROM FORMAS_PAGTO WHERE PAG_COD = 2;
	SELECT * FROM CLIENTES

	DELETE FROM CLIENTES WHERE CLI_CODIGO = 1;
	DELETE FROM CLIENTES WHERE CLI_CODIGO = 2;


