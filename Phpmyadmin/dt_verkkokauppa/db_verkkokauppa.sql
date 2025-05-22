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

INSERT INTO Tuotteet (nimi, hinta, kategoria_id, varastotilanne) VALUES 
('Älypuhelin', 599.99, 1, 50),
('Kannettava tietokone', 1299.99, 1, 20),
('T-paita', 19.99, 2, 150),
('Juoksukengät', 89.99, 4, 45),
('Romaani', 12.99, 3, 70),
('Keittiön veitsisetti', 39.99, 5, 30),
('Bluetooth-kuulokkeet', 79.99, 1, 75),
('Urheilutakki', 119.99, 2, 40);



-- Asiakkaiden lisääminen
INSERT INTO Asiakkaat (nimi, sähköposti, osoite, rekisteröitymis_pvm, saldo) VALUES 
('Matti Meikäläinen', 'matti@example.com', 'Helsinki, Suomi', '2024-01-15', ROUND(RAND() * 50000, 2)),
('Anna Virtanen', 'anna@example.com', 'Espoo, Suomi', '2023-11-23', ROUND(RAND() * 50000, 2)),
('Jari Korhonen', 'jari@example.com', 'Tampere, Suomi', '2025-04-10', ROUND(RAND() * 50000, 2)),
('Paula Laine', 'paula@example.com', 'Turku, Suomi', '2025-05-01', ROUND(RAND() * 50000, 2)),
('Sami Nieminen', 'sami@example.com', 'Jyväskylä, Suomi', '2023-09-30', ROUND(RAND() * 50000, 2)),
('Laura Hiltunen', 'laura@example.com', 'Oulu, Suomi', '2022-07-18', ROUND(RAND() * 50000, 2)),
('Tomi Salminen', 'tomi@example.com', 'Kuopio, Suomi', '2024-02-25', ROUND(RAND() * 50000, 2)),
('Riikka Mäkelä', 'riikka@example.com', 'Vaasa, Suomi', '2025-05-19', ROUND(RAND() * 50000, 2)),
('Eero Kallio', 'eero@example.com', 'Rovaniemi, Suomi', '2024-10-10', ROUND(RAND() * 50000, 2)),
('Veera Lehtinen', 'veera@example.com', 'Lappeenranta, Suomi', '2023-12-05', ROUND(RAND() * 50000, 2)),

-- 5 satunnaista englanninkielistä nimeä
('John Smith', 'john@example.com', 'New York, USA', '2024-03-22', ROUND(RAND() * 50000, 2)),
('Emily Johnson', 'emily@example.com', 'Los Angeles, USA', '2023-06-11', ROUND(RAND() * 50000, 2)),
('Michael Brown', 'michael@example.com', 'London, UK', '2025-02-05', ROUND(RAND() * 50000, 2)),
('Sarah Wilson', 'sarah@example.com', 'Toronto, Canada', '2024-12-09', ROUND(RAND() * 50000, 2)),
('David Martinez', 'david@example.com', 'Sydney, Australia', '2023-08-20', ROUND(RAND() * 50000, 2));



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
