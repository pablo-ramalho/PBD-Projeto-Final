-- operações de inserção de dados nas tabelas (instanciação de dados no banco)

INSERT INTO AEROPORTO VALUES('Aeroporto Internacional de Brasilia', 1);


INSERT INTO COMPANHIA_AEREA VALUES('Avianca', 1, 1),
                                  ('Azul', 2, 1),
                                  ('LATAM', 3, 1),
                                  ('GOL', 4, 1);
                                  
ALTER TABLE COMPANHIA_AEREA ADD FOREIGN KEY (ID_AEROPORTO) REFERENCES AEROPORTO(ID_AEROPORTO) ON DELETE SET NULL ON UPDATE CASCADE;


INSERT INTO FUNCIONARIO VALUES('Bruno Motta', 'brunom@gmail.com', '991813701', 1, 1),
                              ('Marta Lopes', 'martalps@outlook.com', '984510293', 2, 1),
                              ('Pedro Magalhaes', 'pmag@hotmail.com', '991403912', 3, 1),
                              ('Fernando Silva', 'fernandosilva@hotmail.com', '999801427', 4, 1),
                              ('Leonardo Freitas', 'leofreitas@gmail.com', '999718240', 5, 1),
                              ('João Pereira', 'jpereira@outlook.com', '984194716', 6, 1),
                              ('Sergio Mendes', 'serjm@gmail.com', '984817234', 7, 1),
                              ('Bianca Rocha', 'bibirocha@outlook.com', '991713049', 8, 1),
                              ('Miranda Fagundes', 'mirafagundes@hotmail.com', '991814025', 9, 1),
                              ('Larissa Silva', 'larissaslv@outlook.com', '999714021', 10, 1);

ALTER TABLE FUNCIONARIO ADD FOREIGN KEY (ID_AEROPORTO) REFERENCES AEROPORTO(ID_AEROPORTO) ON DELETE CASCADE ON UPDATE CASCADE;


INSERT INTO PASSAGEIRO VALUES(1, 'Kevin Silva', '1980-03-19', 'M', 'Brasileiro', 1),
                             (2, 'Joana Santos', '1997-12-01', 'F', 'Portugues', 2),
                             (3, 'Carlos Gomes', '1968-01-15', 'M', 'Angolano', 3),
                             (4, 'Felipe Couto', '1998-03-09', 'M', 'Brasileiro', 4),
                             (5, 'Rafaela Morais', '1989-07-12', 'F', 'Brasileiro', 5),
                             (6, 'Bruno Oliveira', '2001-06-02', 'M', 'Brasileiro', 6),
                             (7, 'Henrique Josias', '1982-11-09', 'M', 'Brasileiro', 7),
                             (8, 'Ana Lopes', '1979-05-10', 'F', 'Angolano', 8),
                             (9, 'Rita Otto', '1997-01-27', 'F', 'Portugues', 9),
                             (10, 'Andressa Motta', '1985-09-04', 'F', 'Brasileiro', 10),
                             (11, 'Flavia Borges', '1999-03-09', 'F', 'Brasileiro', 11),
                             (12, 'Fabio Lima', '1998-07-15', 'M', 'Portugues', 12),
                             (13, 'Cassio Antonio', '1997-04-10', 'M', 'Portugues', 13),
                             (14, 'Vilma Rezende', '2000-08-11', 'F', 'Brasileiro', 14),
                             (15, 'Vanessa Peres', '1975-11-03', 'F', 'Brasileiro', 15),
                             (16, 'Marcelo Mattos', '1989-12-28', 'M', 'Brasileiro', 16),
                             (17, 'Carlos Oliveira', '1975-03-19', 'M', 'Portugues', 17),
                             (18, 'Britney Santos', '1995-01-12', 'F', 'Brasileiro', 18),
                             (19, 'Julio Mendes', '1999-08-21', 'M', 'Brasileiro', 19),
                             (20, 'Fernanda Jobim', '1981-08-01', 'F', 'Angolano', 20);


