select * from curso;

SELECT COD_CUR, NOME FROM CURSO
WHERE TIPO IN ('Bacharelado', 'MESTRADO');
-- EXIBIR AS TUPLAS(LINHAS) EM QUE A COLUNA "TIPO" FOR IGUAL A BACHARELADO E MESTRADO

SELECT MAX(MENSALIDADE)
FROM CURSO;

SELECT MIN(MENSALIDADE)
FROM CURSO;

SELECT (MENSALIDADE * 2) AS 'Dobro do Valor'
FROM CURSO;
-- multiplica e exibe

SELECT COUNT(MENSALIDADE) AS 'Quantidade de Tuplas'
FROM CURSO;
-- Conta

SELECT MIN(MENSALIDADE) FROM CURSO;
-- Minimo

SELECT DISTINCT TIPO
FROM CURSO;
-- Ele so retornar uma unica informacao de cada tipo

SELECT NOME FROM CURSO ORDER BY NOME;
-- EXIBIMOS DE FORMA ORDENADA OS NOMES DOS CURSOS, SENDO QUE ANTES O PK ESTAVA ORDEANDO.
-- PODE USAR O DESC(DECRESCENTE) ou ASC(CRESCENTE)

SELECT UPPER(NOME) FROM CURSO ORDER BY NOME;
-- O UPPER FAZ COM QUE O RETORNO DO NOME ESTEJA EM CAIXA ALTA.

SELECT LOWER(NOME) FROM CURSO ORDER BY NOME;
-- O LOWER FAZ COM QUE O RETORNO DO NOME ESTEJA EM CAIXA BAIXA.

SELECT NOME
FROM CURSO
WHERE NOME LIKE '%CAO';

SELECT NOME
FROM CURSO
WHERE NOME LIKE 'E%';

SELECT NOME
FROM CURSO
WHERE NOME LIKE '%DE%';

SELECT DISTINCT MENSALIDADE
FROM CURSO;

USE RECODEPRO;

SELECT MENSALIDADE
FROM CURSO
GROUP BY MENSALIDADE;
-- Funciona da mesma forma que o distinct
-- O GROUP BY SERVE PARA AGRUPAR ATRIBUTOS, NO CASO ELE DEVE EXIBIR APENAS UM VALOR DE CADA TIPO EXEMPLO
-- SE POSSUI O VALOR 600 EM DUAS DIFERENTES TUPLAS ENTAO ELE IRA EXIBIR APENAS UMA VEZ O VALOR 600 MESMO QUE
-- ELE POSSUA DUAS OU MAIS OCORRENCIAS.

SELECT COUNT(MENSALIDADE) AS 'QUANTIDADE DE MENSALIDADES', MENSALIDADE AS 'VALOR DE CADA MENSALIDADE'
FROM CURSO
GROUP BY MENSALIDADE
HAVING COUNT(MENSALIDADE) = 2 OR COUNT(MENSALIDADE) = 3;
-- O HAVING FUNCIONA COMO SE FOSSE A CLAUSULA "WHERE"

SELECT * FROM DISCIPLINA;
SELECT * FROM CURSO;
SELECT * FROM GRADE;
SELECT * FROM PROFESSOR;

SELECT CURSO.COD_CUR, CURSO.NOME, DISCIPLINA.NOME_DIS, PROFESSOR.NOME -- O QUE EU QUERO EXIBIR
FROM CURSO, GRADE, DISCIPLINA, PROFESSOR -- DA QUAL LUGAR
WHERE CURSO.COD_CUR = GRADE.COD_CUR AND 
	  DISCIPLINA.COD_DIS = GRADE.COD_DIS AND
      PROFESSOR.COD_PRO = GRADE.COD_PRO; -- QUAIS AS CONDICOES
-- O CODIGO DO CURSO DA TABELA CURSO TEM QUE SER IGUAL AO CODIGO DO CURSO DA TABELA GRADE

-- EU LIGUEI O GRADE.COD_CUR COM CURSO.COD_CUR - FAZENDO UM ELO DE LIGACAO NAS BUSCAS
-- EU LIGUEI O GRADE.COD_DIS COM DISCIPLICA.COD_DIS - FAZENDO UM ELO DE LIGACAO NAS BUSCAS
-- EU LIGUEI O GRADE.COD_PRO COM PROFESSOR.COD_PRO - FAZENDO UM ELO DE LIGACAO NAS BUSCAS.

