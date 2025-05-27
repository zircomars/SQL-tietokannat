-- ===========================================
-- MUUTAMIA HARJOITUKSIA W3SCHOOLS JA LISÄÄ EDITOITUNA


-- SELECT DISTINCT varmistaa, että jokainen asiakkaan nimi näkyy vain kerran tuloksessa ja käsky asiakkaan nimet käänteisenä & ASC nouseva aakkosjärjestys A-> ja DESC käänteinen aakkosjärjestys Z -> A
SELECT DISTINCT Asiakkaat.nimi
FROM Asiakkaat
ORDER BY Asiakkaat.nimi DESC ;


-- lasketaan yhteen koko Asiakkaat - taulukkon nimet
SELECT COUNT(DISTINCT Asiakkaat.nimi)
FROM Asiakkaat;



-- haettaan kohdetta, mutta %SANA% - prosenttiamerkkiä tarkoittaa mitä edessä ja taka onkaa ihan sama, esim. voi olla lontoo, UK ja jne. Tämä tarkoittaa osoite-sarakkeen arvo ei ole tarkalleen "UK" sisältyen muu kaupunki. Jos ois tarkka niin sitten ilman prosenttiamerkkiä (edessä/takana).
SELECT * FROM Asiakkaat 
WHERE osoite LIKE '%UK%';




-- toinen esim. haluttaisiin nimettyä maata, oiskin uk tai ranska. vaikka taulukkossa on uk, mutta ei ranskaa, niin nimettään haluttaisiin molemat että tuloksesta voi olla jompi kumppi
-- on useampi perään voi lisätä: OR osoite like '%Denmark%'
SELECT * FROM Asiakkaat 
WHERE osoite LIKE '%UK%' OR osoite LIKE '%French%'; 

-- WHERE osoite LIKE '%UK%' OR osoite LIKE '%Germany%' OR osoite LIKE '%Japan%';


-- Tämä on lyhyempi mutta tiivistettynä ja helpottakseen lukemista (ylempi maiden etsiminen) mutta ongelmana IN-operaattori ei toimi jokerimerkkien (%) kanssa, koska se etsii tarkkoja arvoja tietokannasta
SELECT * FROM Asiakkaat 
WHERE osoite IN ('%UK%', '%Germany%', '%Japan%');



-- ei jaksa tarkisella aina Asiakkaan taulukkoa, ja muutettaan muuta ja pätee operaattori merkit = haettaan täsmentävä ID, sitten id on suurempi kuin 3:nen
SELECT * FROM Tilaukset WHERE id > 3; 

-- haettaan joko pienempi tai yhtä pieni kuin 3, että kolmonen itsekin tulee siihen näkyviinsä
SELECT * FROM Tilaukset WHERE id <= 3; 

SELECT * FROM Tilaukset WHERE Tilaukset.asiakas_id = 3; 

-- haettaan id väliltä alkaen 3 ja 7 välistä.
SELECT * FROM Tilaukset WHERE Tilaukset.id BETWEEN 3 AND 7; 


-- ==========================================
-- SQL ORDER BY Keyword
-- ORDER BY on SQL-komento, joka järjestää tulokset tietyssä järjestyksessä.

SELECT * FROM Tuotteet ORDER BY nimi; 

/* ORDER BY (JOTAKIN) ASC - nouseva järjestys esim. pienestä suurempaan
    ORDER BY (JOTAKIN) DESC - lakseva järjestys esim. suuremmasta pienempään

*/

SELECT * FROM Tuotteet ORDER BY Tuotteet.hinta ASC; 


--haettaan tuotetta joka hinta on pienempi kuin 50, sekä toistettaan järjestyksessä ASC
SELECT * FROM Tuotteet
WHERE Tuotteet.hinta < 50
ORDER BY hinta ASC;


-- haettaan tuotetta koskien varastotilannetta on yhtä enemmän tai enemmän kuin 100 kpl:ta, käsketään suuremmasta pienempään DESC
SELECT * FROM Tuotteet 
WHERE Tuotteet.varastotilanne >= 100 
ORDER BY varastotilanne DESC; 

-- sama haettaisiin tuotteen hinnasta 50 ja 100 väliltä, ja käsketään järjestyksessä
SELECT * FROM Tuotteet
WHERE Tuotteet.hinta BETWEEN 50 AND 100 
ORDER BY hinta ASC;


-- kokeillaan muutama juttuja, eli select tuotteesta hinta, kategoria id, nimi - tuotteen taulukkosta, sitten käskettään haluttaan Tuotteen kategorian id järjestyksessä, ja hinta järjestys . 
SELECT Tuotteet.hinta, Tuotteet.kategoria_id, nimi 
FROM Tuotteet
ORDER BY Tuotteet.kategoria_id ASC, Tuotteet.hinta DESC;

/* Tulostus näköinen:
Oikeassa ollaa, koska halutaa id järjestys pienestä suurempaan kohti, ja hinnasta suuremmasta pienempään
kategoria_id	nimi	                hinta (€)
1	            Kannettava tietokone	1299.99
1	            Älypuhelin	            599.99
1	            Tabletti	            399.99
1	            Langaton kaiutin	    129.99
1	            Bluetooth-kuulokkeet	79.99
1	            Pelihiiri	            49.99
2	            Urheilutakki	        119.99
2	            Sadetakki	            79.99
2	            Farkut	                59.99
2	            T-paita	                19.99
3	            Kasviskokkikirja	    22.99
3	            Novellikokoelma	        17.99
*/

