# m-MysteryBox script for QB-Core

| If you are intested in recieving updates join the community on **[Discord](https://discord.gg/svmzYehU8R)**! |

# About
- Optimized
- Many Features
- Full and easy customization
- 0.00ms

# Features
- 3 Mystery Box : Small, Medium and Large
- Drops configurable ( Normal Drop / Rare Drops )
- Enable/disable custom sounds.
- You can only block for one gang.
- You can only block for one job.
- Enable chance to burn the player.
- Enable/disable cooldown.


# Required
**qb-core/shared/items.lua**
```
	['smallmysterybox'] 			= {['name'] = 'smallmysterybox', 			['label'] = 'Small mysterybox',            	['weight'] = 250,     ['type'] = 'item',      ['image'] = 'smallmysterybox.png',         	['unique'] = true,     ['useable'] = true,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = ''},
	['mediummysterybox'] 			= {['name'] = 'mediummysterybox', 		['label'] = 'Medium mysterybox',            	['weight'] = 450,     ['type'] = 'item',      ['image'] = 'mediummysterybox.png',         	['unique'] = true,     ['useable'] = true,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = ''},
	['largemysterybox'] 			= {['name'] = 'largemysterybox', 			['label'] = 'Large mysterybox',            	['weight'] = 650,     ['type'] = 'item',      ['image'] = 'largemysterybox.png',         	['unique'] = true,     ['useable'] = true,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = ''},

```
## If you go to using custom sounds:
Go to folder "Sounds" and put the file on:
**interact-sound/client/html/sounds**

## If you are using ESX run the SQL:

```INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `limit`) VALUES
	('smallmysterybox', 'Small Mystery Box', 1, 0, 1, 1),
	('largemysterybox', 'Large Mystery Box', 1, 0, 1, 1),
	('mediummysterybox', 'Medium Mystery Box', 1, 0, 1, 1),
;
```