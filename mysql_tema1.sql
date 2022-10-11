USE tienda;
/*1*/SELECT nombre FROM producto;
/*2*/SELECT nombre, precio FROM producto;
/*3*/SELECT * FROM producto;
/*4*/SELECT nombre, concat(precio*0.99,"$"), concat(precio,"€") FROM producto;
/*5*/SELECT nombre AS 'nombre de producto', concat(precio*0.99,"$") AS 'Dolares Estadounidense', concat(precio,"€") AS 'Euro' FROM producto;
/*6*/SELECT UCASE(nombre), precio FROM producto;
/*7*/SELECT LCASE(nombre), precio FROM producto;
/*8*/SELECT nombre,UCASE(substr(nombre,1,2)) AS '2 letras mayuscula'FROM fabricante;
/*9*/SELECT nombre, ROUND(precio) FROM producto;
/*10*/SELECT TRUNCATE (precio,0), nombre FROM producto;
/*11*/SELECT codigo_fabricante FROM tienda.producto;
/*12*/SELECT DISTINCT codigo_fabricante FROM tienda.producto;
/*13*/SELECT nombre FROM fabricante ORDER BY nombre ASC;
/*14*/SELECT nombre FROM fabricante ORDER BY nombre DESC;
/*15*/SELECT nombre FROM producto ORDER BY nombre ASC, precio DESC;
/*16*/SELECT * FROM fabricante LIMIT 5;
/*17*/SELECT * FROM fabricante LIMIT 2 OFFSET 3;
/*18*/SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1; 
/*19*/SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1; 
/*20*/SELECT nombre, codigo_fabricante FROM producto WHERE codigo_fabricante =2;
/*21*/SELECT producto.nombre, precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo ;
/*22*/SELECT producto.nombre, precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo ORDER BY fabricante.nombre ASC;
/*23*/SELECT producto.codigo, producto.nombre, fabricante.nombre, fabricante.codigo FROM producto INNER JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo;
/*24*/SELECT producto.nombre, precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo ORDER BY precio ASC LIMIT 1;
/*25*/SELECT producto.nombre, precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo ORDER BY precio DESC LIMIT 1;
/*26*/SELECT * FROM producto INNER JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo WHERE fabricante.nombre='Lenovo';
/*27*/SELECT * FROM producto INNER JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo WHERE fabricante.nombre='Crucial' AND producto.precio>200;
/*28*/SELECT * FROM producto INNER JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo WHERE fabricante.nombre= 'Asus' OR fabricante.nombre='Hewlett-Packard'OR fabricante.nombre='Seagate';
/*29*/SELECT * FROM producto INNER JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo WHERE fabricante.nombre IN ('Asus','Hewlett-Packard','Seagate');
/*30*/SELECT producto.nombre, precio FROM producto INNER JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo WHERE fabricante.nombre LIKE ('%e');
/*31*/SELECT producto.nombre, precio FROM producto INNER JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo WHERE fabricante.nombre LIKE ('%w%');
/*32*/SELECT producto.nombre, precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo WHERE precio >=180 ORDER BY precio DESC, producto.nombre ASC;
/*33*/SELECT fabricante.codigo, fabricante.nombre FROM fabricante INNER JOIN producto ON producto.codigo_fabricante=fabricante.codigo;
/*34*/SELECT fabricante.nombre, producto.nombre FROM fabricante LEFT JOIN producto ON producto.codigo_fabricante=fabricante.codigo;
/*35*/SELECT fabricante.nombre FROM fabricante LEFT JOIN producto ON producto.codigo_fabricante != fabricante.codigo WHERE NOT fabricante.codigo = ANY (  SELECT producto.codigo_fabricante  FROM producto) LIMIT 10,2;
/*36*/SELECT * FROM producto WHERE codigo_fabricante = (  SELECT codigo FROM fabricante WHERE nombre='Lenovo');
/*37*/SELECT * FROM producto WHERE precio = (  SELECT MAX(precio) FROM producto WHERE codigo_fabricante =( SELECT codigo FROM fabricante WHERE nombre='Lenovo'));
/*38*/SELECT producto.nombre, MAX(precio) FROM producto INNER JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo WHERE fabricante.nombre='Lenovo';
/*39*/SELECT producto.nombre, MIN(precio) FROM producto INNER JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo WHERE fabricante.nombre= 'Hewlett-Packard';
/*40*/SELECT nombre FROM producto WHERE precio >= ( SELECT MAX(precio)FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre="Lenovo"));
/*41*/SELECT * FROM producto WHERE precio > (SELECT AVG(precio) FROM producto INNER JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo WHERE fabricante.nombre='Asus');






