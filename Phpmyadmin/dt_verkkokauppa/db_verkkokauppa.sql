-- Tämä sisältää: ja POHJA
-- ✔ Tietokannan luomisen ✔ Taulujen rakenteet ja rajoitteet ✔ Indeksit ja viiteavaimet ✔ Alustavat tiedot kategorioille, tuotteille, asiakkaille ja tilauksille ✔ Tilauksen rivit, jotka yhdistävät tuotteet ja tilaukset
-- tässä tietokannan nimi (database) on "Verkkokauppa" ja "Asiakkaat", "Kategoriat", "Maksutavat", "Tilauksen_rivit", "Tilaukset" ja "Tuotteet" ovat tauluja (tables)
CREATE DATABASE verkkokauppa;
USE verkkokauppa;

-- Kategoriat-taulu: sisältää tuotteiden eri kategoriat (esim. elektroniikka, vaatteet)
CREATE TABLE Kategoriat (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nimi VARCHAR(255) NOT NULL -- Kategorian nimi, esim. "Elektroniikka"
);

-- Tuotteet-taulu: sisältää tietoa myytävistä tuotteista
CREATE TABLE Tuotteet (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nimi VARCHAR(255) NOT NULL, -- Tuotteen nimi, esim. "Puhelin"
    hinta DECIMAL(10,2) NOT NULL, -- Tuotteen hinta euroina (esim. 599.99)
    kategoria_id INT, -- Viittaus tuotteen kategoriaan
    varastotilanne INT, -- Kuinka monta kappaletta tuotetta on varastossa
    INDEX (nimi), -- Nopeuttaa hakemista tuotteen nimellä
    INDEX (kategoria_id), -- Nopeuttaa hakemista kategorian mukaan
    FOREIGN KEY (kategoria_id) REFERENCES Kategoriat(id) -- Viittaa Kategoriat-tauluun
);

-- Asiakkaat-taulu: sisältää rekisteröityneet verkkokaupan asiakkaat
CREATE TABLE Asiakkaat (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nimi VARCHAR(255) NOT NULL, -- Asiakkaan nimi, esim. "Matti Meikäläinen"
    sähköposti VARCHAR(255) NOT NULL UNIQUE, -- Uniikki sähköpostiosoite
    osoite TEXT, -- Asiakkaan osoite
    rekisteröitymis_pvm DATE, -- Päivämäärä, jolloin asiakas rekisteröityi
    saldo DECIMAL(10,2) NOT NULL DEFAULT 0.00 -- Asiakkaan tilillä oleva saldo, oletusarvo 0.00
);


-- Maksutavat-taulu: sisältää eri maksuvaihtoehdot
CREATE TABLE Maksutavat (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tapa VARCHAR(255) NOT NULL, -- Maksutapa, esim. "Kortti"
    kuvaus TEXT -- Lisätiedot maksutavasta, esim. "Luotto- tai pankkikortti"
);

-- Tilaukset-taulu: sisältää asiakkaiden tekemät tilaukset
CREATE TABLE Tilaukset (
    id INT AUTO_INCREMENT PRIMARY KEY,
    asiakas_id INT NOT NULL, -- Viittaus asiakkaaseen, joka tilauksen teki
    tilaus_pvm DATE NOT NULL, -- Päivämäärä, jolloin tilaus tehtiin
    toimitus_status ENUM('käsittelyssä', 'lähetetty', 'toimitettu') NOT NULL, -- Tilauksen tila
    maksutapa_id INT NOT NULL, -- Viittaus maksutapaan
    INDEX (asiakas_id), -- Nopeuttaa hakemista asiakkaan tilauksille
    INDEX (maksutapa_id), -- Nopeuttaa hakemista maksutavan mukaan
    FOREIGN KEY (asiakas_id) REFERENCES Asiakkaat(id), -- Viittaa Asiakkaat-tauluun
    FOREIGN KEY (maksutapa_id) REFERENCES Maksutavat(id) -- Viittaa Maksutavat-tauluun
);

-- Tilauksen_rivit-taulu: sisältää yksittäisten tilausten tuotteet
CREATE TABLE Tilauksen_rivit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tilaus_id INT NOT NULL, -- Viittaus tilaukseen
    tuote_id INT NOT NULL, -- Viittaus tilattuun tuotteeseen
    määrä INT NOT NULL, -- Kuinka monta kappaletta tuotetta tilattiin
    yhteishinta DECIMAL(10,2) NOT NULL, -- Kokonaishinta (määrä * tuotteen hinta)
    INDEX (tilaus_id), -- Nopeuttaa hakemista tilauksen mukaan
    INDEX (tuote_id), -- Nopeuttaa hakemista tuotteen mukaan
    FOREIGN KEY (tilaus_id) REFERENCES Tilaukset(id), -- Viittaa Tilaukset-tauluun
    FOREIGN KEY (tuote_id) REFERENCES Tuotteet(id) -- Viittaa Tuotteet-tauluun
);



