-- operações de criação do banco de dados, tabelas e restrições (chaves primárias e estrangeiras, atributos únicos e demais restrições necessárias)

CREATE DATABASE AEROPORTO;

USE AEROPORTO;

CREATE TABLE IF NOT EXISTS PASSAGEIRO(
    NUM_PASSAPORTE INT UNIQUE,
    NOME_PASSAGEIRO VARCHAR(20) NOT NULL,
    DATA_NASCIMENTO DATE CHECK(DATA_NASCIMENTO < CURRENT_DATE()) NOT NULL,
    GENERO CHAR(1) CHECK(GENERO = 'M' OR GENERO = 'F') NOT NULL,
    NACIONALIDADE VARCHAR(15) NOT NULL,

    ID_PASSAGEIRO INT -- CHAVE PRIMÁRIA

);

CREATE TABLE IF NOT EXISTS FUNCIONARIO(
    NOME_FUNCIONARIO VARCHAR(20) NOT NULL,
    EMAIL VARCHAR(25) CHECK(EMAIL LIKE '%@%.%'),
    TELEFONE CHAR(9) CHECK(TELEFONE LIKE '9[84|91|99]%') UNIQUE NOT NULL,

    ID_FUNCIONARIO INT, -- CHAVE PRIMÁRIA

    ID_AEROPORTO INT -- CHAVE ESTRANGEIRA PARA AEROPORTO

);

CREATE TABLE IF NOT EXISTS SEGURANCA(
    PERMISSAO BOOLEAN,

    ID_FUNCIONARIO INT -- CHAVE ESTRANGEIRA PARA FUNCIONARIO

);

CREATE TABLE IF NOT EXISTS COMPANHIA_AEREA(
    NOME_COMPANHIA VARCHAR(20) CHECK(NOME_COMPANHIA = 'Avianca' OR 
                                     NOME_COMPANHIA = 'Azul' OR 
                                     NOME_COMPANHIA = 'LATAM' OR
                                     NOME_COMPANHIA = 'GOL' OR
                                     NOME_COMPANHIA = 'Copa Airlines' OR
                                     NOME_COMPANHIA = 'TAP Air Portugal' OR
                                     NOME_COMPANHIA = 'Passaredo' OR
                                     NOME_COMPANHIA = 'Qatar Airways' OR
                                     NOME_COMPANHIA = 'Air France KLM' OR
                                     NOME_COMPANHIA = 'Fly Emirates' OR
                                     NOME_COMPANHIA = 'MAP' OR
                                     NOME_COMPANHIA = 'Voepass'),

    ID_COMPANHIA INT, -- CHAVE PRIMÁRIA

    ID_AEROPORTO INT -- CHAVE ESTRANGEIRA PARA AEROPORTO

);

CREATE TABLE IF NOT EXISTS OPERADOR_DE_CARGA(
    EMPRESA_CARGA VARCHAR(20) CHECK((EMPRESA_CARGA = 'Azul Cargo Express') OR
									(EMPRESA_CARGA = 'Avianca Cargo') OR
                                    (EMPRESA_CARGA = 'LATAM Cargo') OR
                                    (EMPRESA_CARGA = 'Gollog')
								   ) NOT NULL,

    ID_FUNCIONARIO INT -- CHAVE ESTRANGEIRA PARA FUNCIONARIO

);

CREATE TABLE IF NOT EXISTS AVIAO(
    TIPO_AVIAO VARCHAR(20) CHECK(TIPO_AVIAO = 'corredor unico' OR
							     TIPO_AVIAO = 'corredor duplo' OR
                                 TIPO_AVIAO = 'longo alcance' OR
                                 TIPO_AVIAO = 'regional' OR
                                 TIPO_AVIAO = 'fuselagem larga'
								) NOT NULL,
    NUMERO_REGISTRO INT UNIQUE NOT NULL,
    CAPACIDADE_ASSENTOS INT CHECK(CAPACIDADE_ASSENTOS > 2),

    ID_AVIAO INT, -- CHAVE PRIMÁRIA

    ID_COMPANHIA INT -- CHAVE ESTRANGEIRA PARA COMPANHIA_AEREA

);