-- valittaan järkevämpi tulostus, koska jos normi SELECT * FROM Tuotteet sitten order by jotakin, niin se tulostaa Tuotteet taulukkon kokonaan, mutta haluttaan supistaa ja rajoittaa tulostusta.
SELECT Tuotteet.id, Tuotteet.nimi, Tuotteet.varastotilanne 
FROM Tuotteet 
ORDER BY id, nimi, varastotilanne; 


--=======================================================================================

-- SQL AND Operator (AND vs OR)
-- WHERE- ja AND-operaattorit ovat osa SQL-kyselyiden ehtoja, joiden avulla voit suodattaa tietoa tietokannasta.

-- esim haettaisiin Asiakkaasta kennellä on saldo yli 30 000
SELECT * FROM Asiakkaat
WHERE saldo > 30000;



-- Esim. hakisi kennellä on yli 10k (10 000) saldoa ja kotoisin UK:sta
SELECT * FROM Asiakkaat 
WHERE saldo > 10000 AND osoite LIKE '%UK'; 

/* AND vs OR - operaattorit SQL:ssä

AND → Palauttaa vain rivit, joissa kaikki ehdot ovat totta.

OR → Palauttaa rivit, jos yksi tai useampi ehto on totta.

*/


-- haettana Asiakkaan taulukoa, joka sijaitsee osoitteessa USA, saldo on enemmän kuin 10k , ja rekisteröinyt ennen vuotta 1999. Rekisteröitymisestä käyttäen 1999-01-01 muotoa.
SELECT * FROM Asiakkaat
WHERE osoite like '%USA%'
AND saldo > 10000
AND rekisteröitymis_pvm < '1999-01-01';



-- kokeillaan haettaisiin USA jA UK, että sama tyyppisellä, sekä WHERE voi toimia ilman sulkeita mutta auttaa pientä hahmottamista
SELECT * FROM Asiakkaat
WHERE (osoite like '%USA%' OR osoite like '%UK%')
AND saldo > 10000
AND rekisteröitymis_pvm < '1999-01-01';

/*
WHERE ilman sulkeita toimii, mutta kuten aiemmin mainitsin, sulkeet voivat auttaa varmistamaan oikean loogisen järjestyksen etenkin kun yhdistetään AND ja OR-operaattoreita.

SQL käsittelee AND-ehtoja ennen OR-ehtoja, joten jos haluat varmistaa, että OR toimii ensin, sulkeet voivat olla hyödyllisiä. Mutta jos ehtosi toimivat ilman sulkeita ja saat oikeat tulokset, ei ole pakollista käyttää niitä.
*/

-- yhdistettään AND ja OR operaattoria, sekä tarvittaan vastaavasti LIKE operaattori mukaan joka kerta
-- Tässä tapahtuu haettaan missä osoite on kuin "UK", tai osoite on kuin "Saksa", tai osoite on kuin "japani" sitten saldo enemmän kuin 30k ja rekisteröitymis_pvm ennen 2010-01-01
SELECT * FROM Asiakkaat
WHERE osoite like '%UK%' OR osoite LIKE '%Germany%' OR osoite LIKE '%Japan%'
AND saldo > 30000
AND rekisteröitymis_pvm < '2010-01-01';


-- haettaan Asiakkaan taulukkosta, kuin missä sähköposti on "example.com", ja osoitteesta pitää sisältää joko USA ja Saksasta. & AND rivissä voi toimia ilman sulkeittakin
SELECT * FROM Asiakkaat 
WHERE sähköposti LIKE '%example.com' 
AND (osoite LIKE '%USA%' OR osoite LIKE '%Germany%');

/* Pieni huomoina koskien yhtäkuin = merkkiä ei tue % jokerimerkkiä - tämä ei palauta odotettujen tulosta siksi tulee ratkaisuksi ja käyttäen "LIKE" - jokerinmerkkin kanssa. Jos esim. just kaupunki ja maa (New York, USA) siksi vertailumerkkin tulee (=) ei toimi, vaan käyttäen %USA%
*/

--================================================================================================
-- SQL OR operaattori

-- Where voidaan sisältyä OR operaattoria

-- haettaan Tuotteen kategoriasta id mukaan joko 1 tai 4 
SELECT * FROM Tuotteet
WHERE kategoria_id = '1' OR Tuotteet.kategoria_id = '4';


-- SQL NOT Operator (kielteinen)
-- että haluttaan negatiivista ja tiettyä ominaisuutta ikään ei haluta. Kielteisen ehdon (NOT tai !=) ja samalla suodattaa tiettyjä kategorioita yhdellä SQL-kyselyllä

-- Haetaan Tuotteet-taulukosta, mutta EI haluta kategoria ID:tä 3
SELECT * FROM Tuotteet 
WHERE NOT Tuotteet.kategoria_id = '3'; 

-- METHOD 2
-- Haetaan tuotteet, mutta jätetään pois kategoria ID 3
SELECT * FROM Tuotteet 
WHERE kategoria_id != 3;


