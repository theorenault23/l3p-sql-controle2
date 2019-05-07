SELECT current_database() AS base, schema_name AS schema,table_name AS NOM,
FROM information_schema.schemata,information_schema.tables
WHERE schema_name<>'pg_toast' AND schema_name<>'pg_catalog' AND schema_name<>'pg_toast_temp_1' AND schema_name<>'information_schema' AND schema_name<>'pg_temp_1';