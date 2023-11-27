CREATE OR REPLACE PROCEDURE proc_loop2
IS
    n_i number(2);
    hap number(5);
BEGIN
    n_i := 1;
    hap :=0;
    LOOP        
        IF mod(n_i,2) = 0 THEN
            hap := hap +n_i ;
        END IF;
        n_i := n_i +1;
        exit WHEN n_i =10;
    END LOOP;
    dbms_output.put_line('짝수 합은'||hap||'입니다.');
END;