-- Tämä sulkee pois kategoriat, joissa id = 3, mutta näyttää kategoriat, joissa id = 4 , mutta silti näyttää kategoria_id siis numeroidut 1,2, 4 ja 5:sen vaikka haluttaisiin VAIN 4:sen
SELECT * FROM Tuotteet 
WHERE kategoria_id != 3 OR kategoria_id = 4;



-- Tämä näyttää vain kategoriassa 4 olevat tuotteet, eikä sisällä mitään kategoriasta 3.
SELECT * FROM Tuotteet 
WHERE kategoria_id = 4 AND kategoria_id != 3;


-- ANOTHER METHOD:
-- käytettään laajempaa kielteistä ehtoa ja jättää pois useita kategorioita. Tämä sulkee pois kategoriat 3 ja 5, mutta näyttää kaikki kategoriassa 4 olevat tuotteet.
SELECT * FROM Tuotteet 
WHERE kategoria_id NOT IN (3, 5) OR kategoria_id = 4;


-- NOT LIKE - jossa ei ole alkuun ja eikä päättyyn 'e' kirjainta, esim eero, dnaiel, jessica
SELECT * FROM Asiakkaat 
WHERE Asiakkaat.nimi NOT LIKE '%e%'; 


-- haettaan joiden nimi ei sisällä 'e' eikä 'u'
/*
| Rakenne | Selitys                                  | Esimerkki hakutulos           |
| ------- | ---------------------------------------- | ----------------------------- |
| `'a%'`  | Alkaa **a**:lla                          | Anna, Aleksi, Antti           |
| `'%a'`  | Päättyy **a**:han                        | Laura, Sofia, Elina           |
| `'%a%'` | **Sisältää** a\:n missä tahansa kohdassa | Paula, Jari, Sami, Anna, etc. |
| `'a'`   | On **tasan** yksi merkki: "a"            | vain jos arvo on tasan "a"    |
*/
SELECT * FROM Asiakkaat 
WHERE Asiakkaat.nimi NOT LIKE '%e%'
AND nimi NOT LIKE '%u%'; 


SELECT * FROM Asiakkaat 
WHERE Asiakkaat.nimi NOT LIKE '%e%'
AND nimi NOT LIKE '%u%'; 


-- NOT BETWEEN , joka ei ole jonkin väliltä
-- esim. haettaan saldo joka ei ole 10k - ja 40k väliltä, eli tulostuu alle 10k ja yli 40k määrää
SELECT * FROM Asiakkaat 
WHERE saldo NOT BETWEEN 10000 AND 40000; 


-- haettaan id joka ei ole 5 ja 20 väliltä
SELECT * FROM Asiakkaat
WHERE id NOT BETWEEN 5 AND 120;



-- NOT IN
-- nimettään kielteisesti ettei haluta näitä kohteita Suomi, UK, Japan, USA - tulostettua taulukosta, eli nimetyt maat pois
SELECT * FROM Asiakkaat 
WHERE osoite NOT IN ('Suomi', 'UK' , 'Japan', 'USA'); 



-- NOT Greather than
-- haettaan id joka ei ole suurempi kuin kuin 5
SELECT * FROM Asiakkaat 
WHERE NOT id > 5; 


-- NOT Less than
-- id joka on vähintään 5
SELECT * FROM Asiakkaat 
WHERE NOT id < 5; 

-- =================================================================================
-- SQL INSERT INTO Statement

-- INSERT INTO - lauseketta käytetään uusien tietuiden lisäämistä taulukkoon

/*
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);

INSERT INTO table_name
VALUES (value1, value2, value3, ...);

*/

-- eli tarkoittaa käyttäjän tai taulukon alle lisätään jotakin tietoa, esim. tähän Asiakkaan taulukon alle lisätään uusi henkilö tai jokin ominaisuus/uusi tieto. 
-- INSERT INTO ... VALUES-lauseke kertoo mihin taulukkoon haluat lisätä tietoa sekä mitkä arvot lisätään.


-- tässä pitää olla tarkanna, mitä tietoja tarvittaan jotta syöte menee oikein.
INSERT INTO Asiakkaat (id, nimi, sähköposti, osoite, rekisteröitymis_pvm, saldo)
VALUES (21, 'Olivia Mäkinen', 'olivia2@example.com', 'Suomi', '1999-04-15', 3456.67);


-- sama pätee jos sarakkeista ei ole erikseen määritelty (tämä toimii hyvinkin nopeammin)
INSERT INTO Asiakkaat 
VALUES (22, 'Leon Shawn', 'leon@example.com', 'UK', '1998-05-13', 44132.84);


-- entä jos INSERT INTO - lausekeessa sulkeiden sisällä ominaisuudet menee ristiin. SQL edellyttää, että arvojen järjestys vastaa sarakkeiden järjestystä.. (tämä menee läpi)
INSERT INTO Asiakkaat (nimi, saldo, sähköposti, osoite, rekisteröitymis_pvm, id) 
VALUES ('Gilbert Tate', 23634.87, 'gilbert@example.com', 'Australia', '1996-3-04', 23);


