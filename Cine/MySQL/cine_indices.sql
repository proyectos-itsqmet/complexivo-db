use cine;

create index idx_pelicula_genero on pelicula(genero);
show index from pelicula;

create index idx_funcion_fecha on funcion(fecha_hora);
show index from funcion;
