SELECT current_database() AS base, S.schema_name AS schema,T.table_name AS NOM, table_type AS type, is_insertable_into AS peut_t_on_y_inserer_des_donnees,
(select count(*) from information_schema.columns where table_name=T.table_name) AS nb_colonnes,
(SELECT count(*) from information_schema.table_constraints where table_name=T.table_name AND constraint_type='CHECK') AS nb_constrainte_de_valeur,
(SELECT count(*) from information_schema.table_constraints where table_name=T.table_name AND constraint_type='FOREIGN KEY') AS nb_constrainte_cle_etrangere,
(SELECT count(*) from information_schema.table_constraints where table_name=T.table_name AND constraint_type='PRIMARY KEY') AS nb_constrainte_cle_primaire,
(SELECT count(*) from information_schema.table_constraints where table_name=T.table_name AND constraint_type='UNIQUE') AS nb_constrainte_unicite
FROM information_schema.schemata AS S,information_schema.tables AS T
WHERE schema_name<>'pg_toast' AND schema_name<>'pg_catalog' AND schema_name<>'pg_toast_temp_1' AND schema_name<>'information_schema' AND schema_name<>'pg_temp_1';