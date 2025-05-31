# SQL AUTO_INCREMENT ja ID-arvojen hallinta

## Taulukon ID-arvojen käyttäytyminen

Taulukon arvoa koskien **ID-arvot eivät välttämättä automaattisesti mene peräkkäin**, jos niitä syötetään manuaalisesti. Tässä muutama syy, miksi **Emilia Ranta** sai ID:n 200, vaikka viimeisin ID oli 128:

- **Manuaalinen lisäys** – Jos ID-arvo annetaan käsin, se voi hypätä mihin tahansa numeroon eikä noudata automaattista järjestystä.
- **AUTO_INCREMENT ei käytössä** – Jos taulun `id`-sarake EI ole määritelty `AUTO_INCREMENT`, niin silloin SQL ei automaattisesti luo seuraavaa vapaa ID-numeroa.
- **Poistetut rivit** – Jos taulusta on aiemmin poistettu rivejä (esim. `DELETE FROM Asiakkaat WHERE id = 129;`), niin `AUTO_INCREMENT` ei täytä tyhjää väliä, vaan jatkaa suuremmasta numerosta.
- **Tietokannan asetukset** – Jos ID on joskus määritelty manuaalisesti korkeammalle tasolle, SQL voi käyttää seuraavaa vapaata isoa numeroa.

---

## Taulukon tarkistaminen

Taulukon rakenteen voi tarkistaa seuraavalla komennolla:

```
SHOW CREATE TABLE Asiakkaat;
```


Jos id-sarake ei sisällä AUTO_INCREMENT, voit muuttaa sen lisäämällä tämän ja tämän komennon jälkeen voit lisätä uusia asiakkaita ilman ID-arvon antamista käsin, ja tietokanta antaa niille automaattisesti seuraavan vapaan numeron.

```
ALTER TABLE Asiakkaat MODIFY COLUMN id INT AUTO_INCREMENT PRIMARY KEY;
```

---

# AUTO_INCREMENT ja tietokannan suunnittelu

AUTO_INCREMENT on tärkeä osa tietokannan suunnittelua, erityisesti **primääriavainten hallinnassa**.

- **Primääriavain ja yksilöllisyys** – Jokaisella rivillä tulee olla ainutlaatuinen tunniste (ID), jotta tiedot voidaan yksilöidä.
- **Jatkuvuuden varmistaminen** – AUTO_INCREMENT kasvattaa ID-arvoa automaattisesti peräkkäin *(1, 2, 3...)*, eikä manuaalista syöttöä tarvita.
- **Poistetut rivit eivät täytä tyhjää väliä** – Jos rivejä poistetaan, AUTO_INCREMENT ei täytä tyhjää kohtaa, vaan jatkaa suurimmasta ID:stä eteenpäin.
- **Tietokantasuunnittelun standardi** – Melkein kaikissa relaatiotietokannoissa, kuten **MySQL, PostgreSQL ja SQL Server**, käytetään AUTO_INCREMENTiä avainkenttien hallintaan.












