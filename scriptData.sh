create or replace function square(inout a int) as
$$
  BEGIN
    a := a * a;
  END;
$$LANGUAGE PLPGSQL;

create or replace function square_2(in a int, out b int) as
$$
  BEGIN
    b := a * a;
  END;
$$LANGUAGE PLPGSQL;


create or replace function moyPond() RETURNS int as --Moyenne ponderé entre ID et sum
$$
  DECLARE
    i int := 1;
    som int := 0;
  BEGIN
  WHILE (i <= (SELECT id FROM test order by id DESC LIMIT 1))
  LOOP

    som := som + (i * (SELECT sum FROM test where id=i));
    RAISE NOTICE 'Ici, som = %',som;
    i := i + 1;
  END LOOP;
  RETURN som/((SELECT id FROM test order by id DESC LIMIT 1));
  END;
$$LANGUAGE PLPGSQL;
