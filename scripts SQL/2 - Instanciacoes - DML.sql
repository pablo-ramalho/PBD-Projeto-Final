-- operações de inserção de dados nas tabelas (instanciação de dados no banco)

INSERT INTO AEROPORTO VALUES('Aeroporto Internacional de Brasilia', 1);
                            


INSERT INTO COMPANHIA_AEREA VALUES('Avianca', 1, 1),	-- 4 Aeroportos
                                  ('Azul', 2, 1),
                                  ('LATAM', 3, 1),
                                  ('GOL', 4, 1),
                                  ('Copa Airlines', 5, 1);
                                  
ALTER TABLE COMPANHIA_AEREA ADD FOREIGN KEY (ID_AEROPORTO) REFERENCES AEROPORTO(ID_AEROPORTO) ON DELETE SET NULL ON UPDATE CASCADE;
                                  


INSERT INTO FUNCIONARIO VALUES('Bruno Motta', 'brunom@gmail.com', '991813701', 1, 1),	-- 4 Aeroportos
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
							


INSERT INTO OPERADOR_DE_CARGA VALUES('Azul Cargo Express', 1),	-- 12 Funcionários (alguns funcionários são operadores de carga)
									('Avianca Cargo', 2),
                                    ('LATAM Cargo', 3),
                                    ('Gollog', 4);

ALTER TABLE OPERADOR_DE_CARGA ADD FOREIGN KEY (ID_FUNCIONARIO) REFERENCES FUNCIONARIO(ID_FUNCIONARIO) ON DELETE CASCADE ON UPDATE CASCADE;         



INSERT INTO AVIAO VALUES('corredor unico', 1, 100, 1, 4),	-- 12 Companhias Aéreas
						('fuselagem larga', 2, 126, 2, 1),
                        ('fuselagem larga', 3, 132, 3, 12),
                        ('regional', 4, 80, 4, 1),
                        ('corredor duplo', 5, 180, 5, 11),
                        ('corredor unico', 6, 84, 6, 4),
                        ('corredor unico', 7, 76, 7, 2),
                        ('regional', 8, 96, 8, 5),
                        ('regional', 9, 88, 9, 6),
                        ('regional', 10, 80, 10, 6),
                        ('fuselagem larga', 11, 130, 11, 1),
                        ('corredor unico', 12, 84, 12, 11),
                        ('regional', 13, 88, 13, 7),
                        ('corredor unico', 14, 102, 14, 10),
                        ('corredor duplo', 15, 174, 15, 5),
                        ('corredor unico', 16, 96, 16, 2),
                        ('corredor unico', 17, 90, 17, 2),
                        ('regional', 18, 64, 18, 7),
                        ('corredor unico', 19, 98, 19, 12),
                        ('corredor unico', 20, 78, 20, 6),
                        ('regional', 21, 82, 21, 6),
                        ('regional', 22, 84, 22, 7),
                        ('corredor duplo', 23, 194, 23, 8),
                        ('fuselagem larga', 24, 144, 24, 3),
                        ('fuselagem larga', 25, 138, 25, 9),
                        ('corredor duplo', 26, 182, 26, 10),
                        ('corredor unico', 27, 100, 27, 9);

ALTER TABLE AVIAO ADD FOREIGN KEY (ID_COMPANHIA) REFERENCES COMPANHIA_AEREA(ID_COMPANHIA) ON DELETE SET NULL ON UPDATE CASCADE;  



