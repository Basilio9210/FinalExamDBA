--PUNTO 1

CREATE TYPE number_array IS VARRAY(100) OF INTEGER;

DECLARE
    arreglo number_array;
BEGIN
     arreglo:= VARRAY_TYPE(1,2,3,4,5, 6);
	 k := (5);
     divisible_sum_pairs(arreglo, k);
END;

CREATE OR REPLACE FUNCTION divisible_sum_pairs(ARREGLO VARRAY_TYPE, k VARRAY_TYPE) IS
BEGIN
    FOR i IN 1..ARREGLO.COUNT LOOP
     DBMS_OUTPUT.PUT_LINE(ARREGLO(i));
		FOR j IN 1..ARREGLO.COUNT LOOP
			IF MOD(ARREGLO(i),2) := 0 THEN
			DBMS_OUTPUT.PUT_LINE(ARREGLO(i)/k(j));
			END IF;
		END LOOP;
    END LOOP; 
END;



--PUNTO3

CREATE TABLE digits (n integer, pairs integer);

INSERT INTO digits (n, pairs) values (2, 2);
INSERT INTO digits (n, pairs) values (2, 2);
INSERT INTO digits (n, pairs) values (2, 2);
INSERT INTO digits (n, pairs) values (2, 2);
INSERT INTO digits (n, pairs) values (2, 2);

SELECT * FROM digits;


CREATE OR REPLACE FUNCTION find_digits(n integer, pairs integer) RETURN INTEGER IS
    i INTEGER := 1;
    contador INTEGER :=0;  
    posicion INTEGER :=0;
BEGIN
        WHILE(i <= length(n))LOOP
            posicion:= INSTR(n, pairs, i);
            IF posicion  = 0 THEN
                i := length(n) +1;
            ELSE
                i := posicion +1;
                contador := contador +1;
                
            END IF; 
        END LOOP;
        RETURN contador;
END;


CREATE OR REPLACE PROCEDURE CALCULATE_FIND_DIGITS(find_digits integer) as
BEGIN
	UPDATE digits set n = select pairs from digits;
END;

EXEC CALCULATE_FIND_DIGITS(1);
