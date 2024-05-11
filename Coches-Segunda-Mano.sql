create database coches_segunda_mano;

use coches_segunda_mano;

# Eliminamos las columnas innecesarias para el proyecto
ALTER TABLE coches_segunda_mano DROP COLUMN company;
ALTER TABLE coches_segunda_mano DROP COLUMN price_financed;
ALTER TABLE coches_segunda_mano DROP COLUMN dealer; 

# Número de coches por provincias

SELECT DISTINCT province, COUNT(url) AS coches_provincia 
FROM coches_segunda_mano 
GROUP BY province 
ORDER BY coches_provincia DESC;

#Número de coches por año de fabricacion ordenados por cantidad.

SELECT DISTINCT year,count(url) as coche_fabricacion
FROM coches_segunda_mano
GROUP BY year
ORDER BY coche_fabricacion DESC;

# Precio medio de venta por marca de coche

SELECT DISTINCT make, AVG(price) as precio_medio
FROM coches_segunda_mano
GROUP BY make
ORDER BY precio_medio DESC;

## TOP 3 Marca de coche usado más vendida en España

SELECT DISTINCT make, country, COUNT(make) AS vendidos_spain 
FROM coches_segunda_mano 
GROUP BY make,country 
ORDER BY vendidos_spain DESC LIMIT 3;

#¿Cuál es la marca de coche más vendida por provincia y marca? 

SELECT distinct make,province,count(make) as ventas_prov_marc
FROM coches_segunda_mano
GROUP BY province,make
ORDER BY ventas_prov_marc DESC;

# ¿Cuántos coches publican los profesionales y los particulares?
 
SELECT DISTINCT is_professional, COUNT(url) AS particular_profesional 
FROM coches_segunda_mano
GROUP BY is_professional
ORDER BY particular_profesional DESC;

#Coches más anunciados por tipo de combustible

SELECT DISTINCT fuel,count(url) as coche_combustible
FROM coches_segunda_mano
GROUP BY fuel
ORDER BY coche_combustible DESC;

# Precio medio por año del vehículo y tipo de combustible

SELECT year, fuel, AVG(price) AS precio_medio
FROM coches_segunda_mano
GROUP BY year, fuel
ORDER BY precio_medio DESC;





