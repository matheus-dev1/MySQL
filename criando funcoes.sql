DROP FUNCTION IF EXISTS calcval;

DELIMITER $
CREATE FUNCTION calcval () RETURNS int
READS SQL DATA
BEGIN
	DECLARE soma int;
    SET soma = (8 + 4);
    RETURN soma;
END$

SELECT CALCVAL() AS `Total da Soma`;