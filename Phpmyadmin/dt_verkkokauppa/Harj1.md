# Muutamia ja pientä harjoitusta

## Tulosta kaksi tai useampi taulukko
```
-- kaksi tai useampi taulukkoa tulostettuna
SELECT * FROM Maksutavat, Tuotteet, Asiakkaat
```



## Lisätään sarakketta lisää taulukkon alle ja annettaan satunnainen luku
```
-- ALTER TABLE, jotta saldo-sarake lisätään ilman tietojen menetystä - eli lisätään taulukkon alle yksi rivi lisää
ALTER TABLE Asiakkaat
ADD COLUMN saldo DECIMAL(10,2) NOT NULL DEFAULT 0.00;

--lisätyn "Saldo" sarakkeen jälkeen niin päivitettään saldo satunnaisesti ja saldo voi olla esim. rahansakin
UPDATE Asiakkaat
SET saldo = ROUND(RAND() * 50000, 2);
```




## Lisätään henkilöitä taulukkon alle
```
-- lisätään 5 uutta henkilöä "Asiakkaan" taulukkoon - käytettään "INSERT INTO" - KOMENTOA

INSERT INTO Asiakkaat (nimi, sähköposti, osoite, rekisteröitymis_pvm, saldo) VALUES 
('William Taylor', 'william@example.com', 'Manchester, UK', '2025-05-22', ROUND(RAND() * 50000, 2)),
('Sophia Garcia', 'sophia@example.com', 'Madrid, Spain', '2023-07-15', ROUND(RAND() * 50000, 2)),
('James Anderson', 'james@example.com', 'Berlin, Germany', '2024-10-30', ROUND(RAND() * 50000, 2)),
('Olivia White', 'olivia@example.com', 'Paris, France', '2022-12-05', ROUND(RAND() * 50000, 2)),
('Daniel Lee', 'daniel@example.com', 'Tokyo, Japan', '2023-03-18', ROUND(RAND() * 50000, 2));
```