INSERT INTO OPERADOR_DE_CARGA VALUES('Azul Cargo Express', 1), -- 4 FUNCIONARIOS (alguns funcionários são operadores de carga)
                                    ('Avianca Cargo', 2),
                                    ('LATAM Cargo', 3),
                                    ('Gollog', 4);

ALTER TABLE OPERADOR_DE_CARGA ADD FOREIGN KEY (ID_FUNCIONARIO) REFERENCES FUNCIONARIO(ID_FUNCIONARIO) ON DELETE CASCADE ON UPDATE CASCADE;        


INSERT INTO AVIAO VALUES('corredor unico', 1, 100, 1, 1),
                        ('fuselagem larga', 2, 126, 2, 1),
                        ('fuselagem larga', 3, 132, 3, 1),
                        ('regional', 4, 80, 4, 1),
                        ('corredor duplo', 5, 180, 5, 2),
                        ('corredor unico', 6, 84, 6, 2),
                        ('corredor unico', 7, 76, 7, 2),
                        ('regional', 8, 96, 8, 2);

ALTER TABLE AVIAO ADD FOREIGN KEY (ID_COMPANHIA) REFERENCES COMPANHIA_AEREA(ID_COMPANHIA) ON DELETE SET NULL ON UPDATE CASCADE;  


INSERT INTO VOO VALUES('Nova Iorque', '2016-05-19', '17:35:01', 1, 5, 1, 1), -- 8 AVIOES, 1 AEROPORTO, 4 OPERADORES DE CARGA (FUNCIONARIOS)
                      ('Miami', '2021-04-07', '21:04:09', 2, 4, 1, 1),
                      ('Casablanca', '2015-01-15', '09:08:54', 3, 3, 1, 1),
                      ('Toronto', '2022-08-09', '10:07:48', 4, 2, 1, 1),
                      ('Lisboa', '2017-01-02', '15:08:07', 5, 7, 1, 1),
                      ('Madrid', '2022-03-19', '20:31:40', 6, 8, 1, 1),
                      ('Lima', '2018-07-25', '13:00:09', 7, 8, 1, 1),
                      ('Santiago', '2016-12-08', '14:30:02', 8, 6, 1, 2),
                      ('Cidade do Mexico', '2018-08-07', '15:00:01', 9, 1, 1, 2),
                      ('Los Angeles', '2023-01-09', '14:10:25', 10, 4, 1, 2),
                      ('San Francisco', '2021-01-03', '20:11:45', 11, 7, 1, 2),
                      ('Las Vegas', '2016-05-08', '21:15:02', 12, 1, 1, 2),
                      ('Ohio', '2019-09-05', '20:18:03', 13, 3, 1, 2),
                      ('Nova Jersey', '2016-05-01', '15:10:09', 14, 8, 1, 2),
                      ('Toquio', '2023-08-23', '14:10:07', 15, 3, 1, 3),
                      ('Paris', '2019-07-20', '21:03:49', 16, 4, 1, 3),
                      ('Londres', '2023-09-15', '21:04:05', 17, 1, 1, 3),
                      ('Roma', '2017-07-14', '17:01:23', 18, 3, 1, 3),
                      ('Sydney', '2016-03-28', '18:08:27', 19, 7, 1, 3),
                      ('Istambul', '2021-05-20', '15:01:20', 20, 8, 1, 3),
                      ('Toquio', '2003-01-06', '23:09:04', 21, 4, 1, 2),
                      ('Doha', '2015-05-28', '15:03:01', 22, 5, 1, 4);

ALTER TABLE VOO ADD FOREIGN KEY (ID_AVIAO) REFERENCES AVIAO(ID_AVIAO) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE VOO ADD FOREIGN KEY (ID_AEROPORTO) REFERENCES AEROPORTO(ID_AEROPORTO) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE VOO ADD FOREIGN KEY (ID_FUNCIONARIO) REFERENCES FUNCIONARIO(ID_FUNCIONARIO) ON DELETE SET NULL ON UPDATE CASCADE;