-- sama homma jos sarake puuttuu tai tietty tieto, se sitten menee NULL, mutta silti menee läpi ja esim. rekisteröitymis_pvm jätettäisiin välistä ja huomioina se sitten id lisääntyy automaattisesti, koska taulukossa on "AUTO_INCREMENT" käytössä. Tarkoittaa id-sarake lisäääntyy automaattisesti, kun uusi rivi lisätään.
INSERT INTO Asiakkaat (nimi, sähköposti, osoite, saldo) 
VALUES ('Nicole Colombi', 'nicole@example.com', 'Italy', 9999.12);


-- lisätään 5 uutta henkilöä "Asiakkaan" taulukkoon - käytettään "INSERT INTO" - KOMENTOA, yksi aikaisempi testausta, et miten lisätään käyttäjä ja saldosta n. siltä väliltä
INSERT INTO Asiakkaat (nimi, sähköposti, osoite, rekisteröitymis_pvm, saldo) VALUES 
('William Taylor', 'william@example.com', 'Manchester, UK', '2025-05-22', ROUND(RAND() * 50000, 2)),
('Sophia Garcia', 'sophia@example.com', 'Madrid, Spain', '2023-07-15', ROUND(RAND() * 50000, 2)),
('James Anderson', 'james@example.com', 'Berlin, Germany', '2024-10-30', ROUND(RAND() * 50000, 2)),
('Olivia White', 'olivia@example.com', 'Paris, France', '2022-12-05', ROUND(RAND() * 50000, 2)),
('Daniel Lee', 'daniel@example.com', 'Tokyo, Japan', '2023-03-18', ROUND(RAND() * 50000, 2));


-- yksittäisen käyttäjän lisääminen ilman satunnaista lukua, et syöttää saldon itse
INSERT INTO Asiakkaat (nimi, sähköposti, osoite, rekisteröitymis_pvm, saldo) VALUES 
('Harry Shadows', 'harry@example.com', 'Newcastle, UK', '2005-07-13', 9999.00);


-- 5 henkilöä lisää ja rekisteröiymis pv n. 2000 - 2025 väliltä
INSERT INTO Asiakkaat (nimi, sähköposti, osoite, rekisteröitymis_pvm, saldo) VALUES 
('Nathan Reed', 'nathan@example.com', 'Dallas, USA', DATE_SUB('2025-12-31', INTERVAL FLOOR(RAND() * 9490) DAY), ROUND(RAND() * 50000, 2)),
('Isabella Evans', 'isabella@example.com', 'Auckland, New Zealand', DATE_SUB('2025-12-31', INTERVAL FLOOR(RAND() * 9490) DAY), ROUND(RAND() * 50000, 2)),
('Ethan Hall', 'ethan@example.com', 'Toronto, Canada', DATE_SUB('2025-12-31', INTERVAL FLOOR(RAND() * 9490) DAY), ROUND(RAND() * 50000, 2)),
('Lily Adams', 'lily@example.com', 'Berlin, Germany', DATE_SUB('2025-12-31', INTERVAL FLOOR(RAND() * 9490) DAY), ROUND(RAND() * 50000, 2)),
('Jackson Murphy', 'jackson@example.com', 'Sydney, Australia', DATE_SUB('2025-12-31', INTERVAL FLOOR(RAND() * 9490) DAY), ROUND(RAND() * 50000, 2));




--=================================================================================
-- Test for NULL Values

-- NULL-arvojen käsittely SQL:ssä toimii eri tavalla kuin normaalit vertailuoperaattorit.
-- NULL ei ole sama kuin tyhjä arvo – se tarkoittaa tuntematonta tai puuttuvaa arvoa.
-- = ja <> eivät tunnista NULL-arvoja, koska SQL käsittelee NULL-arvoja eri tavalla kuin tavalliset luvut tai merkkijonot.


-- tarkistettaan Tuotteet taulukosta, missä hinta on NULL 
SELECT * FROM Tuotteet 
WHERE hinta IS NULL; 


-- tarkistettaan Tuotteet-taulukosta, missä hinta ei ole NULL - se tuo mukaan jos "kategoria_id" on NULL pätee niitäkin ja "varastotilanne" jos sekin NULL.
SELECT * FROM Tuotteet 
WHERE hinta IS NOT NULL; 


/*jos käyttää erikoismerkin <> ja = näiden osalta se ei toimi ja mallina:

SELECT * FROM Tuotteet WHERE hinta = NULL;  -- Ei toimi!
SELECT * FROM Tuotteet WHERE hinta <> NULL; -- Ei toimi!
*/

-- Testauksena halutaan näyttää tuotteet joiden hinta on null tai hinta on pienempi kuin 50
SELECT * FROM Tuotteet 
WHERE hinta IS NULL OR hinta < 50;


-- sama pätee varastotilanne jos on NULL tai jos on yli 100 kpl:ta
SELECT * FROM Tuotteet 
WHERE Tuotteet.varastotilanne IS NULL OR Tuotteet.varastotilanne > 100;


-- haettaan joku Tuotteen taulukosta, joka hinta on null ja halutaan kategoria id on 1. 
SELECT * FROM Tuotteet 
WHERE hinta IS NULL AND kategoria_id = 1;


-- tässä esim. haettaan Tuotteen taulukosta, joka hinta ei ole NULL ja varastotilanne on NULL.
SELECT * FROM Tuotteet 
WHERE hinta IS NOT NULL AND varastotilanne IS NULL; 



