Create or replace function show() RETURNS TABLE(a int, b varchar) as
$$
	BEGIN
		RETURN QUERY SELECT sum, name from test where sum>1000;
	END;
$$language plpgsql;

Select * from show() where a>=3000;