-- Kategorioiden lisääminen

INSERT INTO Kategoriat (nimi) VALUES 
('Elektroniikka'),
('Vaatteet'),
('Kirjat'),
('Urheilu'),
('Kodin tarvikkeet');

-- Tuotteiden lisääminen
INSERT INTO `Tuotteet` (`id`, `nimi`, `hinta`, `kategoria_id`, `varastotilanne`) VALUES
(1, 'Älypuhelin', 599.99, 1, 50),
(2, 'Kannettava tietokone', 1299.99, 1, 20),
(3, 'T-paita', 19.99, 2, 150),
(4, 'Juoksukengät', 89.99, 4, 45),
(5, 'Romaani', 12.99, 3, 70),
(6, 'Keittiön veitsisetti', 39.99, 5, 30),
(7, 'Bluetooth-kuulokkeet', 79.99, 1, 75),
(8, 'Urheilutakki', 119.99, 2, 40),
(9, 'Pelihiiri', 49.99, 1, 60),
(10, 'Tabletti', 399.99, 1, 35),
(11, 'Farkut', 59.99, 2, 0),
(12, 'Juomapullo', 14.99, 4, 120),
(13, 'Novellikokoelma', 17.99, 3, 45),
(14, 'Grillipannu', 89.99, 5, 25),
(15, 'Langaton kaiutin', 129.99, 1, 50),
(16, 'Sadetakki', 79.99, 2, 55),
(17, 'Salikengät', 99.99, 4, 40),
(18, 'Kasviskokkikirja', 22.99, 3, 30),
(19, 'Älykello', NULL, 1, 45),
(20, 'Työtuoli', 249.99, NULL, 30),
(21, 'Sähköpyörä', NULL, 4, NULL),
(22, 'Käsipainosetti', 79.99, 4, 20),
(23, 'Led-lamppu', 9.99, NULL, 50),
(24, 'Kirjahylly', 189.99, 5, 12),
(25, 'Ulkoilu-reppu', NULL, 2, 25),
(26, 'Lautapeli', 39.99, NULL, NULL),
(27, 'Mikroaaltouuni', 10.99, NULL, 10),
(28, 'Lämpöpaita', 29.99, NULL, 3);




-- Asiakkaiden lisääminen
INSERT INTO `Asiakkaat` (`id`, `nimi`, `sähköposti`, `osoite`, `rekisteröitymis_pvm`, `saldo`) VALUES
(1, 'Matti Meikäläinen', 'matti@example.com', 'Suomi', '1965-06-05', 6760.87),
(2, 'Anna Virtanen', 'anna@example.com', 'Suomi', '1964-07-31', 29689.94),
(3, 'Jari Korhonen', 'jari@example.com', 'Suomi', '1975-08-18', 28167.12),
(4, 'Paula Laine', 'paula@example.com', 'Suomi', '1973-05-26', 1765.79),
(5, 'Sami Nieminen', 'sami@example.com', 'Suomi', '1989-02-08', 24327.57),
(6, 'Laura Hiltunen', 'laura@example.com', 'Suomi', '1954-05-05', 16340.49),
(7, 'Tomi Salminen', 'tomi@example.com', 'Suomi', '1973-05-21', 8719.74),
(8, 'Riikka Mäkelä', 'riikka@example.com', 'Suomi', '1992-11-25', 44577.25),
(9, 'Eero Kallio', 'eero@example.com', 'Suomi', '1973-05-07', 46727.02),
(10, 'Veera Lehtinen', 'veera@example.com', 'Suomi', '1997-01-12', 49903.36),
(11, 'William Taylor', 'william@example.com', 'UK', '1994-02-13', 7204.28),
(12, 'Sophia Garcia', 'sophia@example.com', 'Spain', '1968-07-03', 44371.53),
(13, 'James Anderson', 'james@example.com', 'Germany', '1969-02-27', 244.82),
(14, 'Olivia White', 'olivia@example.com', 'France', '1989-04-13', 18109.52),
(15, 'Daniel Lee', 'daniel@example.com', 'Japan', '1967-12-08', 39813.12),
(16, 'Nathan Reed', 'nathan@example.com', 'USA', '2008-11-25', 31193.00),
(17, 'Isabella Evans', 'isabella@example.com', 'New Zealand', '2022-03-28', 42631.48),
(18, 'Ethan Hall', 'ethan@example.com', 'Canada', '2004-06-21', 29261.16),
(19, 'Lily Adams', 'lily@example.com', 'Germany', '2014-07-25', 22278.64),
(20, 'Jackson Murphy', 'jackson@example.com', 'Australia', '2002-06-07', 9943.83),
(21, 'Olivia Mäkinen', 'olivia2@example.com', 'Suomi', '1999-04-15', 3456.67),
(22, 'Leon Shawn', 'leon@example.com', 'UK', '1998-05-13', 44132.84),
(23, 'Gilbert Tate', 'gilbert@example.com', 'Australia', '1996-03-04', 23634.87),
(105, 'Haruto Takahashi', 'haruto@example.com', 'Japan', '1992-07-15', 31267.45),
(106, 'Yuki Nakamura', 'yuki@example.com', 'Japan', '1985-03-22', 27560.88),
(107, 'Satoshi Yamamoto', 'satoshi@example.com', 'Japan', '1978-09-08', 18277.51),
(108, 'Jessica Carter', 'jessica@example.com', 'USA', '1990-06-14', 42387.92),
(109, 'Brandon Mitchell', 'brandon@example.com', 'USA', '1988-11-02', 19872.65),
(110, 'Rachel Cooper', 'rachel@example.com', 'USA', '1995-04-30', 36258.41),
(111, 'Oliver Bennett', 'oliver@example.com', 'New Zealand', '1993-02-19', 28735.67),
(112, 'Charlotte King', 'charlotte@example.com', 'New Zealand', '1986-08-25', 18623.40),
(113, 'Liam Scott', 'liam@example.com', 'New Zealand', '2001-12-03', 42205.19),
(114, 'Maximilian Hoffmann', 'maximilian@example.com', 'Germany', '1982-09-16', 14872.56),
(115, 'Hannah Schulz', 'hannah@example.com', 'Germany', '1996-07-07', 39981.32),
(116, 'Elias Wagner', 'elias@example.com', 'Germany', '1974-05-11', 25462.47),
(117, 'Noah Thompson', 'noah@example.com', 'Australia', '1995-09-21', 31720.89),
(118, 'Ava Robinson', 'ava@example.com', 'Australia', '1989-06-10', 18349.29),
(119, 'Daniel Harris', 'daniel2@example.com', 'UK', '1992-02-15', 22731.56),
(120, 'Grace Edwards', 'grace@example.com', 'UK', '2000-07-05', 31982.74),
(121, 'Alejandro Lopez', 'alejandro@example.com', 'Spain', '1984-11-30', 29381.44),
(122, 'Carla Torres', 'carla@example.com', 'Spain', '1997-04-18', 35829.17),
(123, 'Lucas Dupont', 'lucas@example.com', 'Belgium', '1986-03-22', 19282.50),
(124, 'Elise Verhoeven', 'elise@example.com', 'Belgium', '1991-08-14', 38916.38),
(125, 'Nathan Dewaele', 'nathan2@example.com', 'Belgium', '2005-12-09', 26382.71),
(126, 'Matti', '%example.com', 'UK', NULL, 18000.00),
(128, 'Nicole Colombi', 'nicole@example.com', 'Italy', NULL, 9999.12);

