CREATE TABLE Saluno (

  nic    NUMERIC(8),   -- número de identificação civil
  nome   VARCHAR(60) NOT NULL,
  numero NUMERIC(5)  NOT NULL,
--
  CONSTRAINT pk_Saluno PRIMARY KEY (nic),
  CONSTRAINT ck_Saluno_nic CHECK (nic > 0),
  CONSTRAINT ck_Saluno_numero CHECK (numero > 0),
  CONSTRAINT un_Saluno_numero UNIQUE (numero)
);

INSERT INTO Saluno (nic, nome, numero) VALUES 
(111, 'Pedro', 40001),
(222, 'Maria', 45100),
(333, 'Ana', 48500);


CREATE TABLE Sdisciplina (

  codigo   NUMERIC(4),   -- codigo da disciplina
  nome     VARCHAR(60) NOT NULL,
  ECTS     NUMERIC(4)  NOT NULL,
--

CONSTRAINT pk_Sdisciplina PRIMARY KEY (codigo),
CONSTRAINT ck_Sdisciplina_ECTS CHECK (codigo>0),
CONSTRAINT ck_Sdisciplina_ECTS CHECK (ECTS>0)
);

INSERT INTO Sdisciplina (codigo, nome, ECTS) VALUES
(1001, 'Bases de Dados',6),
(1002, 'Bases de Dados Avancadas',6),
(1003, 'Introducao as bases de Dados',6);


CREATE TABLE Saprovado (
   nic           NUMERIC(8),
   codigo        NUMERIC(4) NOT NULL,
   classificacao NUMERIC(2) NOT NULL,

--
CONSTRAINT pk_Saprovado PRIMARY KEY (nic,codigo),
CONSTRAINT fk_Saprovado FOREIGN KEY (nic) REFERENCES Saluno(nic),
CONSTRAINT fk_Saprovado1 FOREIGN KEY (codigo) REFERENCES Sdisciplina(codigo),
CONSTRAINT ck_Saprovado_classificacao CHECK (classificacao >9)
);

INSERT INTO Saprovado (nic,codigo,classificacao) VALUES
(111, 1001, 14),
(222, 1001, 16),
(111, 1002, 17);