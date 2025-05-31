
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
