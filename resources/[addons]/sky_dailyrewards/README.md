# SKY_DAILYREWARDS

Thanks for purchasing the dailyreward script

---

## Installation

### ESX

1. put the *sky_dailyrewards* folder into your *resources* folder.
2. import the *sky.sql* into your database.
3. write `start sky_dailyrewards` into your *server.cfg*.

### QBCore

4. change in the *config.json* "qbCore" to "true".

### Warning

Renaming the script will break it.

---
 
## Translations

Copy the config from langde.txt into your lang.json for a german translation.

You can rewrite all strings as you like in *config/lang.json*.

Some of them use a variable which is marked with a % at the beginning and at the end, you are allowed to move it but not to change it.

## Configuration

You can customize the script in *config.json*.

`"devMode"`

Allows you to claim any reward for testing purposes.

`"discordLogs" > "skipped"`

Discord webhook when a player has skipped a day.

`"discordLogs" > "rewardClaimed"`

Discord webhook when a reward is claimed.

`"discordLogs" > "abuse"`

Discord webhook when modders try to exploit the script.  

`"keyMapping"`

Here you can specify the key with which the menu should be opened.

`"skipWithCoins"`

Whether you can skip the last day with coins if you forgot to claim it, requires sky_coinsystem.

`"vehiclePlate"`

How the license plates of the cars should be generated.

## Rewards

In the *rewards.json* you can set the rewards.

The number of days cannot be changed and must therefore remain the same.
You can exchange and rewrite the rewards (`"reward": {}`) as you wish.

You can use these rewards as `"reward"`:

Vehicles:

```json
{
  "type": "vehicle", // the type, in this case "vehicle". 
  "garage": "car", // type of garage the vehicle should be in, you can use it in garage.lua
  "model": "t20" // spawn name of the vehicle
}
```

Weapons:

```json
{
  "type": "weapon", // the type, in this case "weapon".
  "model": "WEAPON_SPECIALCARBINE", // spawn name of the weapon
  "ammoType": "rifle_ammo", // ammo type (qbcore only)
  "ammo": 200, // ammo to be given with the weapon
  "tint": 14, // the color of the weapon (does not work on esx1.1 and qbcore)
  "components": [ // components that the weapon has
    "flashlight"
  ]
}
```

Items:

```json
{
  "type": "item", // the type, in this case "item".
  "name": "bulletproof", // name of the item as it is in the database
  "amount": 1, // amount to be given
  "description": "A vest" // a description
}
```

Money:

```json
{
  "type": "money", // the type, in this case "money".
  "amount": "100000" // amount to be given
}
```


Coins (requires sky_coinsystem):

```json
{
  "type": "coins", // the type, in this case "coins".
  "amount": "5" // amount to be given
}
```

Custom:

You can code your own custom items in *config/custom* and add them to the configs with the following structure.

```json
{
  "type": "custom", // the type, in this case "custom".
  // after the type you can create your own structure which you can use in the code
  "description": "A description" // a description
}
```

## Exports

```lua
exports["sky_dailyrewards"]:open() -- client side
-- open dailyrewards
```

## garage.lua

In this file you can adapt the code to your garage system if necessary.
The parameter "garage" can be used if there are several garage types, e.g. for boats and airplanes.

---

If you need help please visit my Discord
https://discord.gg/PPAjVs8npG
