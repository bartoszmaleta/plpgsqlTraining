---------------------------------
--------------------------------- Returns the n-th Fibonacci number with for loop: nth_fib(n) 

CREATE OR REPLACE FUNCTION fibonaci(n INTEGER)
    RETURNS INTEGER AS $fibonaci$
    DECLARE
        counter INTEGER = 0;
        i INTEGER = 0;
        j INTEGER = 1;
    BEGIN
        IF (n < 1) THEN
            RETURN 0;
        END IF;

        LOOP
        EXIT WHEN counter = n;
        counter = counter + 1;
        SELECT j, i + j INTO i, j;
        END LOOP;
        RETURN i;
END
$fibonaci$ LANGUAGE plpgsql;

SELECT fibonaci(15); -- OUTPUT 8

---------------------------------
--------------------------------- Returns the n-th Fibonacci number with while loop: nth_fib(n)

CREATE OR REPLACE FUNCTION fibonaci2(n INTEGER)
    RETURNS INTEGER AS $fibonaci2$
    DECLARE
        count INTEGER = 0;
        i INTEGER = 0;
        j INTEGER = 1;
    BEGIN
        IF (n < 1) THEN
            RETURN 0;
        END IF;
        WHILE count < n LOOP
            count = count + 1;
            SELECT j, i + 1 INTO i, j;
            END LOOP;
        RETURN i;
END $fibonaci2$ LANGUAGE plpgsql;


SELECT fibonaci2(54); -- OUTPUT 27
