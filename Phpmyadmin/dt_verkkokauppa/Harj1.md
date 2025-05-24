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

![alt text](./Harj1/1.png)

![alt text](./Harj1/2.png)

![alt text](./Harj1/3.png)

![alt text](./Harj1/4.png)

![alt text](./Harj1/5.png)

---

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

![alt text](./Harj1/6.png)

![alt text](./Harj1/7.png)

```
-- 5 henkilöä lisää ja rekisteröiymis pv n. 2000 - 2025 väliltä
INSERT INTO Asiakkaat (nimi, sähköposti, osoite, rekisteröitymis_pvm, saldo) VALUES 
('Nathan Reed', 'nathan@example.com', 'Dallas, USA', DATE_SUB('2025-12-31', INTERVAL FLOOR(RAND() * 9490) DAY), ROUND(RAND() * 50000, 2)),
('Isabella Evans', 'isabella@example.com', 'Auckland, New Zealand', DATE_SUB('2025-12-31', INTERVAL FLOOR(RAND() * 9490) DAY), ROUND(RAND() * 50000, 2)),
('Ethan Hall', 'ethan@example.com', 'Toronto, Canada', DATE_SUB('2025-12-31', INTERVAL FLOOR(RAND() * 9490) DAY), ROUND(RAND() * 50000, 2)),
('Lily Adams', 'lily@example.com', 'Berlin, Germany', DATE_SUB('2025-12-31', INTERVAL FLOOR(RAND() * 9490) DAY), ROUND(RAND() * 50000, 2)),
('Jackson Murphy', 'jackson@example.com', 'Sydney, Australia', DATE_SUB('2025-12-31', INTERVAL FLOOR(RAND() * 9490) DAY), ROUND(RAND() * 50000, 2));
```


```
-- yksittäisen käyttäjän lisääminen ilman satunnaista lukua, et syöttää saldon itse
INSERT INTO Asiakkaat (nimi, sähköposti, osoite, rekisteröitymis_pvm, saldo) VALUES 
('Harry Shadows', 'harry@example.com', 'Newcastle, UK', '2005-07-13', 9999.00);
```


```
-- päivitystä rekisteröitymis_pvm _ satunnaisesti n. 1950 - 2010
-- aloituspiste on 2010-12-31 josta päivämääriä vähennettään randomisti 21915 päivää - vastaa n. 60 vuotta.
UPDATE Asiakkaat
SET rekisteröitymis_pvm = DATE_SUB('2010-12-31', INTERVAL FLOOR(RAND() * 21915) DAY);
```

```
-- saldoa n. alle 5 000
SELECT * FROM Asiakkaat WHERE floor(saldo) < 5000; 
```

---

# JOIN + WHERE

Näytä kaikki tilaukset, joissa asiakas on "Jari Korhonen", ja listaa tilauspäivämäärä ja tilauksen tila.
Tarvittaan `JOIN Asiakkaat` + `Tilaukset`

![alt text](./Harj1/8.png)

![alt text](./Harj1/9.png)

Pientä teoriaa, tietokannassa siis taulukkossa on "Tilaukset" , "Asiakkaat" erissä tiedoissa. 
- "Tilaukset" voi sisältyä eri tietoja kuten `tilaus_pvm` ja `toimitus_status`
- "Asiakkaat" sisältyy asiakkastietoja just mm. nimi, asiakas_id , jne.

Tässä (vastauksessa) on toistettu kaksi taulukkoa, kun haettaan/tarvitaan tiettyä "JOIN" jotta tiedot liittyvät toisiinsa
JOIN vähä kuin viittaa taulukko Asiakkaaseen, tämä ON tarkoittaa ehtoa vähä kuin A yhtä kuin B.
sitten WHERE haettaan Jari Korhonen nimeä. 

Sama pätee jos haluttaisiin useampi nimi sitten tulee sulkuun ja heittomerkit ketä me haluataan viitata ja sama pätee että halutaan nimettyä henkilöitä
WHERE Asiakkaat.nimi IN ('Jori Korhonen', 'Anna Virtanen', 'Matti Meikäläinen');


---

# JOIN + GROUP BY + SUM

Näytä kunkin asiakkaan nimi ja kuinka paljon he ovat käyttäneet rahaa yhteensä tilauksiinsa.

Tarvittaan JOINia vähintään 3 taulusta:
Asiakkaat → Tilaukset → Tilauksen_rivit

```
SELECT Asiakkaat.nimi, SUM(Tilauksen_rivit.hinta * Tilauksen_rivit.maara) AS kokonaiskulut
FROM Asiakkaat
JOIN Tilaukset ON Asiakkaat.id = Tilaukset.asiakas_id
JOIN Tilauksen_rivit ON Tilaukset.id = Tilauksen_rivit.tilaus_id
GROUP BY Asiakkaat.nimi;
```

![alt text](./Harj1/10.png)


Mini teoria;
Lasketaan SUM(hinta * määrä), eli jokaisen asiakkaan kaikki tilausten rivit yhteenlaskettu summa.

JOIN:
Asiakkaat JOIN Tilaukset yhdistää asiakkaan ja hänen tilauksensa käyttämällä asiakas_id.
Tilaukset JOIN Tilauksen_rivit yhdistää tilaukset ja niiden yksittäiset rivit tilaus_id-sarakkeen kautta.


GROUP BY:
Ryhmittelee tulokset asiakkaan nimen perusteella, jotta jokainen asiakas saa oman rivinsä tuloksessa.







