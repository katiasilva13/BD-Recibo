CREATE TABLE Emitente (
  id INTEGER   NOT NULL ,
  nome CHAR   NOT NULL ,
  documento VARCHAR   NOT NULL ,
  assinatura VARCHAR   NOT NULL   ,
PRIMARY KEY(id));




CREATE TABLE Cliente (
  id INTEGER   NOT NULL ,
  nome VARCHAR   NOT NULL   ,
PRIMARY KEY(id));




CREATE TABLE Cidade (
  id INTEGER   NOT NULL ,
  nome VARCHAR   NOT NULL ,
  estado VARCHAR   NOT NULL   ,
PRIMARY KEY(id));




CREATE TABLE Recibo (
  id INTEGER   NOT NULL ,
  Cliente_id INTEGER   NOT NULL ,
  Emitente_id INTEGER   NOT NULL ,
  numero INTEGER   NOT NULL ,
  valor DOUBLE   NOT NULL ,
  datacadastro DATE   NOT NULL ,
  confirmacao BOOL   NOT NULL ,
  dataemissao DATE   NOT NULL   ,
PRIMARY KEY(id)    ,
  FOREIGN KEY(Emitente_id)
    REFERENCES Emitente(id),
  FOREIGN KEY(Cliente_id)
    REFERENCES Cliente(id));


CREATE INDEX Recibo_FKIndex1 ON Recibo (Emitente_id);
CREATE INDEX Recibo_FKIndex2 ON Recibo (Cliente_id);


CREATE INDEX IFK_Rel_11 ON Recibo (Emitente_id);
CREATE INDEX IFK_Rel_13 ON Recibo (Cliente_id);


CREATE TABLE Endereco (
  id INTEGER   NOT NULL ,
  Cliente_id INTEGER   NOT NULL ,
  Cidade_id INTEGER   NOT NULL ,
  cep INTEGER   NOT NULL ,
  bairro VARCHAR   NOT NULL ,
  complemento VARCHAR    ,
  numero VARCHAR   NOT NULL ,
  logradouro VARCHAR   NOT NULL   ,
PRIMARY KEY(id)    ,
  FOREIGN KEY(Cidade_id)
    REFERENCES Cidade(id),
  FOREIGN KEY(Cliente_id)
    REFERENCES Cliente(id));


CREATE INDEX Endereco_FKIndex1 ON Endereco (Cidade_id);
CREATE INDEX Endereco_FKIndex2 ON Endereco (Cliente_id);


CREATE INDEX IFK_Rel_09 ON Endereco (Cidade_id);
CREATE INDEX IFK_Rel_17 ON Endereco (Cliente_id);


CREATE TABLE Servico (
  id INTEGER   NOT NULL ,
  Recibo_id INTEGER   NOT NULL ,
  nome VARCHAR   NOT NULL ,
  valorunitario DOUBLE   NOT NULL   ,
PRIMARY KEY(id)  ,
  FOREIGN KEY(Recibo_id)
    REFERENCES Recibo(id));


CREATE INDEX Servico_FKIndex1 ON Servico (Recibo_id);


CREATE INDEX IFK_Rel_16 ON Servico (Recibo_id);