INSERT INTO BAGAGEM VALUES(14, 1, 'aceito', 1, 1, 2),
                          (16, 3, 'despachado', 2, 2, 4),
                          (13, 2, 'despachado', 3, 3, 1),
                          (22, 2, 'entregue', 4, 4, 5),
                          (15, 3, 'danificado', 5, 5, 17),
                          (13, 3, 'atrasado', 6, 6, 3),
                          (14, 1, 'em processamento', 7, 7, 19),
                          (14, 1, 'nao aceito', 8, 8, 11),
                          (16, 2, 'entregue', 9, 9, 15),
                          (15, 1, 'entregue', 10, 10, 14),
                          (16, 3, 'danificado', 11, 11, 18),
                          (23, 3, 'atrasado', 12, 12, 20),
                          (14, 2, 'extraviado', 13, 13, 13),
                          (15, 2, 'em processamento', 14, 14, 8),
                          (16, 3, 'despachado', 15, 15, 7),
                          (15, 1, 'entregue', 16, 16, 9),
                          (15, 1, 'danificado', 17, 17, 16),
                          (23, 1, 'entregue', 18, 18, 12),
                          (14, 3, 'em processamento', 19, 19, 6),
                          (23, 2, 'nao aceito', 20, 20, 10);
                          
ALTER TABLE BAGAGEM ADD FOREIGN KEY (ID_PASSAGEIRO) REFERENCES PASSAGEIRO(ID_PASSAGEIRO) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE BAGAGEM ADD FOREIGN KEY (ID_VOO) REFERENCES VOO(ID_VOO) ON DELETE CASCADE ON UPDATE CASCADE;