alter table `recodepro`.`curso`
add column mensalidade float null after `duracao`;

insert into curso (cod_cur, nome, tipo, duracao, mensalidade)
values ('1', 'Sistemas de Informacao', 'Bacharelado', '4', '500'),
('2', 'Ciencias da Computacao', 'Bacharelado', '4', '600'),
('C3', 'Engenharia de Producao', 'Bacharelado', '5', '700'),
('C4', 'Analise de Sistemas', 'Tecnologo', '3', '350'),
('C5', 'Gestao de TI', 'TEcnologo', '3', '350'),
('C6', 'Enfermagem', 'Bacherelado', 5, '640');

alter table curso
change column nome nome varchar(50) not null;
-- Eu tenho que colocar o nome duas vezes porque estou sobre escrevendo tudo, neste caso eu nao estou sobreescrevendo
-- o nome entao temos que colocar como nome DENovo.

update curso 
set mensalidade = 550 
where cod_cur = 1;

UPDATE CURSO
SET MENSALIDADE = 600
WHERE COD_CUR = 1 OR COD_CUR = 'C6';

SET SQL_SAFE_UPDATES = 0;
-- Permitir Updates

update curso 
set mensalidade = "150" 
where (cod_cur = "C3" or nome = "Gestão de Ti");

UPDATE CURSO
SET TIPO = 'MESTRADO'
WHERE DURACAO = 5;

DELETE FROM PRODUTOS
WHERE REFERENCIA = '003';
-- Deletando apenas a Linha onde possuia a "referencia" 003

DELETE FROM PRODUTOS
WHERE descricao = 'arroz';
-- neste caso nos fazemos um delete em cascede

SELECT * FROM PRODUTOS;
SELECT * FROM itensvenda;

SELECT * FROM TELEFONE
WHERE IDPESSOALTEL = 1;
-- AQUI PRIMEIRO EU SELECIONO TUDO E DEPOIS FACO UMA CONSULTA MAIS RESTRICA COM O WHERE

SELECT IDPESSOALTEL, TELEFONE FROM TELEFONE
WHERE IDPESSOALTEL = 1;
-- AQUI NOS VAMOS SELECIONAR OS ATRIBUTOS(COLUNAS) IDPESSOAL E TELEFONE E DEPOIS EXIBIR APENAS AS TUPLAS (LINHAS)
-- QUE TIVEREM O IDPESSOALTEL = 1

ALTER TABLE `recodepro`.`itensvenda` -- SELECIONAMOS A TABELA
ADD INDEX `kf_produto_item_idx` (`Produto` ASC) VISIBLE; -- INDICE PADRAO
-- AO CRIAR UMA FOREIGN KEY VC TAMBEM CRIA UM INDICE
ALTER TABLE `recodepro`.`itensvenda` 
ADD CONSTRAINT `kf_produto_item` -- nome da minha foreign key
  FOREIGN KEY (`Produto`) -- EM QUAL TABELA EU ESTOU LIGANDO A MINHA FOREIGN KEY
  REFERENCES `recodepro`.`produtos` (`Referencia`) -- EM QUAL TABELA E COLUNA EU ESTOU FAZENDO REFERENCIA.
  ON DELETE CASCADE -- QUANDO DELETAR UMA DELETA A OUTRA
  ON UPDATE CASCADE; -- QUANDO UMA SOFRER UM ATUALIZACAO A OUTRA SOFRE TAMBEM

-- TUPLA E UMA LINHA COMPLETA

select * from produtos;

ALTER TABLE `recodepro`.`produtos`
AUTO_INCREMENT = 002;

insert into produtos (Referencia, Descricao, Estoque)
values ('002', 'Arroz', '15'),
('003', 'Batata', 200),
('004', 'Salsicha', '44');

insert into itensvenda (Venda, Produto, Quantidade)
values ('1' , '001', '3');

insert into itensvenda (Venda, Produto, Quantidade)
values ('2' , '002', '11'),
('3' , '003', '55'),
('4', '004', '33')