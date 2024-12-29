# SKY_DAILYREWARDS

Danke für das erwerben des Dailyreward Skripts

---

## Installation

1. Packe den *sky_dailyrewards* Ordner in deinen *resources* Ordner.
2. Importiere die *sky.sql* in deine Datenbank.
3. Schreib `start sky_dailyrewards` in deine *server.cfg*.

### QBCore

4. Ändere in der *config.json* "qbCore" zu "true" 

### Achtung

Das umbennen des Skripts wird es kaputtmachen.

---
 
## Übersetzungen

Kopiere die Config aus der langde.txt in deine lang.json für eine deutsche Übersetzung.

Du kannst alle Strings beliebig umschreiben in *config/lang.json*.

Bei einigen wird eine variable genutzt welche mit einem % am Anfang und Ende gekennzeichnet ist, diese darfst du verschieben aber nicht verändern.

## Konfiguration

Du kannst das Skript in der *config.json* anpassen.

`"devMode"`

Ermöglicht es dir jede Belohnung einzusammeln für Testzwecke.

`"discordLogs" > "skipped"`

Discord-Webhook wenn ein Spieler einen Tag geskippt hat.

`"discordLogs" > "rewardClaimed"`

Discord-Webhook wenn eine Belohnung geclaimed wird. 

`"discordLogs" > "abuse"`

Discord-Webhook wenn Modder versuchen das Skript auszunutzen. 

`"keyMapping"`

Hier kannst die Taste festlegen mit der das Menü geöffnet werden soll.

`"skipWithCoins"`

Ob man den letzten Tag mit coins skippen kann wenn man vergessen hat diesen zu claimen, benötigt sky_coinsystem.

`"vehiclePlate"`

Wie die Nummernschilder der Autos generiert werden sollen

## Rewards

In der *rewards.json* kannst du die Belohnungen einstellen.

Die Anzahl der Tage kann nicht verändert werden und muss somit gleich bleiben.
Die Belohnungen (`"reward": {}`) kannst du beliebig umtauschen und umschreiben.

Diese Belohnungen kannst du verwenden als `"reward"`:

Fahrzeuge:

```json
{
  "type": "vehicle", // Der Typ, in dem Fall "vehicle" 
  "garage": "car", // Garagentyp in den das Fahrzeug soll, diesen kannst du dann in der garage.lua nutzen
  "model": "t20" // Spawnname des Fahrzeugs
}
```

Waffen:

```json
{
  "type": "weapon", // Der Typ, in dem Fall "weapon"
  "model": "WEAPON_SPECIALCARBINE", // Spawnname der Waffe
  "ammoType": "rifle_ammo", // Munitionstyp (Nur QBCore)
  "ammo": 200, // Munition die mit der Waffe gegeben werden soll
  "tint": 14, // Funktioniert nicht bei ESX1.1 und QBCore
  "components": [ // Komponenten die, die Waffe hat
    "flashlight"
  ]
}
```

Items:

```json
{
  "type": "item", // Der Typ, in dem Fall "item"
  "name": "bulletproof", // Name des Items wie er in der Datenbank steht
  "amount": 1, // Anzahl die gegeben werden soll
  "description": "A vest" // Eine Beschreibung
}
```

Geld:

```json
{
  "type": "money", // Der Typ, in dem Fall "money"
  "amount": "100000" // Anzahl die gegeben werden soll
}
```

Coins (Benötigt sky_coinsystem):

```json
{
  "type": "coins", // Der Typ, in dem Fall "coins"
  "amount": "5" // Anzahl die gegeben werden soll
}
```

Custom:

Du kannst deine eigenen custom Items in *config/custom* coden und mit folgendem Aufbau in die configs einfügen.

```json
{
  "type": "custom", // Der Typ, in dem Fall "custom"
  // Nach dem Typen kannst du deinen komplett eigenen Aufbau erstellen den du dann im code nutzen kannst
  "description": "A description" // Eine Beschreibung
}
```

## Exports

```lua
exports["sky_dailyrewards"]:open() -- client side
-- Dailyrewards öffnen
```

## garage.lua

In dieser Datei kannst du den Code an euer Garagensystem anpassen wenn nötig.
Der Parameter "garage" kann genutzt werden falls es mehrere Garagentypen gibt, z.B. für Boote und Flugzeuge.

---

Wenn du Hilfe brauchst besuche gerne unseren Discord
https://discord.gg/PPAjVs8npG
