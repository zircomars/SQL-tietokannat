--=================================================
-- SQL Joins

/*
JOIN-lauseke SQL:ssä yhdistää rivejä kahdesta tai useammasta taulusta yhteisen sarakkeen perusteella. Tämä mahdollistaa tiedon hakemisen useista tauluista yhdellä kyselyllä.



INNER JOIN	Palauttaa vain ne rivit, joilla on vastaava osuma molemmissa tauluissa.	✅ Vain vastaavat rivit

LEFT JOIN (LEFT OUTER JOIN)	Palauttaa kaikki vasemman taulun rivit ja vain vastaavat rivit oikeasta taulusta.	✅ Vasemman taulun kaikki rivit

RIGHT JOIN (RIGHT OUTER JOIN)	Palauttaa kaikki oikean taulun rivit ja vain vastaavat rivit vasemmasta taulusta.	✅ Oikean taulun kaikki rivit

LEFT and RIGHT JOIN taulukko, kun määrittää LEFT JOIN tai RIGHT JOIN, taulujen järjestys vaikuttaa siihen, kumpi on "vasen" ja kumpi "oikea".

- Vasemman taulun rivit säilyvät, vaikka ei olisi osumaa oikeassa taulussa (LEFT JOIN).
- Oikean taulun rivit säilyvät, vaikka ei olisi osumaa vasemmassa taulussa (RIGHT JOIN).

SELECT-lauseessa määritetään, mitä tietoja halutaan hakea, mutta itse JOIN-lauseen rakenne määrää, mikä taulu on "vasen" ja mikä "oikea".


FULL JOIN (FULL OUTER JOIN)	Palauttaa kaikki rivit molemmista tauluista, yhdistäen vastaavat tiedot.	✅ Molempien taulujen kaikki rivit

CROSS JOIN	Luo kaikkien rivien yhdistelmän molemmista tauluista (kartesiainen tulo).	✅ Kaikki mahdolliset yhdistelmät

===========================================================================
PIENI PELI/MUISTISÄÄNTÖ KOSKIEN JOIN KYSELLYYNSÄ: 

- INNER JOIN - vain yhteiset rivit, ja vain ne rivit, jotka löytyvät molemmista tauluista
- LEFT JOIN - kaikki vasemman taulun rivit + yhteiset, vaikka oikea taulussa vastaavaa tietoa ei olisi (NULL)
- RIGHT JOIN - kaikki oikea taulun rivit + yhteiset, vaikka oikean taulun rivit, vaikka vasemman taulun vastaavaa tietoa ei olisi (NULL)
- FULL JOIN - kaikki rivit molemmista tauluista , kaikki rivit molemmista tauluista, vaikka vastaavaa tietoa ei olisi toisessa taulussa ja NULL arvoja sallittaan
===========================================================================

LEFT JOIN vs. RIGHT JOIN - jotakin huomoittavaa SQL komennossa.

LEFT JOIN – Kaikki vasemman taulun rivit säilytetään
Palauttaa kaikki rivit vasemmasta taulusta, vaikka oikean taulun vastaavia tietoja ei olisi.

Jos oikeasta taulusta ei löydy vastaavia tietoja, NULL-arvo ilmestyy.

Hyöty: Käytetään silloin, kun halutaan säilyttää vasemman taulun rivit, vaikka oikeasta taulusta ei olisi vastaavuutta.



RIGHT JOIN – Kaikki oikean taulun rivit säilytetään
Palauttaa kaikki rivit oikeasta taulusta, vaikka vasemman taulun vastaavia tietoja ei olisi.

Jos vasemmasta taulusta ei löydy vastaavia tietoja, NULL-arvo ilmestyy.

Hyöty: Käytetään silloin, kun halutaan säilyttää oikean taulun rivit, vaikka vasemmasta taulusta ei löytyisi vastaavuutta.




ELI KUMPPAA VALITAAN/MITEN VALITA OIKEA JOIN?

Käytä LEFT JOIN, jos haluat säilyttää kaikki vasemman taulun rivit, mutta sallit oikean taulun NULL-arvot.

Käytä RIGHT JOIN, jos haluat säilyttää kaikki oikean taulun rivit, mutta sallit vasemman taulun NULL-arvot.

Jos et ole varma, kumpi on järkevämpi, mieti kumpi taulu on tärkeämpi säilyttää kokonaan!




===========================================================================
*/

