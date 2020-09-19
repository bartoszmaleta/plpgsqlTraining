---------------------------------
--------------------------------- Returns the n-th number number with for loop: nth_fib(n) 

CREATE OR REPLACE FUNCTION nth_prime(n INTEGER)
    RETURNS INTEGER AS $nth_prime$
    DECLARE
        num INTEGER = 1;
        count INTEGER = 0;
        i INTEGER;
    BEGIN
        IF (n = 0) THEN
            RETURN 0;
        END IF;
        WHILE count < n LOOP
            num = num + 1;
            i = 2;
            LOOP
                EXIT WHEN i > num;
                IF (num % i = 0) THEN
                    EXIT;
                    END IF;
                i = i + 1;
            END LOOP;
            IF i = num THEN
                count = count + 1;
                END IF;
         END LOOP;
         RETURN num;
END $nth_prime$ LANGUAGE plpgsql;

SELECT nth_prime(5); -- OUTPUT 11