INSERT INTO VOO VALUES('Nova Iorque', '19-05-2016', '17:35:01', 1, 4, 2, 3), -- 27 Aviões, 4 Aeroportos, 4 Funcionários (Operadores de carga)
					  ('Miami', '2021-04-07', '21:04:09', 2, 7, 3, 1),
                      ('Casablanca', '2015-01-15', '09:08:54', 3, 9, 1, 1),
                      ('Toronto', '2022-08-09', '10:07:48', 4, 10, 4, 2),
                      ('Lisboa', '2017-01-02', '15:08:07', 5, 9, 3, 1),
                      ('Madrid', '2022-03-19', '20:31:40', 6, 24, 1, 2),
                      ('Lima', '2018-07-25', '13:00:09', 7, 21, 2, 2),
                      ('Santiago', '2016-12-08', '14:30:02', 8, 8, 2, 3),
                      ('Cidade do Mexico', '2018-08-07', '15:00:01', 9, 1, 4, 4),
                      ('Los Angeles', '2023-01-09', '14:10:25', 10, 12, 3, 1),
                      ('San Francisco', '2021-01-03', '20:11:45', 11, 14, 1, 1),
                      ('Las Vegas', '2016-05-08', '21:15:02', 12, 8, 3, 4),
                      ('Ohio', '2019-09-05', '20:18:03', 13, 7, 3, 3),
                      ('Nova Jersey', '2016-05-01', '15:10:09', 14, 9, 2, 2),
                      ('Toquio', '2023-08-23', '14:10:07', 15, 1, 2, 4),
                      ('Paris', '2019-07-20', '21:03:49', 16, 4, 4, 1),
                      ('Londres', '2023-09-15', '21:04:05', 17, 16, 1, 3),
                      ('Roma', '2017-07-14', '17:01:23', 18, 19, 4, 1),
                      ('Sydney', '2016-03-28', '18:08:27', 19, 2, 3, 3),
                      ('Istambul', '2021-05-20', '15:01:20', 20, 8, 2, 3),
                      ('Cairo', '2016-03-21', '16:12:40', 21, 1, 4, 4),
                      ('Barcelona', '2016-02-15', '09:02:24', 22, 14, 1, 2),
                      ('Atenas', '2018-07-24', '10:01:07', 23, 19, 2, 2),
                      ('Berlim', '2016-05-21', '13:01:48', 24, 26, 3, 4),
                      ('Dublin', '2023-02-20', '16:20:13', 25, 11, 3, 4),
                      ('Seul', '2021-09-21', '21:09:02', 26, 13, 1, 4),
                      ('Buenos Aires', '2016-04-04', '20:15:40', 27, 10, 3, 1),
                      ('Bogota', '2021-01-23', '18:20:41', 28, 17, 2, 3),
                      ('Viena', '2023-04-03', '15:21:03', 29, 11, 4, 2),
                      ('Beirute', '2021-08-02', '18:10:32', 30, 18, 1, 1),
                      ('Okinawa', '2019-09-21', '19:07:30', 31, 21, 2, 4);

ALTER TABLE VOO ADD FOREIGN KEY (ID_AVIAO) REFERENCES AVIAO(ID_AVIAO) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE VOO ADD FOREIGN KEY (ID_AEROPORTO) REFERENCES AEROPORTO(ID_AEROPORTO) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE VOO ADD FOREIGN KEY (ID_FUNCIONARIO) REFERENCES FUNCIONARIO(ID_FUNCIONARIO) ON DELETE SET NULL ON UPDATE CASCADE;



INSERT INTO BAGAGEM VALUES(14, 1, 'aceito', 1, 1, 20),	-- 20 Passageiros, 31 Voos
						  (16, 3, 'despachado', 2, 2, 3),
                          (13, 2, 'despachado', 3, 3, 20),
                          (22, 2, 'entregue', 4, 4, 14),
                          (15, 3, 'danificado', 5, 5, 3),
                          (13, 3, 'atrasado', 6, 6, 10),
                          (14, 1, 'em processamento', 7, 7, 11),
                          (14, 1, 'nao aceito', 8, 8, 11),
                          (16, 2, 'entregue', 9, 9, 11),
                          (15, 1, 'entregue', 10, 10, 14),
                          (16, 3, 'danificado', 11, 11, 18),
                          (23, 3, 'atrasado', 12, 12, 18),
                          (14, 2, 'extraviado', 13, 13, 18),
                          (15, 2, 'em processamento', 14, 14, 19),
                          (16, 3, 'despachado', 15, 15, 19),
                          (15, 1, 'entregue', 16, 16, 30),
                          (15, 1, 'danificado', 17, 17, 30),
                          (23, 1, 'entregue', 18, 18, 12),
                          (14, 3, 'em processamento', 19, 19, 10),
                          (23, 2, 'nao aceito', 20, 20, 10);
                          