INSERT INTO RESERVA_EMBARQUE VALUES('15:09:20', '2016-05-19', 'concluido', '15:30:00', '2016-05-19', 'concluido', 45, 1, 1, 1),
                                   ('16:20:01', '2021-04-07', 'concluido', '16:25:23', '2021-04-07', 'concluido', 32, 2, 2, 2),
                                   ('14:32:59', '2015-01-15', 'concluido', '14:40:28', '2015-01-15', 'em andamento', 60, 3, 3, 3),
                                   ('10:01:29', '2022-08-09', 'concluido', '10:07:11', '2022-08-09', 'prioritario', 58, 4, 4, 4),
                                   ('18:05:30', '2017-01-02', 'pendente', '18:10:34', '2017-01-02', 'aberto', 60, 5, 5, 5),
                                   ('19:34:04', '2022-03-19', 'erro', '19:42:02', '2022-03-19', 'encerrado', 21, 6, 6, 6),
                                   ('14:21:22', '2018-07-25', 'concluido', '14:30:27', '2018-07-25', 'concluido', 30, 7, 7, 7),
                                   ('20:32:57', '2016-12-08', 'concluido', '20:34:27', '2016-12-08', 'em andamento', 10, 8, 8, 8),
                                   ('16:43:08', '2018-08-07', 'concluido', '16:45:09', '2018-08-07', 'prioritario', 47, 9, 9, 9),
                                   ('22:00:00', '2023-01-09', 'erro', '22:05:10', '2023-01-09', 'encerrado', 61, 10, 10, 10),
                                   ('17:12:32', '2021-01-03', 'erro', '17:15:02', '2021-01-03', 'encerrado', 56, 11, 11, 11),
                                   ('21:35:49', '2016-05-08', 'pendente', '21:36:59', '2016-05-08', 'aberto', 40, 12, 12, 12),
                                   ('21:09:20', '2019-09-05', 'pendente', '21:20:21', '2019-09-05', 'aberto', 35, 13, 13, 13),
                                   ('15:07:21', '2016-05-01', 'erro', '15:10:03', '2016-05-01', 'encerrado', 39, 14, 14, 14),
                                   ('13:10:08', '2023-08-23', 'concluido', '13:12:07', '2023-08-23', 'concluido', 41, 15, 15, 15),
                                   ('14:20:27', '2019-07-20', 'concluido', '14:23:48', '2019-07-20', 'concluido', 32, 16, 16, 16),
                                   ('19:20:12', '2023-09-15', 'erro', '19:23:10', '2023-09-15', 'encerrado', 20, 17, 17, 17),
                                   ('18:40:43', '2017-07-14', 'concluido', '18:42:01', '2017-07-14', 'em andamento', 10, 18, 18, 18),
                                   ('15:10:06', '2016-03-28', 'pendente', '15:11:56', '2016-03-28', 'aberto', 32, 19, 19, 19),
                                   ('20:09:45', '2021-05-20', 'concluido', '20:15:46', '2021-05-20', 'concluido', 20, 20, 20, 20);
                                    '00:30:00', '2003-01-05', 'concluido', '00:38:00', '2003-01-05', 'concluido', 40, 21, 21, 1),
                                    ('00:30:00', '2003-01-05', 'concluido', '00:42:00', '2003-01-05', 'concluido', 41, 21, 21, 2),
                                    ('00:30:00', '2003-01-05', 'concluido', '00:41:00', '2003-01-05', 'concluido', 50, 21, 21, 3),
                                    ('00:30:00', '2003-01-05', 'concluido', '00:40:00', '2003-01-05', 'concluido', 10, 21, 21, 4),
                                    ('00:30:00', '2003-01-05', 'concluido', '00:49:00', '2003-01-05', 'concluido', 28, 21, 21, 5),
                                    ('00:30:00', '2003-01-05', 'concluido', '00:57:00', '2003-01-05', 'concluido', 32, 21, 21, 6),
                                    ('00:30:00', '2003-01-05', 'concluido', '00:58:00', '2003-01-05', 'concluido', 48, 21, 21, 7),
                                    ('00:30:00', '2003-01-05', 'concluido', '00:54:00', '2003-01-05', 'concluido', 39, 21, 21, 8),
                                    ('00:30:00', '2003-01-05', 'concluido', '00:37:00', '2003-01-05', 'concluido', 51, 21, 21, 9),
                                    ('00:30:00', '2003-01-05', 'concluido', '00:39:00', '2003-01-05', 'concluido', 34, 21, 21, 10),
                                    '14:50:00', '2016-06-23', 'concluido', '15:02:00', '2016-06-23', 'concluido', 57, 22, 22, 5),
                                    ('14:54:00', '2016-06-23', 'concluido', '15:01:00', '2016-06-23', 'concluido', 58, 22, 22, 6),
                                    ('14:52:00', '2016-06-23', 'concluido', '15:01:53', '2016-06-23', 'concluido', 45, 22, 22, 7),
                                    ('14:57:00', '2016-06-23', 'concluido', '15:02:47', '2016-06-23', 'concluido', 56, 22, 22, 8),
                                    ('14:51:00', '2016-06-23', 'concluido', '15:01:22', '2016-06-23', 'concluido', 60, 22, 22, 9),
                                    ('14:52:00', '2016-06-23', 'concluido', '15:02:01', '2016-06-23', 'concluido', 41, 22, 22, 10),
                                    ('14:51:00', '2016-06-23', 'concluido', '15:00:40', '2016-06-23', 'concluido', 48, 22, 22, 11),
                                    ('14:53:00', '2016-06-23', 'concluido', '15:01:53', '2016-06-23', 'concluido', 32, 22, 22, 12);


ALTER TABLE RESERVA_EMBARQUE ADD FOREIGN KEY (ID_VOO) REFERENCES VOO(ID_VOO) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE RESERVA_EMBARQUE ADD FOREIGN KEY (ID_PASSAGEIRO) REFERENCES PASSAGEIRO(ID_PASSAGEIRO) ON DELETE CASCADE ON UPDATE CASCADE;