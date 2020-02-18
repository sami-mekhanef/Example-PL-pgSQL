create or replace function sort(int[]) RETURNS int[] as
$$
  DECLARE
    j int;
    fin int := (array_length((select noSort from sort),1));
  BEGIN
    while (fin>0)
      LOOP
      j := 1;
      while (j < fin - 1)
          LOOP
            IF ($1[j]>$1[j+1])
              THEN
                $1[j] := $1[j] + $1[j+1]; --Inverser
                $1[j+1] := $1[j] - $1[j+1]; --Inverser
                $1[j] := $1[j] - $1[j+1]; --Inverser
            END IF;
            j := j + 1;
          END LOOP;
      fin := fin - 1;
      END LOOP;
      return $1;
  END;
$$language plpgsql;

CREATE or replace function dicho(int[],int) RETURNS boolean as
$$
  DECLARE
    debut int := $1[1];
    fin int := $1[(array_length($1,1))];
    ecart int := fin-debut;
    m int;
  BEGIN
    while (ecart>1)
      LOOP
        m := debut+(fin-debut)/2;
        IF $1[m] > $2 THEN
            fin := m;

        ELSIF $1[m] < $2 THEN
            debut := m;

        ELSE
            RETURN true;
        END IF;

        ecart := fin-debut;
      END LOOP;
      RETURN false;
  END;
$$language plpgsql;