--========================================
-- SQL UPDATE Statement

/*
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;
*/


-- Kokeillaan päivittää tämä osuus BEFORE: id: 5 nimi: Romaani hinta:12.99 kategoria_id: 3 varastotilanne: 70
-- esim. muutettun jälkeen se muuttuu samantien. Huomoina tämä pitää mennä taulukkon nimetyn tekijän mukaan.
UPDATE Tuotteet
SET nimi = 'novelli', varastotilanne = '80'
WHERE id = 5;

SELECT * FROM Tuotteet;



-- UPDATE Multiple Records
-- tarkoittaa, että päivität useita rivejä kerralla, jos ne täyttävät tietyt ehdot, ja tämä ei vaikuta kaikkiin riveihin automaattisesti, vaan niihin, jotka vastaa WHERE ehtoa
-- kokeillaan tätä: id: 16 nimi: Sadetakki hinta 79.99 kategoria_id: 2 varastotilanne: 55

-- Otettaan kaikki kategoria id = 1 listaus
SELECT * FROM Tuotteet 
WHERE kategoria_id = 1; 


/*  BEFORE:
    Edit Edit 	Copy Copy 	Delete Delete   1 	Älypuhelin 	            599.99 	1 	50
	Edit Edit 	Copy Copy 	Delete Delete 	2 	Kannettava tietokone 	1299.99 1 	20
	Edit Edit 	Copy Copy 	Delete Delete 	7 	Bluetooth-kuulokkeet 	79.99 	1 	75
	Edit Edit 	Copy Copy 	Delete Delete 	9 	Pelihiiri 	            49.99 	1 	60
	Edit Edit 	Copy Copy 	Delete Delete 	10 	Tabletti 	            399.99 	1 	35
	Edit Edit 	Copy Copy 	Delete Delete 	15 	Langaton kaiutin 	    129.99 	1 	50
	Edit Edit 	Copy Copy 	Delete Delete 	19 	Älykello 	            NULL 	1 	45
*/

-- jos hinta on NULL alunperin, ja tekee update muutoksensa niin tämä ei muutu sitä, koska NULL ei ole arvo, eikä sitä voi kertoa millään arvolla


-- Nyt tehdään muutokset
UPDATE Tuotteet
SET hinta = hinta * 1.10 -- korotettaan hintaan 10%
WHERE kategoria_id = 1; -- vain kateogirat 1 tuotteet

SELECT * FROM Tuotteet
WHERE kategoria_id = 1;

/* AFTER:
 	Edit Edit 	Copy Copy 	Delete Delete 	1 	Älypuhelin 	            659.99 	1 	50
	Edit Edit 	Copy Copy 	Delete Delete 	2 	Kannettava tietokone 	1429.99 	1 	20
	Edit Edit 	Copy Copy 	Delete Delete 	7 	Bluetooth-kuulokkeet 	87.99 	1 	75
	Edit Edit 	Copy Copy 	Delete Delete 	9 	Pelihiiri 	            54.99 	1 	60
	Edit Edit 	Copy Copy 	Delete Delete 	10 	Tabletti 	            439.99 	1 	35
	Edit Edit 	Copy Copy 	Delete Delete 	15 	Langaton kaiutin 	    142.99 	1 	50
	Edit Edit 	Copy Copy 	Delete Delete 	19 	Älykello 	            NULL 	1 	45
*/

-- sama pätee oiskin hinta niin muutettaisiin se NULL:iksi
-- Kokeillaan tätä BEFORE: 11 	Farkut 	59.99 	2 	0
-- eli muutettan tämä farkku hinnasto NULL:iks ja missä sen id on 11

UPDATE Tuotteet
SET hinta = NULL
WHERE id = 11;

SELECT * FROM Tuotteet
WHERE id = 11;


-- kokeillaan yksittäistä tuotetta hinnan muutosta BEFOFRE - 4 	Juoksukengät 	89.99 	4 	45
-- kokeillaan lisätä varastotilannetta, mutta siihen pitää ennen sitä laittaa pilku, ja ei käytetä AND-operaattoria
UPDATE Tuotteet
SET hinta = 50.99, varastotilanne = 80
WHERE id = 4;

SELECT * FROM Tuotteet
WHERE id = 4;


-- sama pätee jos on useita tuoteitta, et niiden hinnat ja varastotilanne muuttu ettei tarvitse jokaista yksittäistä syötellä, varmistettaan id sitten pilku id numero ja jne, sekä jos on useampi menee näin "WHERE id IN (2, 5, 8, 12);"
UPDATE Tuotteet 
SET hinta = 50.99, varastotilanne = 80 
WHERE id IN (4, 10);


--lisätyn "Saldo" sarakkeen jälkeen niin päivitettään saldo satunnaisesti ja saldo voi olla esim. rahansakin
UPDATE Asiakkaat
SET saldo = ROUND(RAND() * 50000, 2);

-- päivitettään asiakkaiden saldo lisäämällä 10% jos saldo on alle 5000
UPDATE Asiakkaat SET saldo = saldo * 1.1 
WHERE saldo < 5000;


