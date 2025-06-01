
-- ==================================================================
-- ALKAEN TÄSTÄ W3SCHOOLS-HARJ2.SQL
-- MUUTAMIA HARJOITUKSIA W3SCHOOLS JA LISÄÄ EDITOITUNA

-- SQL HAVING Clause
-- 🔹 HAVING lisättiin SQL:ään, koska WHERE ei voi suodattaa aggregaattifunktioita kuten SUM(), AVG(), COUNT(), MAX() ja MIN(). 🔹 Se toimii yhdessä GROUP BY -lauseen kanssa, jotta voidaan suodattaa ryhmän tuloksia aggregaattifunktioiden perusteella.


-- Tämä näyttää vain ne asiakkaat, joilla on enemmän kuin yksi tilaus. Esim. yksi tai useammalla henkilöllä on pari-muutama tilausta laskettuna
SELECT asiakas_id, COUNT(*) AS tilauksien_maara
FROM Tilaukset
GROUP BY asiakas_id
HAVING tilauksien_maara > 1;


-- lisäsin JOIN yhdistämällä Tilauksen ja Asiakkaan taulukon, että esim. varmistettaan molempien taulukkojen asiakkaiden ja tilauksen id täsmentyvät - ihan kuin reallisessa maailmassa että menee oikeaan tilaan. HAVING-lauseketta voidaan käyttää, mikäli jos haluttaisiin ryhmiteltyjä tulosta aggregaattifunktiolla. Ja tässä suodataan tilausta, joka on yli 2 tilausta.
/*
✅ Mitä tämä tekee?

JOIN yhdistää asiakkaat ja tilaukset asiakas-ID:n perusteella.

COUNT(Tilaukset.id) laskee, montako tilausta kullakin asiakkaalla on.

GROUP BY ryhmittelee tulokset asiakas ID:n ja nimen mukaan.

HAVING tilauksien_maara > 2 suodattaa vain ne asiakkaat, joilla on yli 2 tilausta.


📌 Milloin HAVING kannattaa käyttää?
✔ Kun suodatetaan ryhmiteltyjä tuloksia, esimerkiksi yli 3 tilausta tehneet asiakkaat. ❌ WHERE ei toimi tässä, koska aggregaattifunktioita ei voi käyttää siinä suoraan.

*/
SELECT Asiakkaat.id, Asiakkaat.nimi, COUNT(Tilaukset.id) AS tilauksien_maara, Tilaukset.toimitus_status 
FROM Asiakkaat JOIN Tilaukset ON Asiakkaat.id = Tilaukset.asiakas_id 
GROUP BY Asiakkaat.id, Asiakkaat.nimi 
HAVING tilauksien_maara > 2; 



-- Laske, kuinka monta kappaletta kutakin tuotetta on tilattu (GROUP BY) ja halutaan nähdä tästä kuinka monta kpl:tta kutakin uotetta on tilattu. 
-- Ideana on ryhmittellä tuotenimen mukaan ja laskea kuinka monta kappaleta kutakin tuotetta on ostettu.
SELECT Tuotteet.nimi, SUM(Tilauksen_rivit.määrä) AS kokonaistilaukset 
FROM Tilauksen_rivit JOIN Tuotteet ON Tilauksen_rivit.tuote_id = Tuotteet.id 
GROUP BY Tuotteet.nimi; 


-- Suodata tuotteet, joiden tilaukset ylittävät tietyn määrän (HAVING)
-- tästä suodataan vain tuotteet, joita on tilattu yli esim. 5 kplta ja vain niitä tuotetta
SELECT Tuotteet.nimi, SUM(Tilauksen_rivit.määrä) AS kokonaistilaukset 
FROM Tilauksen_rivit JOIN Tuotteet ON Tilauksen_rivit.tuote_id = Tuotteet.id 
GROUP BY Tuotteet.nimi HAVING kokonaistilaukset > 5; 



-- Laske asiakkaan kokonaisostokset (JOIN Tilaukset + GROUP BY)
-- eli haluttaan nähdä asiakkaiden tilattua kokonais ostosta ja sitä summaa, kukin asiakas on käyttänyt rahaa/saldoa
SELECT Tilaukset.asiakas_id, SUM(Tilauksen_rivit.yhteishinta) AS asiakkaan_kulut 
FROM Tilauksen_rivit JOIN Tilaukset ON Tilauksen_rivit.tilaus_id = Tilaukset.id 
GROUP BY Tilaukset.asiakas_id; 


-- GROUP BY voidaan yhdistää WHERE, JOIN, INNER JOIN, ja HAVING COUNT erikseen.

-- esim. laskettaisiin varastontilannetta, että mukaan ja suodattaa vain tuotteet jotka maksavat esim. yli 50e, ja käytettään WHERE ennen GROUP BY
SELECT varastotilanne, COUNT(*) AS tuote_maara
FROM Tuotteet
WHERE hinta > 50
GROUP BY varastotilanne;


-- sama kuin ylempi, mutta ryhmitettynä mukaan ja tulostettuna nimet, suodatettaan jolla on alle 5k saldoa
SELECT Asiakkaat.nimi, Asiakkaat.saldo, COUNT(*) AS saldoMäärä 
FROM Asiakkaat WHERE Asiakkaat.saldo < 5000 
GROUP BY Asiakkaat.nimi; 


-- GROUP BY + INNER JOIN
-- jos halutaisiin laskea, kuinka monta tuotetta on tilattu per kategoria ja yhdistetään Tuotteet ja Tilauksen_rivit INNER JOIN:illa molempia taulukkoita.
SELECT Tuotteet.kategoria_id, COUNT(Tilauksen_rivit.tuote_id) AS tilattu_maara
FROM Tuotteet
INNER JOIN Tilauksen_rivit ON Tuotteet.id = Tilauksen_rivit.tuote_id
GROUP BY Tuotteet.kategoria_id;


-- GROUP BY + HAVING COUNT
-- haluttaan näyttää vain tuotteet, joita on tilattu enemmän kuin 2 kertaa, niin käytettään HAVING COUNT ja ideana on suodattaa pois tuotteet, joita on tilattu ja näyttää vain ne joita on tilattu enemmän
SELECT tuote_id, COUNT(*) AS tilattu_maara 
FROM Tilauksen_rivit 
GROUP BY tuote_id HAVING tilattu_maara > 2; 


-- GROUP BY + JOIN + HAVING COUNT
-- haluttaan näyttää asiakkaiden nimet, jotka ovat tehneet yli 5 tilausta (sen mukaan mitä määrittää) ja yhdistämällä Tilausket ja Asiakkaan taulukkoa, ja suodataan HAVING COUNT-lauseella.

SELECT Asiakkaat.nimi, COUNT(Tilaukset.id) AS tilausten_maara
FROM Asiakkaat
JOIN Tilaukset ON Asiakkaat.id = Tilaukset.asiakas_id
GROUP BY Asiakkaat.nimi
HAVING tilausten_maara > 5;



