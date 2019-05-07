SELECT current_database() AS base, S.schema_name AS schema,T.table_name AS NOM,C.ordinal_position AS position_colonne,
C.column_name AS nom_colonne, C.data_type AS type_colonne, C.is_nullable AS peut_etre_null,C.is_updatable AS peut_etre_modifie,
(select character_maximum_length from information_schema.columns WHERE column_name=C.column_name AND table_name=T.table_name AND ordinal_position=C.ordinal_position and data_type='character varying')
FROM information_schema.schemata AS S,information_schema.tables AS T INNER JOIN information_schema.columns AS C ON T.table_name=C.table_name
WHERE schema_name<>'pg_toast' AND schema_name<>'pg_catalog' AND schema_name<>'pg_toast_temp_1' AND schema_name<>'information_schema' AND schema_name<>'pg_temp_1';