-- päivitystä rekisteröitymis_pvm _ satunnaisesti n. 1950 - 2010
-- aloituspiste on 2010-12-31 josta päivämääriä vähennettään randomisti 21915 päivää - vastaa n. 60 vuotta.
UPDATE Asiakkaat
SET rekisteröitymis_pvm = DATE_SUB('2010-12-31', INTERVAL FLOOR(RAND() * 21915) DAY);


-- ===============================================
-- SQL DELETE Statement
-- DELETE - ehto tarkoittaa tietojen tai yksittäisen taulukkon sisällön poistoa

DELETE FROM table_name WHERE condition;

-- leikisti poistettaisiin tämä; 31 	Farkkutakki 	89.99 	2 	NULL 
-- huomoina tämä PHPmyadmin tietokanta kysyi kertalleen (yhteenvetona) että haluatko oikeasti poistaa tämän id:nsä niin vahvistettiin ja tarkistettuna tämä id 31 farkkutakki on poistunut Tuotteen-taulukon alta
DELETE FROM Tuotteet WHERE id = 31; 

-- ===============================================

-- SQL TOP, LIMIT, FETCH FIRST or ROWNUM Clause

--  SQL SELECT TOP Clause
-- SELECT TOP -lauseke käytetään SQL:ssä rajaamaan palautettavien rivien määrää. Tämä on hyödyllistä etenkin suurissa taulukoissa, joissa on tuhansia rivejä, sillä hakemalla vain tarvittavat tiedot voi parantaa suorituskykyä.

-- SELECT TOP toimii vain SQL Server -tietokannoissa. Jos käytät esimerkiksi MySQL, PostgreSQL tai SQLite - täyttyy käyttää LIMIT lauseketta TOP sanan sijaan.

SELECT * FROM Tuotteet LIMIT 5;



-- tämä hakee 5 ensimmäistä riviä Tuotteen taulukosta, josta hakee hinnan mukaan suurimmasta pienempään , ei väliä id:stä mitä hintoja on onkaan 1-30 väliltä & kuitenkin 5 kalleinta tuotetta.
SELECT * FROM Tuotteet 
ORDER BY hinta DESC 
LIMIT 5;



-- sama tässäkin haettaisiin kaikki minimi hinnat, ja jos on NULL - nekin lasketaan mukaan
SELECT * FROM Tuotteet 
ORDER BY hinta ASC 
LIMIT 5; 

-- ===============================================

-- SQL TOP, LIMIT, FETCH FIRST or ROWNUM Clause

/* SQL SELECT TOP Clause
SELECT TOP -lauseke käytetään SQL:ssä rajaamaan palautettavien rivien määrää. Tämä on hyödyllistä etenkin suurissa taulukoissa, joissa on tuhansia rivejä, sillä hakemalla vain tarvittavat tiedot voi parantaa suorituskykyä.

SELECT TOP toimii vain SQL Server -tietokannoissa. Jos käytät esimerkiksi MySQL, PostgreSQL tai SQLite - täyttyy käyttää LIMIT lauseketta TOP sanan sijaan.

Teoriassa tässä on mukaan melko samankaltaisia komentoja, SQL SELECT TOP -lauseke on syntaksi, jota käytetään erityisesti SQL Serverissä, MS Accessissa, Oracle SQL, MySQL/ POstreSQL / MariaDB ja SQLite rajaamaan palautettujen rivien määrää. Mutta eri tietokannat käyttävät eri tapoja toteuttaa sama toiminnallisuus.

| SQL-järjestelmä | Rajaaminen (SELECT TOP vastaava) |
|----------------|--------------------------------|
| **SQL Server / MS Access** | `SELECT TOP 5 * FROM Taulukko;` |
| **MySQL / PostgreSQL / MariaDB** | `SELECT * FROM Taulukko LIMIT 5;` |
| **Oracle SQL** | `SELECT * FROM Taulukko FETCH FIRST 5 ROWS ONLY;` |
| **SQLite** | `SELECT * FROM Taulukko LIMIT 5;` |

*/

SELECT * FROM Tuotteet LIMIT 5;


-- LIMIT 
-- tämä hakee 5 ensimmäistä riviä Tuotteen taulukosta, josta hakee hinnan mukaan suurimmasta pienempään , ei väliä id:stä mitä hintoja on onkaan 1-30 väliltä & kuitenkin 5 kalleinta tuotetta.
SELECT * FROM Tuotteet 
ORDER BY hinta DESC 
LIMIT 5;




-- sama tässäkin haettaisiin kaikki minimi hinnat, ja jos on NULL - nekin lasketaan mukaan
SELECT * FROM Tuotteet 
ORDER BY hinta ASC 
LIMIT 5; 


-- haettaan asiakkaan listasta rajoitettu 3 kpl:ta jotka osoite sijaitsee Suomi.
SELECT * FROM Asiakkaat
WHERE osoite = 'Suomi' 
LIMIT 3; 


-- haettaan raja maasta, italiasssa asiakkaan taulukossa oli vain 1, mutta saksassa muutama, mutta kuitekin haluttaa jomppaa kumppaa
SELECT * FROM Asiakkaat 
WHERE osoite = 'Italy' OR osoite = 'Germany' LIMIT 3; 


--=======================================================
-- SQL Aggregate Functions

