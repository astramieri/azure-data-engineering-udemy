create schema DWH;

go

  select *
    from sys.schemas
order by name asc;