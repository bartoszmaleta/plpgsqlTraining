--------------------------------- PESEL VALIDATOR
--------------------------------- Returns boolean (true if correct PESEL or false if not) based on provided PESEL
CREATE OR REPLACE FUNCTION is_correct(pesel DOUBLE PRECISION)
    RETURNS BOOLEAN AS
$is_correct$
DECLARE
    pesel_as_text   TEXT    = pesel::TEXT;
    checksum        INTEGER = RIGHT(pesel_as_text, 1)::INTEGER;
    sum             INTEGER = 0;
    calculatedPesel INTEGER;
BEGIN
    IF LENGTH(pesel_as_text) != 11 THEN
        RETURN FALSE;
    ELSE
        FOR i IN 1..LENGTH(pesel_as_text) - 1
            LOOP
                sum = sum + (SUBSTRING(pesel_as_text, i, 1)::INTEGER * get_multiplier(i));
            END LOOP;
        calculatedPesel = 10 - MOD(sum, 10);
        RETURN calculatedPesel = checksum;
    END IF;
END;
$is_correct$ LANGUAGE plpgsql;


CREATE FUNCTION get_multiplier(number INTEGER)
    RETURNS INTEGER AS
$multiplied_number$
DECLARE
    number INTEGER = MOD(number, 4);
BEGIN
    CASE number
        WHEN 1 THEN RETURN 1;
        WHEN 2 THEN RETURN 3;
        WHEN 3 THEN RETURN 7;
        WHEN 0 THEN RETURN 9;
        END CASE;
END;
$multiplied_number$ LANGUAGE plpgsql;


SELECT is_correct(63070513331); -- OUTPUT TRUE
