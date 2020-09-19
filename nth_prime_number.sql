---------------------------------
--------------------------------- Returns the n-th number number with for loop: nth_fib(n) 

CREATE OR REPLACE FUNCTION nth_prime(nth INTERGER)
    RETURNS INTEGER AS $nth_prime$
    DECLARE
        counter INTEGER = 0;



---------------------------------
CREATE OR REPLACE FUNCTION nth_prime(n INTEGER)
    RETURNS INTEGER AS $nth_prime$
    DECLARE
        num INTEGER = 1;
        count INTEGER = 0;
         
END $nth_prime$ LANGUAGE plpgsql;


SELECT nth_prime(54);