/* SQL:n Aggregate Functions ovat funktioita, jotka suorittavat laskutoimituksia arvojoukosta ja palauttavat yhden arvon.

Ne auttavat ryhmittelemään ja analysoimaan tietoa suurissa tietokannoissa. Yhdessä GROUP BY-lauseen kanssa ne mahdollistavat datan ryhmittelyn ja yhteenvedon.


MIN()	Palauttaa pienimmän arvon sarakkeessa.
MAX()	Palauttaa suurimman arvon sarakkeessa.
COUNT()	Laskee rivien määrän joukoissa.
SUM()	Laskee sarakkeen kaikkien arvojen summan.
AVG()	Palauttaa sarakkeen keskiarvon.

*/


-- esim. laskettaisiin Tuotteen taulukosta hinnat keskihinnaksi (huom. keskihinta - sana - on itse tuotu)
-- "keskihinta"  ei ole Tuotteen sarakkeessa, vaan se on alias, joka annettaan SQL kyselyssä ja toimii kuin annetaan vain tilapäinen nimi, ja se ei tuhoa taulukkon sisällön rakennetta
SELECT AVG(hinta) AS keskihinta FROM Tuotteet; 

-- muita esimerkkejä
SELECT MIN(Tuotteet.hinta) AS pieninhinta FROM Tuotteet;

-- haluttaisiin tulostaa useampaa kuten minimi, maksimi ja keskiarvo
SELECT MIN(Tuotteet.hinta) AS pieninhinta , M
AX(Tuotteet.hinta) AS suurinhinta 
FROM Tuotteet; 


SELECT MIN(Tuotteet.hinta) AS pieninhinta,
MAX(Tuotteet.hinta) AS suurinhinta ,
AVG(Tuotteet.hinta) AS keskiarvo
FROM Tuotteet;


-- tämä laskee tuotteiden lukumäärää kategoriassa, mutta huomoina Tuotteen taulukkossa on mukana NULL arvoa
SELECT kategoria_id, COUNT(*) AS tuotteiden_maara 
FROM Tuotteet 
GROUP BY kategoria_id;

-- SQL-kysely laskee tuotteiden määrän per kategoria_id, eli se kertoo, kuinka monta tuotetta kuuluu kuhunkin kategoriaan
SELECT kategoria_id, COUNT(*) AS tuotteiden_maara 
FROM Tuotteet 
WHERE kategoria_id IS NOT NULL 
GROUP BY kategoria_id; 


-- tässä on parempi esim. joka laskee Asiakkaan taulukkon kaikki id:n määrät yhteen, ja monta kappaleta niitä onkaan.
SELECT Asiakkaat.id, COUNT(*) AS idmaara 
FROM Asiakkaat 
GROUP BY Asiakkaat.id; 


-- sama jos halutaan COUNT kaksi kertaa, niin toistettaan count ominaisuus kategoria/asiansa kahesti ja pätee otettaan mukaan mitkä ei ole NULL
SELECT kategoria_id, COUNT(*) AS kategorianID, COUNT(varastotilanne) AS varastossa_olevat
FROM Tuotteet
WHERE kategoria_id IS NOT NULL
GROUP BY kategoria_id;


-- tämä on toinen methodi, mutta hakee vain tietyn kategorian tuotteet ja laskee niiden määrä
SELECT COUNT(*) AS tuotteiden_maara
FROM Tuotteet
WHERE kategoria_id IN (1, 2);  -- Vain kategoriat 1 ja 2 


-- summan laskenta SUM() jokaisesta tyyppistä
SELECT SUM(Asiakkaat.saldo) AS yhteisSaldo 
FROM Asiakkaat;



-- Esim halutaisiin laskea kahden tai useamman Taulukkon erikseen niin näin
SELECT 
    (SELECT SUM(saldo) FROM Asiakkaat) AS yhteisSaldo, 
    (SELECT SUM(hinta) FROM Tuotteet) AS yhteisHinta;

-- SUM() toimii vain numeeristen arvojen kanssa, eikä tekstimuotoisia tietoja, kuten nimet, voi laskea yhteen ja se ei laske NULL arvoja, jos jokin nimi/arvo puuttuu
SELECT COUNT(Asiakkaat.nimi) as NimiMaara FROM Asiakkaat;


-- AVG() keskimääräinen jotakin ja AVG() toimii vain numeeristen arvojen kanssa! Jos yrität käyttää AVG()-funktiota tekstimuotoiseen sarakkeeseen, kuten nimi, SQL antaa virheen, koska keskiarvoa ei voi laskea ei-numeerisista arvoista.
SELECT AVG(hinta) AS tuotteenHinta FROM Tuotteet;


-- =======================================================
-- SQL MIN() and MAX() Functions
-- perus minimaalinen ja maksimaalinen funtio palautus arvo jostakin sarakkeesta

-- tarkistetaan minimi hinta
SELECT MIN(Tuotteet.hinta) 
FROM Tuotteet; 


-- ajattelin tulostaisi minimi hinta 5 kpl:ta, mutta se sitte menisi toisenlaisella komennolla ja helpommalla, ja tapaa on monta mutta ei ole väärää ja oikeata, mutta sitä pitää vaan suunnitella jotta pääsee maaliin asti
SELECT hinta 
FROM Tuotteet 
WHERE hinta IS NOT NULL
ORDER BY hinta ASC 
LIMIT 5;


