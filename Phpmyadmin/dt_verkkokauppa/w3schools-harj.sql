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