-- Maksutapojen lisääminen
INSERT INTO Maksutavat (tapa, kuvaus) VALUES 
('Kortti', 'Luotto- tai pankkikortti'),
('PayPal', 'Online-maksu'),
('Tilisiirto', 'Suora pankkisiirto');


-- Tilauksien lisääminen (vanhoja & uusia)

INSERT INTO Tilaukset (asiakas_id, tilaus_pvm, toimitus_status, maksutapa_id) VALUES 
(1, '2023-12-15', 'toimitettu', 1), -- Vanha tilaus
(2, '2025-05-10', 'lähetetty', 2), -- Uusi tilaus
(3, '2025-05-20', 'käsittelyssä', 3), -- Uusi tilaus
(4, '2024-08-25', 'toimitettu', 1), -- Vanha tilaus
(5, '2025-04-01', 'toimitettu', 2), -- Uusi tilaus
(6, '2023-07-30', 'lähetetty', 3), -- Vanha tilaus
(7, '2024-09-14', 'käsittelyssä', 1), -- Uusi tilaus
(8, '2025-05-21', 'lähetetty', 2), -- Uusi tilaus
(9, '2023-11-18', 'toimitettu', 3), -- Vanha tilaus
(10, '2024-06-05', 'käsittelyssä', 1); -- Uusi tilaus



-- Tilauksen tuotteiden lisääminen
INSERT INTO Tilauksen_rivit (tilaus_id, tuote_id, määrä, yhteishinta) VALUES 
(1, 1, 1, 599.99), -- Matti osti puhelimen
(1, 5, 2, 25.98), -- Matti osti kaksi kirjaa
(2, 2, 1, 1299.99), -- Anna osti kannettavan tietokoneen
(3, 4, 1, 89.99), -- Jari osti juoksukengät
(3, 8, 1, 119.99), -- Jari osti urheilutakin
(4, 7, 1, 79.99), -- Paula osti Bluetooth-kuulokkeet
(5, 3, 3, 59.97), -- Sami osti kolme T-paitaa
(6, 6, 1, 39.99), -- Laura osti veitsisetin keittiöön
(7, 1, 1, 599.99), -- Tomi osti puhelimen
(8, 7, 2, 159.98); -- Riikka osti kaksi kuuloketta
