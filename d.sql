SELECT current_database() AS base, schema_name AS schema, constraint_name AS NOM,
(CASE constraint_type WHEN 'PRIMARY KEY'  THEN 'Contrainte de cle primaire'
					  WHEN 'FOREIGN KEY'  THEN 'Contrainte de cle étrangère'
 					  WHEN 'CHECK'  THEN 'Contrainte de valeur'
                      WHEN 'UNIQUE'  THEN 'Contrainte d unicite'
 END
) AS type_de_contrainte, CONCAT(current_database(),'.',schema_name,'.',constraint_name) AS rattache_a_la_table
FROM information_schema.schemata,information_schema.table_constraints
WHERE schema_name<>'pg_toast' AND schema_name<>'pg_catalog' AND schema_name<>'pg_toast_temp_1' AND schema_name<>'information_schema' AND schema_name<>'pg_temp_1';