-- JOIN
-- esim. haettaan Tilauksen taulukkon mukaan id, Asiakkaan nimi, ja Tilauksen toimitus status, mistä taulukkosta (Tilaukset) sitten JOIN mukaan Asiakkaan taulukko sitten ON yhdistettään kahden taulukkojen kategoriat yhteen.
-- ON - ehto yhdistää taulujen niiden vastaavat ID-arvojen perusteella
SELECT Tilaukset.id, Asiakkaat.nimi, Tilaukset.toimitus_status 
FROM Tilaukset JOIN Asiakkaat ON Tilaukset.asiakas_id = Asiakkaat.id; 


-- INNER JOIN
-- tässä haettaan Asiakkaan taulukon alta id ja nimi ja Tilauksen taulukkon alta id ja toimitus status, että mistä Tilauksien alta, sitten palautetaan ne rivit johon vastaa molempien osumia tauluja siksi nimesin INNER JOIN Asiakkaat ja on Tilauksien id <==> Asiakkaan id
SELECT Asiakkaat.id, Asiakkaat.nimi , Tilaukset.id, Tilaukset.toimitus_status 
FROM Tilaukset INNER JOIN Asiakkaat ON Tilaukset.id = Asiakkaat.id; 

-- vähä tarkennusta INNER JOIN 
-- INNER JOIN on SQL-käsky, joka yhdistää kaksi taulukkoa ja valitsee vain ne rivit, joissa yhteiset arvot täsmäävät molemmissa tauluissa. Tämä tarkoittaa, että jos tietoa ei ole molemmissa tauluissa, sitä ei sisällytetä tuloksiin.
SELECT Tilaukset.id, Asiakkaat.nimi, Tilaukset.toimitus_status
FROM Tilaukset
INNER JOIN Asiakkaat ON Tilaukset.asiakas_id = Asiakkaat.id;


-- itse vähä rakennettu, mutta methodi 
SELECT Asiakkaat.id, Asiakkaat.nimi, Tilaukset.toimitus_status, Tilaukset.tilaus_pvm
FROM Tilaukset
INNER JOIN Asiakkaat ON Tilaukset.asiakas_id = Asiakkaat.id;


-- JOIN or INNER JOIN
-- Käytännössä JOIN ja INNER JOIN toimivat identtisesti

SELECT Tilaukset.id, Asiakkaat.nimi
FROM Tilaukset
JOIN Asiakkaat ON Tilaukset.asiakas_id = Asiakkaat.id;


SELECT Tilaukset.id, Asiakkaat.nimi
FROM Tilaukset
INNER JOIN Asiakkaat ON Tilaukset.asiakas_id = Asiakkaat.id;



-- JOIN Three tables
-- eli kolme taulukkoa, ja jos tulee neljäs sitten tulee kolmas INNER JOIN lausekke
SELECT Asiakkaat.nimi AS AsiakasNimi, Tilaukset.id AS TilausID, 
       Tilaukset.toimitus_status AS TilausStatus, Maksutavat.tapa AS Maksutapa
FROM Tilaukset
INNER JOIN Asiakkaat ON Tilaukset.asiakas_id = Asiakkaat.id
INNER JOIN Maksutavat ON Tilaukset.maksutapa_id = Maksutavat.id;


SELECT Asiakkaat.nimi AS AsiakasNimi, Tilaukset.id AS TilausID, 
       Tilaukset.toimitus_status AS TilausStatus, Tuotteet.nimi AS TuoteNimi, 
       Tilauksen_rivit.määrä AS Määrä, Tilauksen_rivit.yhteishinta AS Yhteishinta
FROM Tilaukset
INNER JOIN Asiakkaat ON Tilaukset.asiakas_id = Asiakkaat.id
INNER JOIN Tilauksen_rivit ON Tilaukset.id = Tilauksen_rivit.tilaus_id
INNER JOIN Tuotteet ON Tilauksen_rivit.tuote_id = Tuotteet.id;





