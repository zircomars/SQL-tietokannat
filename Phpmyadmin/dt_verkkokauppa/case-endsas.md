# CASE

SQL:ssä CASE-lauseen täytyy aina päättyä END-avainsanaan. Ja jos haluat antaa sille nimen tuloksissa, käytät AS-sanaa heti sen perään.

CASE on SQL:n ehtolauseke, joka toimii kuin "jos-muutoin"-rakenteet ohjelmoinnissa. Se mahdollistaa arvojen muuttamisen tai luokittelun eri kriteerien perusteella suoraan SQL-kyselyssä.

- **WHEN** määrittää ehdon, ja jos se täyttyy, palautetaan **THEN**-määritelty arvo.

- **ELSE** antaa oletusarvon, jos mikään ehto ei täyty.

- **END** päättää CASE-lausekkeen.

```
CASE
    WHEN ehto1 THEN arvo1
    WHEN ehto2 THEN arvo2
    ELSE arvo3
END AS sarakkeen_nimi
```

**ESIM:**
```
SELECT OrderID, Quantity,
CASE
    WHEN Quantity > 30 THEN 'The quantity is greater than 30'
    WHEN Quantity = 30 THEN 'The quantity is 30'
    ELSE 'The quantity is under 30'
END AS QuantityText
FROM OrderDetails;
```


## Ilman ELSE

CASE-lausekkeessa voi olla vain WHEN-ehtoja ilman ELSE-osiota, ja se toimii oikein! Jos mikään WHEN-ehto ei täyty, silloin CASE palauttaa NULL-arvon.

```
CASE 
    WHEN status = 'A' THEN 'Vaihtoehto A'
    WHEN status = 'B' THEN 'Vaihtoehto B'
END -- Jos status ei ole A tai B → palauttaa NULL
```

**ELSE:n** kanssa
```
CASE 
    WHEN status = 'A' THEN 'Vaihtoehto A'
    WHEN status = 'B' THEN 'Vaihtoehto B'
    ELSE 'Muu vaihtoehto'
END -- Jos status ei ole A tai B → palauttaa 'Muu vaihtoehto'
```
Milloin ELSE kannattaa käyttää? <br>
Jos haluat varmistaa, että CASE palauttaa aina jonkin arvon, käytä ELSE. <br>
Jos tyhjät arvot (NULL) ovat hyväksyttäviä, ELSE ei ole pakollinen. <br>


Voidaa myös käyttää CASE suoraan SELECT-, WHERE-, ORDER BY- ja GROUP BY-osioissa — kunhan muistat END ja AS, jos haluat nimeämistä.
