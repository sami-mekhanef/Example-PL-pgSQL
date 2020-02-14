create or replace function tests(int,int) returns int as
$$
BEGIN
  RETURN $1+$2;
END;
$$ language plpgsql;


create or replace function tests_2(int) RETURNS TABLE(id int, sum int,name varchar) as
$$
BEGIN
  RETURN QUERY
    SELECT * FROM test as t where $1<t.sum;
END;
$$ language plpgsql;


create or replace function tests_3() RETURNS setof varchar as
$$
DECLARE
  i int :=0;
  j int;
  strchar varchar :='' ;
BEGIN
     LOOP
      EXIT WHEN i > (SELECT id FROM test order by id DESC LIMIT 1);
      strchar := '';
      j:=0;
      LOOP
        EXIT WHEN j > i;
        strchar := CONCAT(strchar,'*');
        j:=j+1;
      END LOOP ;
    RETURN NEXT strchar;
    i:=i+1;
    END LOOP;
END;
$$ language plpgsql;


create or replace function tests_4() RETURNS setof varchar as
$$
DECLARE
  i int := 0;
  j int;
  decrease int := (SELECT id FROM test order by id DESC LIMIT 1);
  space varchar := repeat(' ', decrease);
  strchar varchar :='' ;

BEGIN
     LOOP
      EXIT WHEN i > (SELECT id FROM test order by id DESC LIMIT 1);
      strchar := '';
      strchar := space || strchar;
      j:=0;
      LOOP
        EXIT WHEN j > i;
        strchar := CONCAT(strchar,'*');
        j:=j+1;
      END LOOP ;
    RETURN NEXT strchar;
    i:=i+1;
    decrease := decrease-1;
    space := repeat(' ', decrease);
    END LOOP;
END;
$$ language plpgsql;


create or replace function tests_5() RETURNS setof varchar as --Ne marche que si id est impair
$$
DECLARE
  i int := 0;
  j int;
  decrease int := (SELECT id FROM test order by id DESC LIMIT 1)/2;
  space varchar := repeat(' ', decrease);
  strchar varchar :='' ;

BEGIN
     LOOP
      EXIT WHEN i > (SELECT id FROM test order by id DESC LIMIT 1)/2;
      strchar := '';
      strchar := space || strchar;
      j:=0;
      LOOP
        EXIT WHEN j > i;
        strchar := CONCAT(strchar,'*');
        j:=j+1;
      END LOOP ;
    strchar := CONCAT(strchar,repeat('*',i));
    RETURN NEXT strchar;
    i:=i+1;
    decrease := (decrease-1);
    space := repeat(' ', decrease);
    END LOOP;
END;
$$ language plpgsql;