-- hinnasta/luvusta annettaan joku aliasta nimi (saldot) ja tulostettaan Asiakkaan taulukkosta
SELECT MIN(Asiakkaat.saldo) AS saldot
FROM Asiakkaat;


-- Use MIN() with GROUP BY
-- voidaan käyttää MIN() funktiota ja jotakin GROUP BY lauseketta, että palauttaa jotakin esim. minimi hintaa sarakkeen listasta
-- esim tässä haettaan minimi tuotteen hinta as minimihinta, kategoria_id ja nimi, Tuotteen taulukkosta ja ryhmitettynä kategoria id mukaan.
SELECT MIN(Tuotteet.hinta) AS minimiHinta, kategoria_id, nimi
FROM Tuotteet
GROUP BY kategoria_id;

--=========================================================
-- SQL COUNT() Function

-- tarkistaa Taulukkon kokorivinsä
SELECT COUNT(*)
FROM Tuotteet;

--toi tähti * symbooli tarkoittaa kaikki rivit, myös ne joissa on NULL arvoja , JOS count(column_name) vain ne rivit joissa on sarake ei ole NULL
SELECT COUNT(nimi) FROM Tuotteet;

-- seuraavaksi voidaan laskea yhteen esim. saldosta asiakkaan osalta että on enemmän kuin 500 
SELECT COUNT(Asiakkaat.saldo)
FROM Asiakkaat
WHERE saldo > 500;


-- sama muutettuna pikaksen, että on yhtä vähän tai sitä vähempi kuin 500
SELECT COUNT(Asiakkaat.saldo)
FROM Asiakkaat
WHERE saldo <= 500;


-- tässä sama kuin aikaisempi, mutta halusin tietää nimensä kuka (nimi, saldo, osoite), että kennellä on yhtä paljon tai vähemmän kuin 500. saldoArvo on aliasnimi tolle Asiakkaat.saldo
SELECT COUNT(Asiakkaat.saldo) AS saldoArvo, nimi, saldo, osoite
FROM Asiakkaat
WHERE saldo <= 500;


-- Ignore Duplicates
-- DISTINCT-avainsanaa käytetään COUNT()-funktiossa, kun halutaan laskea vain uniikit arvot, eikä samoja arvoja useaan kertaan.





--===============================
-- JOIN


-- Yhdistettään kahta taulukkoa, settä select mitä halutaan tulostaa ja mistä taulukkon nimeä ja join mikä toinen taulukkon nimi, sitten yhdistettään niiden Tilauksien.asiakas_id on yhtä kuin Asiakkaat.id
SELECT Tilaukset.id, Asiakkaat.nimi, Tilaukset.asiakas_id, Tilaukset.toimitus_status
FROM Tilaukset JOIN Asiakkaat ON Tilaukset.asiakas_id = Asiakkaat.id;


/*
id 	nimi 	asiakas_id 	toimitus_status 	
1 	Matti Meikäläinen 	1 	toimitettu
2 	Anna Virtanen 	2 	lähetetty
3 	Jari Korhonen 	3 	käsittelyssä
4 	Paula Laine 	4 	toimitettu
5 	Sami Nieminen 	5 	toimitettu
6 	Laura Hiltunen 	6 	lähetetty
7 	Tomi Salminen 	7 	käsittelyssä
8 	Riikka Mäkelä 	8 	lähetetty
9 	Eero Kallio 	9 	toimitettu
10 	Veera Lehtinen 	10 	käsittelyssä
101 	William Taylor 	11 	Toimitettu
102 	Sophia Garcia 	12 	Kadonnut
103 	Daniel Lee 	15 	Toimitettu
104 	Nathan Reed 	16 	Kadonnut
105 	Ethan Hall 	18 	

*/


-- mitä jos halutaan tarkistaa kaikkien "kadonneet" toimituksen status tilannetta niin lisätään WHERE lausekke, että on "kadonnut"
SELECT Tilaukset.id, Asiakkaat.nimi, Tilaukset.asiakas_id, Tilaukset.toimitus_status
FROM Tilaukset JOIN Asiakkaat ON Tilaukset.asiakas_id = Asiakkaat.id
WHERE Tilaukset.toimitus_status = 'kadonnut';

-- kysellään asiakkaiden nimi ja heidän viimeismmmän tilauksensa päivän määrä
SELECT Asiakkaat.nimi, MAX(Tilaukset.tilaus_pvm) 
FROM Asiakkaat JOIN Tilaukset ON Asiakkaat.id = Tilaukset.asiakas_id 
GROUP BY Asiakkaat.nimi;


--=================================================
-- SQL Aliases
-- alias eli aliasnimi, että tulostuksena mikä ei täsmenny Taulukkon sarakkeen nimeeseen vähä kuin nimettynä erikseen tulostuksena & 



SELECT Asiakkaat.id IDtunnus 
FROM Asiakkaat; 


-- as voidaan käyttää AS-avainsanalla - AS nimellä on vaihtoehtoinen ja sitä voi käyttää
SELECT Asiakkaat.saldo saldoArvot 
FROM Asiakkaat; 


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