CREATE TABLE IF NOT EXISTS VOO(
    DESTINO VARCHAR(30) NOT NULL,
    DATA_PARTIDA DATE NOT NULL,
    HORA_PARTIDA TIME NOT NULL,

    ID_VOO INT, -- CHAVE PRIMÁRIA

    ID_AVIAO INT,       -- CHAVE ESTRANGEIRA PARA AVIAO
    ID_AEROPORTO INT,   -- CHAVE ESTRANGEIRA PARA AEROPORTO
    ID_FUNCIONARIO INT CHECK(ID_FUNCIONARIO >= 1 AND ID_FUNCIONARIO <= (SELECT COUNT(ID_FUNCIONARIO) FROM OPERADOR_DE_CARGA))  
    -- CHAVE ESTRANGEIRA PARA FUNCIONARIO (OPERADOR DE CARGA)

);

CREATE TABLE IF NOT EXISTS BAGAGEM(
    PESO INT CHECK(PESO > 0) NOT NULL,
    DIMENSOES INT CHECK(DIMENSOES > 0) NOT NULL,	-- EM METROS QUADRADOS (m²)
    STATUS_DESPACHO VARCHAR(15) CHECK(STATUS_DESPACHO = 'aceito' OR 
									  STATUS_DESPACHO = 'em processamento' OR
                                      STATUS_DESPACHO = 'despachado' OR
                                      STATUS_DESPACHO = 'nao aceito' OR
                                      STATUS_DESPACHO = 'extraviado' OR
                                      STATUS_DESPACHO = 'entregue' OR
                                      STATUS_DESPACHO = 'danificado' OR
                                      STATUS_DESPACHO = 'atrasado'
									 ) NOT NULL,
    
    ID_BAGAGEM INT, -- CHAVE PRIMÁRIA

    ID_PASSAGEIRO INT,  -- CHAVE ESTRANGEIRA PARA PASSAGEIRO
    ID_VOO INT          -- CHAVE ESTRANGEIRA PARA VOO

);

CREATE TABLE IF NOT EXISTS AEROPORTO(
    NOME_AEROPORTO VARCHAR(80) NOT NULL,

    ID_AEROPORTO INT -- CHAVE PRIMÁRIA

);

CREATE TABLE IF NOT EXISTS RESERVA_EMBARQUE(
    HORA_CHECKIN TIME CHECK(HORA_CHECKIN < HORA_EMBARQUE) NOT NULL,
    DATA_CHECKIN DATE CHECK(DATA_CHECKIN = DATA_EMBARQUE) NOT NULL,
    STATUS_CHECKIN VARCHAR(15) CHECK(STATUS_CHECKIN = 'concluido' OR
                                     STATUS_CHECKIN = 'erro' OR
                                     STATUS_CHECKIN = 'pendente'
									) NOT NULL,
    HORA_EMBARQUE TIME NOT NULL,
    DATA_EMBARQUE DATE NOT NULL,
    STATUS_EMBARQUE VARCHAR(15) CHECK(STATUS_EMBARQUE = 'aberto' OR
									  STATUS_EMBARQUE = 'concluido' OR
                                      STATUS_EMBARQUE = 'em andamento' OR
                                      STATUS_EMBARQUE = 'encerrado' OR
                                      STATUS_EMBARQUE = 'prioritario'
									 ) NOT NULL,
    NUM_ASSENTO INT NOT NULL,
    CARTAO_EMBARQUE INT,

    ID_VOO INT,         -- CHAVE ESTRANGEIRA PARA VOO
    ID_PASSAGEIRO INT   -- CHAVE ESTRANGEIRA PARA PASSAGEIRO

);

-- DEFINIÇÃO DAS CHAVES PRIMÁRIAS
ALTER TABLE PASSAGEIRO ADD PRIMARY KEY (ID_PASSAGEIRO);

ALTER TABLE FUNCIONARIO ADD PRIMARY KEY (ID_FUNCIONARIO);

ALTER TABLE SEGURANCA ADD PRIMARY KEY (ID_FUNCIONARIO);

ALTER TABLE OPERADOR_DE_CARGA ADD PRIMARY KEY (ID_FUNCIONARIO);

ALTER TABLE AVIAO ADD PRIMARY KEY (ID_AVIAO);

ALTER TABLE VOO ADD PRIMARY KEY (ID_VOO);

ALTER TABLE BAGAGEM ADD PRIMARY KEY (ID_BAGAGEM);

ALTER TABLE COMPANHIA_AEREA ADD PRIMARY KEY (ID_COMPANHIA);

ALTER TABLE AEROPORTO ADD PRIMARY KEY (ID_AEROPORTO);

ALTER TABLE RESERVA_EMBARQUE ADD PRIMARY KEY (ID_VOO, ID_PASSAGEIRO);