--2. Preparação da base de dados (2,0)

--b. Criar os scripts das tabelas.

CREATE TABLE tb_Usuario (
    id_usuario INTEGER PRIMARY KEY AUTOINCREMENT, --se não der certo, coloque auto_increment, ou troque integer por int
    nome_usuario VARCHAR(100),
    email_usuario VARCHAR(100) UNIQUE,
    telefone_usuario VARCHAR(15)
);

CREATE TABLE tb_Motorista (
    id_motorista INTEGER PRIMARY KEY AUTOINCREMENT, --mesmo de cima
    nome_motorista VARCHAR(100),
    email_motorista VARCHAR(100) UNIQUE,
    telefone_motorista VARCHAR(15)
);

CREATE TABLE tb_Veiculo (
    id_veiculo INTEGER PRIMARY KEY AUTOINCREMENT, --mesmo de cima
    placa_veiculo VARCHAR(10) UNIQUE,
    marca_veiculo VARCHAR(50),
    modelo_veiculo VARCHAR(50),
    id_motorista INT,
    CONSTRAINT fk_motorista_veiculo FOREIGN KEY (id_motorista) REFERENCES Motorista(id_motorista)
);

CREATE TABLE tb_Agendamento_Carona (
    id_agendamento INTEGER PRIMARY KEY AUTOINCREMENT, --mesmo de cima
    id_usuario INT,
    data_inicio DATE,
    hora_inicio TIME,
    carona_status VARCHAR(20), --creio que só "status é palavra reservada"
    uf_partida VARCHAR(2),
    cidade_partida VARCHAR(50),
    bairro_partida VARCHAR(50),
    rua_partida VARCHAR(50),
    numero_endereco_partida VARCHAR(10),
    uf_chegada VARCHAR(2),
    cidade_chegada VARCHAR(50),
    bairro_chegada VARCHAR(50),
    rua_chegada VARCHAR(50),
    preco_agendamento DECIMAL(10, 2),
    CONSTRAINT fk_usuario_agendamento FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE tb_Viagem (
    id_viagem INTEGER PRIMARY KEY AUTOINCREMENT, --mesmo de cima
    id_motorista INT,
    id_agendamento INT,
    data_inicio DATE,
    hora_inicio TIME,
    data_fim DATE,
    hora_fim TIME,
    CONSTRAINT fk_motorista_viagem FOREIGN KEY (id_motorista) REFERENCES Motorista(id_motorista),
    CONSTRAINT fk_agendamento_viagem FOREIGN KEY (id_agendamento) REFERENCES Agendamento_Carona(id_agendamento)
);

SELECT * FROM tb_Agendamento_Carona;

--c. Incluir dados significativos suficientes para se realizar os testes dos comandos e procedimentos que serão criados.

--povoando com dados...

INSERT INTO tb_Usuario (nome_usuario, email_usuario, telefone_usuario)
VALUES 
('João Silva', 'joao@gmail.com', '123456789'),
('Maria Oliveira', 'maria@gmail.com', '987654321'),
('Pedro Albuquerque', 'pedroalb@gmail.com', '543210987'),
('Ana Clara', 'anaclara@gmail.com', '741852963'),
('Luiz Carlos', 'luizcarlos@gmail.com', '369258147'),
('Juliana Freitas', 'juliana.freitas@gmail.com', '852963741'),
('Gabriel Marques', 'gabrielmarques@gmail.com', '135792468'),
('Rafaela Sousa', 'rafaela.sousa@gmail.com', '654321098'),
('Carlos Eduardo', 'carloseduardo@gmail.com', '321654987'),
('Beatriz Costa', 'beatriz.costa@gmail.com', '987654321'),
('Daniel Silva', 'danielsilva@gmail.com', '741852963'),
('Leticia Oliveira', 'leticiaoliveira@gmail.com', '852963741'),
('Mateus Almeida', 'mateus.almeida@gmail.com', '369258147'),
('Laura Ferreira', 'laura.ferreira@gmail.com', '135792468'),
('Felipe Henrique', 'felipehenrique@gmail.com', '654321098'),
('Giovana Martins', 'giovana.martins@gmail.com', '321654987'),
('Ronaldo Santos', 'ronaldosantos@gmail.com', '987654321'),
('Adriana Lima', 'adrianalima@gmail.com', '741852963'),
('Eduardo Moreira', 'eduardomoreira@gmail.com', '852963741'),
('Caroline Fernandes', 'carolinefernandes@gmail.com', '369258147'),
('Guilherme Diniz', 'guilhermedfdiniz@gmail.com', '135792468'), 
('Anastasia Levko', 'anastasialevk@gmail.com', '654321098'), 
('Marcelo Farias', 'marcelofarias@gmail.com', '321654987'),
('Larissa Castro', 'larissacastro@gmail.com', '987654321'),
('Vinicius Rocha', 'viniciusrocha@gmail.com', '741852963'),
('Julia Reis', 'juliareis@gmail.com', '852963741'),
('Leonardo Silva', 'leonardosilva@gmail.com', '369258147'),
('Catarina Barbosa', 'catarinabarbosa@gmail.com', '135792468'),
('Thiago Mendes', 'thiagomendes@gmail.com', '654321098'),
('Luana Gomes', 'luanagomes@gmail.com', '321654987'),
('Ricardo Alves', 'ricardoalves@gmail.com', '987654321'),
('Patricia Santos', 'patriciasantos@gmail.com', '741852963'),
('Andre Luiz', 'andre.luis@gmail.com', '852963741'),
('Mariana Cardoso', 'marianacardoso@gmail.com', '369258147'),
('Cristiano Oliveira', 'cristianooliveira@gmail.com', '135792468'),
('Sofia Rodrigues', 'sofiarodrigues@gmail.com', '654321098'),
('Felipe Silva', 'felipesilva@gmail.com', '321654987'),
('Raquel Fernandes', 'raquelfernandes@gmail.com', '987654321'),
('Marcos Paulo', 'marcospaulo@gmail.com', '741852963'),
('Isabella Souza', 'isabellasouza@gmail.com', '852963741'),
('Lucas Vieira', 'lucasvieira@gmail.com', '369258147'),
('Gabriela Almeida', 'gabrielaalmeida@gmail.com', '135792468'),
('Rodrigo Martins', 'rodrigomartins@gmail.com', '654321098'),
('Aline Cruz', 'alinecruz@gmail.com', '321654987'),
('Alexandre Silva', 'alexandresilva@gmail.com', '987654321'),
('Vitoria Ferreira', 'vitoriaferreira@gmail.com', '741852963'),
('Yago Santos', 'yagosantos@gmail.com', '852963741'),
('Luisa Oliveira', 'luisaoliveira@gmail.com', '369258147'),
('Bianca Castro', 'biancacastro@gmail.com', '135792468')

INSERT INTO tb_Usuario (nome_usuario, email_usuario, telefone_usuario)
VALUES
    ('Ana Maria Silva', 'anamaria3.silva@gmail.com', '11987654321'),
    ('Pedro Henrique Souza', 'pedro.henrique6.souza@gmail.com', '21975312345'),
    ('Carla Oliveira', 'carla.oliveira3@hotmail.com', '41987654321'), -- Variando o provedor de email
    ('Roberto Santos', 'roberto.santos2@yahoo.com.br', '12345678901'),
    ('Juliana Fernandes', 'juliana.fernandes3@outlook.com', '11987654321'),
    ('Rafael Costa', 'rafa.costa4@gmail.com', '21975312345'),
    ('Camila Pereira', 'camila.pereira1@hotmail.com', '41987654321'),
    ('Bruno Almeida', 'bruno.almeida4@yahoo.com.br', '12345678901'),
    ('Fernanda Santos', 'fernanda.santos4@outlook.com', '11987654321'),
    ('Gustavo Lima', 'gustavo.lima4@gmail.com', '21975312345'),
    ('Larissa Oliveira', 'larissa.oliveira15@hotmail.com', '41987654321'),
    ('Lucas Rodrigues', 'lucas.rodrigues2@yahoo.com.br', '12345678901'),
    ('Amanda Silva', 'amanda.silva62@outlook.com', '11987654321'),
    ('Felipe Souza', 'felipe.souza21@gmail.com', '21975312345'),
    ('Bianca Pereira', 'bianca.pereira1@hotmail.com', '41987654321')
;

SELECT * from tb_Usuario
SELECT * from tb_motorista
--motoristas

INSERT INTO tb_motorista (nome_motorista, email_motorista, telefone_motorista)
VALUES 
('Carlos Pereira', 'carlos@gmail.com', '222222222'),
('Ana Lima', 'ana@gmail.com', '333333333'),
('Mohammed Ali', 'mohammedali@gmail.com', '444444444'),
('Sara Levi', 'saralevi@gmail.com', '555555555'),
('João Paulo', 'joaopaulo@gmail.com', '666666666'),
('Fatima Hassan', 'fatimahassan@gmail.com', '777777777'),
('Luiz Felipe', 'luizfelipe@gmail.com', '888888888'),
('Rebeca Cohen', 'rebecacohen@gmail.com', '999999999'),
('Gabriel Marques', 'gabrielmarques@gmail.com', '101010101'),
('Aisha Abdullah', 'aishaabdullah@gmail.com', '111111111'),
('Pedro Henrique', 'pedrohenrique@gmail.com', '121212121'),
('Noa Ben-David', 'noabendavid@gmail.com', '131313131'),
('Rafaela Sousa', 'rafaelasousa@gmail.com', '141414141'),
('Khalid Al-Khaled', 'khalidalkhaled@gmail.com', '151515151'),
('Leticia Oliveira', 'leticiaoliveira@gmail.com', '161616161'),
('Yousef Ali', 'yousefali@gmail.com', '171717171'),
('Marcelo Farias', 'marcelofarias@gmail.com', '181818181'),
('Shira Israeli', 'shiraisraeli@gmail.com', '191919191'),
('Vinicius Rocha', 'viniciusrocha@gmail.com', '202020202'),
('Noura Al-Faisal', 'nouralfaisal@gmail.com', '212121212'),
('Thiago Mendes', 'thiagomendes@gmail.com', '222222223'),
('Ayala Levy', 'ayalalevy@gmail.com', '232323232'),
('Larissa Castro', 'larissacastro@gmail.com', '242424242'),
('Omar Al-Amin', 'omaralamin@gmail.com', '252525252'),
('Julia Reis', 'juliareis@gmail.com', '262626262'),
('David Ben-Zvi', 'davidbenzvi@gmail.com', '272727272'),
('Catarina Barbosa', 'catarinabarbosa@gmail.com', '282828282'),
('Amir Hassan', 'amirhassan@gmail.com', '292929292'),
('Lucas Vieira', 'lucasvieira@gmail.com', '303030303'),
('Soraya Ali', 'sorayaali@gmail.com', '313131313'),
('Rodrigo Martins', 'rodrigomartins@gmail.com', '323232323'),
('Yael Cohen', 'yaelcohen@gmail.com', '333333334'),
('Gabriela Almeida', 'gabrielaalmeida@gmail.com', '343434343'),
('Faisal Al-Khateeb', 'faisalalkhateeb@gmail.com', '353535353'),
('Isabella Souza', 'isabellasouza@gmail.com', '363636363'),
('Noam Gonen', 'noamgonen@gmail.com', '373737373'),
('Ricardo Alves', 'ricardoalves@gmail.com', '383838383'),
('Leila Hassan', 'leilahassan@gmail.com', '393939393'),
('Marcos Paulo', 'marcospaulo@gmail.com', '404040404'),
('Shlomo Levy', 'shlomolevy@gmail.com', '414141414'),
('Aline Cruz', 'alinecruz@gmail.com', '424242424'),
('Kamal Al-Faisal', 'kamalfaisal@gmail.com', '434343434'),
('Vitoria Ferreira', 'vitoriaferreira@gmail.com', '444444445'),
('Yitzhak Cohen', 'yitzhakcohen@gmail.com', '454545454'),
('Luisa Oliveira', 'luisaoliveira@gmail.com', '464646464'),
('Ahmed Al-Khaled', 'ahmedalkhaled@gmail.com', '474747474'),
('Bianca Castro', 'biancacastro@gmail.com', '484848484')

--veiculos

INSERT INTO tb_Veiculo (placa_veiculo, marca_veiculo, modelo_veiculo, id_motorista)
VALUES 
('DRU5515', 'Volkswagen', 'Nivus', 1),
('XYZ5678', 'Honda', 'Civic', 2),
('DEF4567', 'Volkswagen', 'Golf', 3),
('GHI8901', 'Nissan', 'Sentra', 4),
('JKL2345', 'Ford', 'Focus', 5),
('MNO6789', 'Renault', 'Kwid', 6),
('PQR3456', 'Chevrolet', 'Onix', 7),
('STU1234', 'Hyundai', 'HB20', 8),
('VWX5678', 'Kia', 'Rio', 9),
('EFG4567', 'Fiat', 'Punto', 10),
('IJK8901', 'Peugeot', '208', 11),
('LMN2345', 'Citroen', 'C4', 12),
('NOP5678', 'BMW', '320i', 13),
('QRS3456', 'Audi', 'A4', 14),
('TUV1234', 'Mercedes-Benz', 'C-Class', 15),
('XYZ1A23', 'Volkswagen', 'Polo', 16),
('CBA4567', 'Honda', 'City', 17),
('FGH2345', 'Toyota', 'Yaris', 18),
('JKM6789', 'Nissan', 'Versa', 19),
('PON1234', 'Renault', 'Sandero', 20),
('STU9012', 'Ford', 'Fiesta', 21),
('VWZ3456', 'Kia', 'Picanto', 22),
('ECD4567', 'Hyundai', 'i30', 23),
('GHI2345', 'Chevrolet', 'Prisma', 24),
('LMN5678', 'Fiat', 'Strada', 25),
('OPQ3456', 'Peugeot', '308', 26),
('RST1234', 'Citroen', 'C3', 27),
('UVW5678', 'BMW', '118i', 28),
('XYZ2345', 'Audi', 'A3', 29),
('CBA1A23', 'Mercedes-Benz', 'CLA', 30),
('DEA4567', 'Volkswagen', 'Passat', 31),
('FGH4567', 'Honda', 'Accord', 32),
('JKL6789', 'Toyota', 'Camry', 33),
('MNO2345', 'Nissan', 'Altima', 34),
('POQ3456', 'Renault', 'Fluence', 35),
('STU4567', 'Ford', 'Mondeo', 36),
('VWX1234', 'Kia', 'Optima', 37),
('EFG1234', 'Hyundai', 'Sonata', 38),
('IJK4567', 'Chevrolet', 'Malibu', 39),
('LMN8901', 'Fiat', 'Argo', 40),
('NOP2345', 'Peugeot', '508', 41),
('QRS1234', 'Citroen', 'C5', 42),
('TUV4567', 'BMW', '528i', 43),
('XYA1A23', 'Audi', 'A6', 44),
('CBA2345', 'Mercedes-Benz', 'E-Class', 45),
('FGH6789', 'Volkswagen', 'Tiguan', 46),
('JKM1234', 'Honda', 'CR-V', 47)

-- agendamento 

INSERT INTO tb_Agendamento_Carona (id_usuario, data_inicio, hora_inicio, carona_status, uf_partida, cidade_partida, bairro_partida, rua_partida, numero_endereco_partida, uf_chegada, cidade_chegada, bairro_chegada, rua_chegada, preco_agendamento)
VALUES 
(1, '2024-11-20', '08:00:00', 'Pendente', 'SP', 'Sorocaba', 'Centro', 'Rua General Osório', '100', 'SP', 'São Paulo', 'Sé', 'Rua Direita', 150.00),
(2, '2024-11-21', '09:00:00', 'Pendente', 'SP', 'Itu', 'Centro', 'Rua do Comércio', '200', 'SP', 'Campinas', 'Cambuí', 'Rua das Flores', 120.00),
(3, '2024-11-22', '10:00:00', 'Pendente', 'SP', 'Piedade', 'Jardim São Caetano', 'Rua São Caetano', '300', 'SP', 'Sorocaba', 'Vila Haro', 'Rua Haro', 90.00),
(4, '2024-11-23', '11:00:00', 'Pendente', 'SP', 'Ibiúna', 'Centro', 'Rua do Mercado', '400', 'SP', 'Itapetininga', 'Centro', 'Rua XV de Novembro', 100.00),
(5, '2024-11-24', '12:00:00', 'Pendente', 'SP', 'Sorocaba', 'Walter Zumbini', 'Rua Walter Zumbini', '500', 'SP', 'Jundiaí', 'Centro', 'Rua do Comércio', 140.00),
(6, '2024-11-25', '13:00:00', 'Pendente', 'SP', 'Tatuí', 'Centro', 'Rua do Município', '600', 'SP', 'São Roque', 'Centro', 'Rua do Comércio', 110.00),
(7, '2024-11-26', '14:00:00', 'Pendente', 'SP', 'Sorocaba', 'Jardim América', 'Rua América', '700', 'SP', 'Mauá', 'Centro', 'Rua do Município', 130.00),
(8, '2024-11-27', '15:00:00', 'Pendente', 'SP', 'Itapetininga', 'Jardim São Paulo', 'Rua São Paulo', '800', 'SP', 'Sorocaba', 'Vila Industrial', 'Rua Industrial', 120.00),
(9, '2024-11-28', '16:00:00', 'Pendente', 'SP', 'Piedade', 'Jardim das Acácias', 'Rua das Acácias', '900', 'SP', 'São Bernardo do Campo', 'Centro', 'Rua do Comércio', 150.00),
(10, '2024-11-29', '17:00:00', 'Pendente', 'SP', 'Ibiúna', 'Jardim do Vale', 'Rua do Vale', '1000', 'SP', 'Diadema', 'Centro', 'Rua do Município', 140.00),
(11, '2024-11-30', '08:00:00', 'Pendente', 'SP', 'Sorocaba', 'Jardim São Francisco', 'Rua São Francisco', '1100', 'SP', 'Itapetininga', 'Centro', 'Rua XV de Novembro', 100.00),
(12, '2024-12-01', '09:00:00', 'Pendente', 'SP', 'Ibiúna', 'Jardim das Flores', 'Rua das Flores', '1200', 'SP', 'São Roque', 'Centro', 'Rua do Comércio', 110.00),
(13, '2024-12-02', '10:00:00', 'Pendente', 'SP', 'Piedade', 'Jardim São João', 'Rua São João', '1300', 'SP', 'Mauá', 'Centro', 'Rua do Município', 130.00),
(14, '2024-12-03', '11:00:00', 'Pendente', 'SP', 'Sorocaba', 'Vila Haro', 'Rua Haro', '1400', 'SP', 'Jundiaí', 'Centro', 'Rua do Comércio', 140.00),
(15, '2024-12-04', '12:00:00', 'Pendente', 'SP', 'Tatuí', 'Jardim São Luís', 'Rua São Luís', '1500', 'SP', 'São Bernardo do Campo', 'Centro', 'Rua do Comércio', 150.00),
(16, '2024-12-05', '13:00:00', 'Pendente', 'SP', 'Itu', 'Jardim do Lago', 'Rua do Lago', '1600', 'SP', 'Diadema', 'Centro', 'Rua do Município', 140.00),
(17, '2024-12-06', '14:00:00', 'Pendente', 'SP', 'Ibiúna', 'Jardim do Vale', 'Rua do Vale', '1700', 'SP', 'Guarulhos', 'Centro', 'Rua do Comércio', 160.00),
(18, '2024-12-07', '15:00:00', 'Pendente', 'SP', 'Piedade', 'Jardim das Acácias', 'Rua das Acácias', '1800', 'SP', 'São José dos Campos', 'Centro', 'Rua do Município', 170.00),
(19, '2024-12-08', '16:00:00', 'Pendente', 'SP', 'Sorocaba', 'Jardim América', 'Rua América', '1900', 'SP', 'Campinas', 'Cambuí', 'Rua das Flores', 120.00),
(20, '2024-12-09', '17:00:00', 'Pendente', 'SP', 'Tatuí', 'Centro', 'Rua do Município', '2000', 'SP', 'Itapetininga', 'Centro', 'Rua XV de Novembro', 100.00),
(21, '2024-12-10', '08:00:00', 'Pendente', 'SP', 'Ibiúna', 'Jardim das Flores', 'Rua das Flores', '2100', 'SP', 'São Roque', 'Centro', 'Rua do Comércio', 110.00),
(22, '2024-12-11', '09:00:00', 'Pendente', 'SP', 'Piedade', 'Jardim São João', 'Rua São João', '2200', 'SP', 'Mauá', 'Centro', 'Rua do Município', 130.00),
(23, '2024-12-12', '10:00:00', 'Pendente', 'SP', 'Sorocaba', 'Vila Industrial', 'Rua Industrial', '2300', 'SP', 'Jundiaí', 'Centro', 'Rua do Comércio', 140.00),
(24, '2024-12-13', '11:00:00', 'Pendente', 'SP', 'Tatuí', 'Jardim São Luís', 'Rua São Luís', '2400', 'SP', 'São Bernardo do Campo', 'Centro', 'Rua do Comércio', 150.00),
(25, '2024-12-14', '12:00:00', 'Pendente', 'SP', 'Itu', 'Jardim do Lago', 'Rua do Lago', '2500', 'SP', 'Diadema', 'Centro', 'Rua do Município', 140.00),
(26, '2024-12-15', '13:00:00', 'Pendente', 'SP', 'Ibiúna', 'Jardim do Vale', 'Rua do Vale', '2600', 'SP', 'Guarulhos', 'Centro', 'Rua do Comércio', 160.00),
(27, '2024-12-16', '14:00:00', 'Pendente', 'SP', 'Piedade', 'Jardim das Acácias', 'Rua das Acácias', '2700', 'SP', 'São José dos Campos', 'Centro', 'Rua do Município', 170.00),
(28, '2024-12-17', '15:00:00', 'Pendente', 'SP', 'Sorocaba', 'Jardim América', 'Rua América', '2800', 'SP', 'Campinas', 'Cambuí', 'Rua das Flores', 120.00),
(29, '2024-12-18', '16:00:00', 'Pendente', 'SP', 'Tatuí', 'Centro', 'Rua do Município', '2900', 'SP', 'Itapetininga', 'Centro', 'Rua XV de Novembro', 100.00),
(30, '2024-12-19', '17:00:00', 'Pendente', 'SP', 'Ibiúna', 'Jardim das Flores', 'Rua das Flores', '3000', 'SP', 'São Roque', 'Centro', 'Rua do Comércio', 110.00),
(31, '2024-12-20', '08:00:00', 'Pendente', 'SP', 'Piedade', 'Jardim São João', 'Rua São João', '3100', 'SP', 'Mauá', 'Centro', 'Rua do Município', 130.00),
(32, '2024-12-21', '09:00:00', 'Pendente', 'SP', 'Sorocaba', 'Vila Haro', 'Rua Haro', '3200', 'SP', 'Jundiaí', 'Centro', 'Rua do Comércio', 140.00),
(33, '2024-12-22', '10:00:00', 'Pendente', 'SP', 'Tatuí', 'Jardim São Luís', 'Rua São Luís', '3300', 'SP', 'São Bernardo do Campo', 'Centro', 'Rua do Comércio', 150.00),
(34, '2024-12-23', '11:00:00', 'Pendente', 'SP', 'Itu', 'Jardim do Lago', 'Rua do Lago', '3400', 'SP', 'Diadema', 'Centro', 'Rua do Município', 140.00),
(35, '2024-12-24', '12:00:00', 'Pendente', 'SP', 'Ibiúna', 'Jardim do Vale', 'Rua do Vale', '3500', 'SP', 'Guarulhos', 'Centro', 'Rua do Comércio', 160.00),
(36, '2024-12-25', '13:00:00', 'Pendente', 'SP', 'Sorocaba', 'Jardim América', 'Rua América', '3600', 'SP', 'Campinas', 'Cambuí', 'Rua das Flores', 120.00),
(37, '2024-12-26', '14:00:00', 'Pendente', 'SP', 'Piedade', 'Jardim das Acácias', 'Rua das Acácias', '3700', 'SP', 'São José dos Campos', 'Centro', 'Rua do Município', 170.00),
(38, '2024-12-27', '15:00:00', 'Pendente', 'SP', 'Tatuí', 'Centro', 'Rua do Município', '3800', 'SP', 'Itapetininga', 'Centro', 'Rua XV de Novembro', 100.00),
(39, '2024-12-28', '16:00:00', 'Pendente', 'SP', 'Ibiúna', 'Jardim das Flores', 'Rua das Flores', '3900', 'SP', 'São Roque', 'Centro', 'Rua do Comércio', 110.00),
(40, '2024-12-29', '17:00:00', 'Pendente', 'SP', 'Sorocaba', 'Vila Industrial', 'Rua Industrial', '4000', 'SP', 'Jundiaí', 'Centro', 'Rua do Comércio', 140.00),
(41, '2024-12-10', '08:00:00', 'Pendente', 'SP', 'Sorocaba', 'Jardim Nova Sorocaba', 'Rua Nova Sorocaba', '4100', 'SP', 'Guarulhos', 'Centro', 'Rua do Comércio', 160.00),
(42, '2024-12-11', '09:00:00', 'Pendente', 'SP', 'Tatuí', 'Jardim São Luís', 'Rua São Luís', '4200', 'SP', 'São José dos Campos', 'Centro', 'Rua do Município', 170.00),
(43, '2024-12-31', '08:00:00', 'Pendente', 'SP', 'Tatuí', 'Jardim São Luís', 'Rua São Luís', '4300', 'SP', 'São Bernardo do Campo', 'Centro', 'Rua do Comércio', 150.00),
(44, '2025-01-01', '09:00:00', 'Pendente', 'SP', 'Itu', 'Jardim do Lago', 'Rua do Lago', '4400', 'SP', 'Diadema', 'Centro', 'Rua do Município', 140.00),
(45, '2025-01-02', '10:00:00', 'Pendente', 'SP', 'Ibiúna', 'Jardim do Vale', 'Rua do Vale', '4500', 'SP', 'Guarulhos', 'Centro', 'Rua do Comércio', 160.00),
(46, '2025-01-03', '11:00:00', 'Pendente', 'SP', 'Piedade', 'Jardim das Acácias', 'Rua das Acácias', '4600', 'SP', 'São José dos Campos', 'Centro', 'Rua do Município', 170.00),
(47, '2025-01-04', '12:00:00', 'Pendente', 'SP', 'Sorocaba', 'Jardim América', 'Rua América', '4700', 'SP', 'Campinas', 'Cambuí', 'Rua das Flores', 120.00),
(48, '2025-01-05', '13:00:00', 'Pendente', 'SP', 'Tatuí', 'Centro', 'Rua do Município', '4800', 'SP', 'Itapetininga', 'Centro', 'Rua XV de Novembro', 100.00),
(49, '2025-01-06', '14:00:00', 'Pendente', 'SP', 'Ibiúna', 'Jardim das Flores', 'Rua das Flores', '4900', 'SP', 'São Roque', 'Centro', 'Rua do Comércio', 110.00);

select * from tb_viagem
INSERT INTO tb_viagem (id_motorista, id_agendamento, data_inicio, hora_inicio, data_fim, hora_fim)
VALUES
(1, 1, '2024-11-20', '08:00:00', '2024-11-20', '14:00:00'),
(2, 2, '2024-11-21', '09:00:00', '2024-11-21', '15:00:00'),
(3, 3, '2024-11-22', '10:00:00', '2024-11-22', '16:00:00'),
(4, 4, '2024-11-23', '11:00:00', '2024-11-23', '17:00:00'),
(5, 5, '2024-11-24', '12:00:00', '2024-11-24', '18:00:00'),
(6, 6, '2024-11-25', '13:00:00', '2024-11-25', '19:00:00'),
(7, 7, '2024-11-26', '14:00:00', '2024-11-26', '20:00:00'),
(8, 8, '2024-11-27', '15:00:00', '2024-11-27', '21:00:00'),
(9, 9, '2024-11-28', '16:00:00', '2024-11-28', '22:00:00'),
(10, 10, '2024-11-29', '17:00:00', '2024-11-29', '23:00:00'),
(11, 11, '2024-11-30', '08:00:00', '2024-11-30', '14:00:00'),
(12, 12, '2024-12-01', '09:00:00', '2024-12-01', '15:00:00'),
(13, 13, '2024-12-02', '10:00:00', '2024-12-02', '16:00:00'),
(14, 14, '2024-12-03', '11:00:00', '2024-12-03', '17:00:00'),
(15, 15, '2024-12-04', '12:00:00', '2024-12-04', '18:00:00'),
(16, 16, '2024-12-05', '13:00:00', '2024-12-05', '19:00:00'),
(17, 17, '2024-12-06', '14:00:00', '2024-12-06', '20:00:00'),
(18, 18, '2024-12-07', '15:00:00', '2024-12-07', '21:00:00'),
(19, 19, '2024-12-08', '16:00:00', '2024-12-08', '22:00:00'),
(20, 20, '2024-12-09', '17:00:00', '2024-12-09', '23:00:00'),
(21, 21, '2024-12-10', '08:00:00', '2024-12-10', '14:00:00'),
(22, 22, '2024-12-11', '09:00:00', '2024-12-11', '15:00:00'),
(23, 23, '2024-12-12', '10:00:00', '2024-12-12', '16:00:00'),
(24, 24, '2024-12-13', '11:00:00', '2024-12-13', '17:00:00'),
(25, 25, '2024-12-14', '12:00:00', '2024-12-14', '18:00:00'),
(26, 26, '2024-12-15', '13:00:00', '2024-12-15', '19:00:00'),
(27, 27, '2024-12-16', '14:00:00', '2024-12-16', '20:00:00'),
(28, 28, '2024-12-17', '15:00:00', '2024-12-17', '21:00:00'),
(29, 29, '2024-12-18', '16:00:00', '2024-12-18', '22:00:00'),
(30, 30, '2024-12-19', '17:00:00', '2024-12-19', '23:00:00'),
(31, 31, '2024-12-20', '08:00:00', '2024-12-20', '14:00:00'),
(32, 32, '2024-12-21', '09:00:00', '2024-12-21', '15:00:00'),
(33, 33, '2024-12-22', '10:00:00', '2024-12-22', '16:00:00'),
(34, 34, '2024-12-23', '11:00:00', '2024-12-23', '17:00:00'),
(35, 35, '2024-12-24', '12:00:00', '2024-12-24', '18:00:00'),
(36, 36, '2024-12-25', '13:00:00', '2024-12-25', '19:00:00'),
(37, 37, '2024-12-26', '14:00:00', '2024-12-26', '20:00:00'),
(38, 38, '2024-12-27', '15:00:00', '2024-12-27', '21:00:00'),
(39, 39, '2024-12-28', '16:00:00', '2024-12-28', '22:00:00'),
(40, 40, '2024-12-29', '17:00:00', '2024-12-29', '23:00:00'),
(41, 41, '2024-12-30', '08:00:00', '2024-12-30', '14:00:00'),
(42, 42, '2024-12-31', '09:00:00', '2024-12-31', '15:00:00'),
(43, 43, '2025-01-01', '10:00:00', '2025-01-01', '16:00:00'),
(44, 44, '2025-01-02', '11:00:00', '2025-01-02', '17:00:00'),
(45, 45, '2025-01-03', '12:00:00', '2025-01-03', '18:00:00'),
(46, 46, '2025-01-04', '13:00:00', '2025-01-04', '19:00:00'),
(47, 47, '2025-01-05', '14:00:00', '2025-01-05', '20:00:00');

--2d. Criar índices para as colunas com muitas consultas.
CREATE INDEX idx_id_motorista ON tb_Veiculo (id_motorista);
CREATE INDEX idx_id_agendamento ON tb_Viagem (id_agendamento);
CREATE INDEX idx_id_usuario ON tb_Agendamento_Carona (id_usuario);

--3. Consultas: Criar consultas significativas para a aplicação. (1,8)
--a. Uma consulta usando junção de mais de 2 tabelas.

--Encontrar o nome do usuário, o modelo do veículo e o preço do agendamento para todas as viagens realizadas.

SELECT tb_Usuario.nome_usuario, tb_Veiculo.modelo_veiculo, tb_Agendamento_Carona.preco_agendamento
FROM tb_Usuario
INNER JOIN tb_Agendamento_Carona ON tb_Usuario.id_usuario = tb_Agendamento_Carona.id_usuario
INNER JOIN tb_Viagem ON tb_Agendamento_Carona.id_agendamento = tb_Viagem.id_agendamento
INNER JOIN tb_Veiculo ON tb_Viagem.id_motorista = tb_Veiculo.id_motorista;

--b. Uma consulta que seja útil para a lógica de negócios usando totalização e uma função de data.

--Calcular a receita total por mês, com o preço de todos os agendamentos realizados em cada um dos meses.
SELECT 
    strftime('%Y-%m', data_inicio) AS mes, 
    SUM(preco_agendamento) AS receita_total
FROM tb_Agendamento_Carona
GROUP BY mes;

--c. Uma consulta usando junção externa left join ou right join

--Encontrar todos os motoristas e a quantidade de viagens realizadas por cada um
--mesmo que um motorista não tenha realizado nenhuma viagem

SELECT tb_Motorista.nome_motorista, COUNT(tb_Viagem.id_viagem)
FROM tb_Motorista
LEFT JOIN tb_Viagem ON tb_Motorista.id_motorista = tb_Viagem.id_motorista
GROUP BY tb_Motorista.id_motorista;


--d. Uma consulta usando o operador de União.

--xxxxxxxxxxxxxxxxxx

--e. Uma consulta usando o operador Minus
--listar os nomes de usuários que não fizeram agendamentos de carona.
SELECT nome_usuario 
FROM tb_Usuario
EXCEPT --(no ORACLE usar MINUS)
SELECT nome_usuario 
FROM tb_Usuario
INNER JOIN tb_Agendamento_Carona ON tb_Usuario.id_usuario = tb_Agendamento_Carona.id_usuario;

--f. Uma consulta usando o operador de Interseção (Intersect)
--listar os nomes de motoristas que também são usuários e fizeram agendamentos de carona
SELECT tb_Usuario.nome_usuario FROM tb_Usuario
INNER JOIN tb_Agendamento_Carona ON tb_Usuario.id_usuario = tb_Agendamento_Carona.id_usuario
INTERSECT
SELECT nome_motorista FROM tb_Motorista;

