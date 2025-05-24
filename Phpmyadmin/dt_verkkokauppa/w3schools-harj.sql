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


--============================================================

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

--==========================================
-- SQL OR operaattori

-- Where voidaan sisältyä OR operaattoria

-- haettaan Tuotteen kategoriasta id mukaan joko 1 tai 4
SELECT * FROM Tuotteet
WHERE kategoria_id = '1' OR Tuotteet.kategoria_id = '4';








