USE universidad;
/*1*/SELECT persona.apellido1, persona.apellido2, persona.nombre, persona.tipo FROM persona WHERE persona.tipo = 'alumno' ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;
/*2*/SELECT persona.apellido1, persona.apellido2, persona.nombre, persona.telefono, persona.tipo FROM persona WHERE persona.tipo = 'alumno' AND persona.telefono IS NULL;
/*3*/SELECT * FROM persona WHERE persona.tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
/*4*/SELECT * FROM profesor INNER JOIN persona ON profesor.id_profesor=persona.id  WHERE persona.telefono IS NULL AND persona.nif LIKE '%k';
/*5*/SELECT * FROM asignatura WHERE cuatrimestre ='1' AND curso ='3' AND id_grado='7';
/*6*/SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre  FROM profesor INNER JOIN departamento ON profesor.id_departamento=departamento.id JOIN persona ON profesor.id_profesor=persona.id ORDER BY persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;
/*7*/SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin, persona.apellido1, persona.apellido2, persona.nombre, persona.nif FROM asignatura INNER JOIN curso_escolar ON asignatura.id=curso_escolar.id JOIN persona ON asignatura.id=persona.id WHERE persona.nif ='26902806M';
/*8*/SELECT DISTINCT departamento.nombre FROM departamento, profesor, asignatura, grado  WHERE departamento.id= profesor.id_departamento AND profesor.id_profesor = asignatura.id_profesor AND grado.id = asignatura.id_grado AND grado.id = 4;
/*9*/SELECT DISTINCT persona.nombre, persona.apellido1  FROM persona, alumno_se_matricula_asignatura, curso_escolar WHERE persona.tipo='alumno' AND persona.id=alumno_se_matricula_asignatura.id_alumno AND alumno_se_matricula_asignatura.id_curso_Escolar=curso_Escolar.id AND curso_escolar.anyo_fin='2019';

/*Resuelve las 6 siguientes consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.*/
/*1*/SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre 'nombre departamento' FROM persona  LEFT JOIN departamento ON persona.id=departamento.id WHERE persona.tipo='profesor' ORDER BY departamento.nombre DESC, persona.apellido1 DESC, persona.apellido2 DESC, persona.nombre DESC;
/*2*/SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre 'nombre departamento' FROM persona  LEFT JOIN departamento ON persona.id=departamento.id WHERE persona.tipo='profesor' AND departamento.nombre IS NULL;
/*3*/SELECT persona.nombre, departamento.nombre FROM departamento RIGHT JOIN persona ON departamento.id=persona.id WHERE persona.tipo = 'profesor' AND departamento.nombre IS NULL;
/*4*/SELECT persona.nombre, asignatura.nombre'asignatura',persona.tipo FROM persona LEFT JOIN profesor ON  persona.id=profesor.id_profesor LEFT JOIN asignatura ON profesor.id_profesor=asignatura.id_profesor WHERE persona.tipo='profesor' AND asignatura.nombre IS NULL;
/*5*/SELECT asignatura.nombre, profesor.id_profesor FROM asignatura LEFT JOIN profesor ON  asignatura.id_profesor=profesor.id_profesor WHERE profesor.id_profesor IS NULL;
/*6*/SELECT departamento.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM departamento LEFT JOIN asignatura ON departamento.id=asignatura.id  LEFT JOIN curso_escolar ON asignatura.id = curso_escolar.id WHERE curso_escolar.id IS NULL;

/*Consultes resum:*/
/*1*/SELECT COUNT(persona.tipo) FROM persona WHERE persona.tipo='alumno';
/*2*/SELECT COUNT(fecha_nacimiento) FROM persona WHERE persona.tipo = 'alumno' AND persona.fecha_nacimiento LIKE '1999%';
/*3*/SELECT departamento.nombre, COUNT(profesor.id_departamento) FROM departamento LEFT JOIN profesor ON departamento.id=profesor.id_departamento WHERE profesor.id_departamento IS NOT NULL GROUP BY profesor.id_departamento  ORDER BY 2 DESC; 
/*4*/SELECT departamento.nombre, COUNT(profesor.id_departamento) FROM departamento LEFT JOIN profesor ON departamento.id=profesor.id_departamento GROUP BY profesor.id_departamento;
/*5*/SELECT grado.nombre, COUNT(asignatura.id) FROM grado LEFT JOIN asignatura ON grado.id=asignatura.id_grado GROUP BY grado.nombre ORDER BY COUNT(asignatura.id) DESC;
/*6*/SELECT grado.nombre, COUNT(asignatura.id) FROM grado LEFT JOIN asignatura ON grado.id=asignatura.id_grado GROUP BY grado.nombre HAVING COUNT(asignatura.id)>40  ;
/*7*/SELECT grado.nombre, asignatura.tipo, SUM(asignatura.creditos) FROM grado RIGHT JOIN asignatura ON grado.id=asignatura.id GROUP BY asignatura.tipo;
/*8*/SELECT curso_escolar.anyo_inicio, SUM(persona.tipo LIKE'alumno%')FROM curso_escolar RIGHT JOIN alumno_se_matricula_asignatura ON curso_escolar.id=alumno_se_matricula_asignatura.id_curso_escolar RIGHT JOIN persona ON alumno_se_matricula_asignatura.id_alumno=persona.id WHERE persona.tipo='alumno' GROUP BY curso_escolar.anyo_inicio;
/*9*/SELECT persona.id, persona.nombre, persona.apellido1, persona.apellido2, SUM(asignatura.id) FROM asignatura RIGHT JOIN profesor ON asignatura.id_profesor=profesor.id_profesor RIGHT JOIN persona ON profesor.id_profesor=persona.id WHERE persona.tipo='profesor' GROUP BY profesor.id_profesor ORDER BY SUM(asignatura.id) DESC;
/*10*/SELECT* FROM persona WHERE persona.tipo='alumno' AND persona.fecha_nacimiento IN(SELECT MAX(persona.fecha_nacimiento) FROM persona);
/*11*/SELECT persona.nombre, departamento.nombre, asignatura.nombre FROM persona LEFT JOIN profesor ON persona.id=profesor.id_profesor LEFT JOIN departamento ON profesor.id_departamento=departamento.id LEFT JOIN asignatura ON profesor.id_profesor=asignatura.id_profesor WHERE persona.tipo='profesor' AND asignatura.nombre IS NULL;