-- LEFT JOIN - josta näytä kaikki asiakkaat, vaikka heillä ei ole olisi tilausta ja tämä näyttää kaikki asiakkaat, mutta tilaukset näkyvät vain jos ne ovat olemassa. Tuloksena ainakin näytti mukaan lukien on NULL arvoja
SELECT Asiakkaat.nimi, Asiakkaat.id, Tilaukset.id, Tilaukset.toimitus_status
FROM Asiakkaat
LEFT JOIN Tilaukset ON Asiakkaat.id = Tilaukset.asiakas_id;

/*

 nimi 	id 	toimitus_status 	id 	
Matti Meikäläinen 	1 	toimitettu 	1
Anna Virtanen 	2 	lähetetty 	2
Jari Korhonen 	3 	käsittelyssä 	3
Paula Laine 	4 	toimitettu 	4
Sami Nieminen 	5 	toimitettu 	5
Laura Hiltunen 	6 	lähetetty 	6
Tomi Salminen 	7 	käsittelyssä 	7
Riikka Mäkelä 	8 	lähetetty 	8
Eero Kallio 	9 	toimitettu 	9
Veera Lehtinen 	10 	käsittelyssä 	10
William Taylor 	101 	Toimitettu 	11
Sophia Garcia 	102 	Kadonnut 	12
James Anderson 	NULL 	NULL 	13
Olivia White 	NULL 	NULL 	14
Daniel Lee 	103 	Toimitettu 	15

*/



--RIGHT JOIN – Näytä kaikki tilaukset, vaikka asiakastiedot puuttuisivat. Tämä palauttaa kaikki tilaukset, mutta asiakastiedot voivat olla NULL, jos asiakas on poistettu.
SELECT Tilaukset.id, Asiakkaat.nimi, Tilaukset.toimitus_status
FROM Tilaukset
RIGHT JOIN Asiakkaat ON Tilaukset.asiakas_id = Asiakkaat.id;

/*
 id 	nimi 	toimitus_status 	
1 	Matti Meikäläinen 	toimitettu
2 	Anna Virtanen 	lähetetty
3 	Jari Korhonen 	käsittelyssä
4 	Paula Laine 	toimitettu
5 	Sami Nieminen 	toimitettu
6 	Laura Hiltunen 	lähetetty
7 	Tomi Salminen 	käsittelyssä
8 	Riikka Mäkelä 	lähetetty
9 	Eero Kallio 	toimitettu
10 	Veera Lehtinen 	käsittelyssä
101 	William Taylor 	Toimitettu
102 	Sophia Garcia 	Kadonnut
NULL 	James Anderson 	NULL
NULL 	Olivia White 	NULL
103 	Daniel Lee 	Toimitettu

*/



-- FULL JOIN – Näytä kaikki rivit molemmista tauluista, yhdistäen yhteiset tiedot. Tämä yhdistää molemmat taulut, mutta näyttää kaikki rivit, vaikka vastaavaa tietoa toisessa taulussa ei olisi.
SELECT Tilaukset.id, Asiakkaat.nimi, Tilaukset.toimitus_status
FROM Tilaukset
RIGHT JOIN Asiakkaat ON Tilaukset.asiakas_id = Asiakkaat.id;

/*

 nimi 	toimitus_status 	id 	
Matti Meikäläinen 	toimitettu 	1
Anna Virtanen 	lähetetty 	2
Jari Korhonen 	käsittelyssä 	3
Paula Laine 	toimitettu 	4
Sami Nieminen 	toimitettu 	5
Laura Hiltunen 	lähetetty 	6
Tomi Salminen 	käsittelyssä 	7
Riikka Mäkelä 	lähetetty 	8
Eero Kallio 	toimitettu 	9
Veera Lehtinen 	käsittelyssä 	10
William Taylor 	Toimitettu 	101
Sophia Garcia 	Kadonnut 	102
James Anderson 	NULL 	NULL
Olivia White 	NULL 	NULL
Daniel Lee 	Toimitettu 	103
Nathan Reed 	Kadonnut 	104
*/


-- CROSS JOIN – Luo kaikkien asiakkaiden ja tuotteiden yhdistelmät
-- Tämä tuottaa kaikki mahdolliset asiakas-tuote-yhdistelmät, mikä voi olla hyödyllistä esim. kampanjoiden suunnittelussa.

SELECT Asiakkaat.nimi, Tuotteet.nimi AS Tuote
FROM Asiakkaat
CROSS JOIN Tuotteet;