ALTER TABLE BAGAGEM ADD FOREIGN KEY (ID_PASSAGEIRO) REFERENCES PASSAGEIRO(ID_PASSAGEIRO) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE BAGAGEM ADD FOREIGN KEY (ID_VOO) REFERENCES VOO(ID_VOO) ON DELETE CASCADE ON UPDATE CASCADE;



INSERT INTO RESERVA_EMBARQUE VALUES('15:09:20', '2023-05-09', 'concluido', '15:30:00', '2023-05-09', 'concluido', 45, 1, 20, 1),
								   ('16:20:01', '2016-09-14', 'concluido', '16:25:23', '2016-09-14', 'concluido', 32, 2, 3, 2),
                                   ('14:32:59', '2021-08-07', 'concluido', '14:40:28', '2021-08-07', 'em andamento', 60, 3, 20, 3),
                                   ('10:01:29', '2022-11-25', 'concluido', '10:07:11', '2022-11-25', 'prioritario', 58, 4, 14, 4),
                                   ('18:05:30', '2017-01-15', 'pendente', '18:10:34', '2017-01-15', 'aberto', 60, 5, 3, 5),
                                   ('19:34:04', '2017-04-03', 'erro', '19:42:02', '2017-04-03', 'encerrado', 21, 6, 10, 6),
                                   ('14:21:22', '2019-12-07', 'concluido', '14:30:27', '2019-12-07', 'concluido', 30, 7, 11, 7),
                                   ('20:32:57', '2019-03-12', 'concluido', '20:34:27', '2019-03-12', 'em andamento', 10, 8, 11, 8),
                                   ('16:43:08', '2021-07-22', 'concluido', '16:45:09', '2021-07-22', 'prioritario', 47, 9, 11, 9),
                                   ('22:00:00', '2018-05-29', 'erro', '22:05:10', '2018-05-29', 'encerrado', 61, 10, 14, 10),
                                   ('17:12:32', '2016-09-14', 'erro', '17:15:02', '2016-09-14', 'encerrado', 56, 11, 18, 11),
                                   ('21:35:49', '2016-09-23', 'pendente', '21:36:59', '2016-09-23', 'aberto', 40, 12, 18, 12),
                                   ('21:09:20', '2023-04-24', 'pendente', '21:20:21', '2023-04-24', 'aberto', 35, 13, 18, 13),
                                   ('15:07:21', '2022-06-19', 'erro', '15:10:03', '2022-06-19', 'encerrado', 39, 14, 19, 14),
                                   ('13:10:08', '2022-05-03', 'concluido', '13:12:07', '2022-05-03', 'concluido', 41, 15, 19, 15),
                                   ('14:20:27', '2018-09-15', 'concluido', '14:23:48', '2018-09-15', 'concluido', 32, 16, 30, 16),
                                   ('19:20:12', '2021-02-16', 'erro', '19:23:10', '2021-02-16', 'encerrado', 20, 17, 30, 17),
                                   ('18:40:43', '2017-07-13', 'concluido', '18:42:01', '2017-07-13', 'em andamento', 10, 18, 12, 18),
                                   ('15:10:06', '2023-04-18', 'pendente', '15:11:56', '2023-04-18', 'aberto', 32, 19, 10, 19),
                                   ('20:09:45', '2023-01-16', 'concluido', '20:15:46', '2023-01-16', 'concluido', 20, 20, 10, 20);

ALTER TABLE RESERVA_EMBARQUE ADD FOREIGN KEY (ID_VOO) REFERENCES VOO(ID_VOO) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE RESERVA_EMBARQUE ADD FOREIGN KEY (ID_PASSAGEIRO) REFERENCES PASSAGEIRO(ID_PASSAGEIRO) ON DELETE CASCADE ON UPDATE CASCADE;