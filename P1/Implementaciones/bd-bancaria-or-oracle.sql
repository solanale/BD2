CREATE OR REPLACE TYPE tipoOperacion as ENUM( 'ingresada', 'retirada', 'transferida');

CREATE OR REPLACE TYPE address as OBJECT(
	calle VARCHAR(30),
	portal VARCHAR(10),
	piso INT(3),
	ciudad VARCHAR(20),
	pais VARCHAR(20)
);

CREATE OR REPLACE TYPE usuario as OBJECT(
	dni VARCHAR(9),
	nombre VARCHAR(20),
	apellidos VARCHAR(40),
	edad INT(3),
	direccion address,
	email VARCHAR(20),
	telefono INT(9)
);

CREATE OR REPLACE TYPE cuenta as OBJECT(
	iban VARCHAR(34),
	numero VARCHAR(34),
	creacion DATE(40),
	saldo FLOAT(20)
)NOT FINAL;

CREATE OR REPLACE TYPE cuentaCorriente as OBJECT under cuenta();

CREATE OR REPLACE TYPE cuentaAhorro as OBJECT under cuenta(
	interes FLOAT(5),
	dia DATE
);

CREATE OR REPLACE TYPE oficina as OBJECT(
	codigo VARCHAR(50),
	direccion address,
	telefono INT(9)
);

CREATE OR REPLACE TYPE operacion as OBJECT(
	contador INT(50),
	tipo VARCHAR(20),		--mirar si hacer tipo nuevo
	fechaHora DATE,		--juntar fecha y hora porque el tipo date en oracle almacena las dos
	cOrigen VARCHAR(34),
	cDestino VARCHAR(34),
	sucursal VARCHAR(50),
	concepto VARCHAR(50)
);

CREATE TABLE usuarioTabla OF usuario(PRIMARY KEY(dni));
CREATE TABLE cuentaTabla OF cuenta(PRIMARY KEY(iban));
CREATE TABLE oficinaTabla OF oficina(PRIMARY KEY(codigo));
CREATE TABLE operacionTabla OF operacion(PRIMARY KEY(contador));

CREATE TABLE tiene(
	dni REF(usuarioTabla),
	iban REF(cuentaTabla)
);

CREATE TABLE pertenece(
	codigo REF(oficinaTabla),
	iban REF(cuentaTabla)
);

CREATE TABLE hace(
	iban REF(cuentaTabla),
	contador REF(operacionTabla)
);