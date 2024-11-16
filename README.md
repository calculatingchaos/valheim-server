# Team Valheim Server

[![🚀 Prod Deploy](https://github.com/calculatingchaos/valheim-server/actions/workflows/prod-deploy.yml/badge.svg)](https://github.com/calculatingchaos/valheim-server/actions/workflows/prod-deploy.yml)

## Introduction

This server is set up for buddies to hang out and have fun.

| Server Name |     Password     |         Server URL          | Join Code |
| :---------: | :--------------: | :-------------------------: | :-------: |
|  `BogBaby`  | `secret4friends` | `calculatingchaos.com:2456` | `196785`  |

## Presets

Each of these are predefined, suggested modes of gameplay:

| Active |     Mode     | [Combat](#combat-settings) | [Death Penalty](#death-penalty) | [Resource Rate](#resource-rate-modifier) | [Raid Rate](#raid-settings) | [Portals](#portal-settings) | [Player-Based Raids](#global-keys) | [Passive Enemies](#global-keys) | [No Map](#global-keys) | [Fire Hazards](#global-keys) | [No Build Cost](#global-keys) |
| :----: | :----------: | :------------------------: | :-----------------------------: | :--------------------------------------: | :-------------------------: | :-------------------------: | :--------------------------------: | :-----------------------------: | :--------------------: | :--------------------------: | :---------------------------: |
|        |    casual    |          veryeasy          |             casual              |                   1.5                    |            none             |           casual            |         :white_check_mark:         |       :white_check_mark:        |                        |                              |                               |
|        |     easy     |            easy            |          [**normal**]           |                [**1.0x**]                |            less             |        [**normal**]         |                                    |                                 |                        |                              |                               |
| :star: | [**normal**] |        [**normal**]        |          [**normal**]           |                [**1.0x**]                |        [**normal**]         |        [**normal**]         |                                    |                                 |                        |                              |                               |
|        |     hard     |            hard            |          [**normal**]           |                [**1.0x**]                |            more             |        [**normal**]         |                                    |                                 |                        |                              |                               |
|        |   hardcore   |          veryhard          |            hardcore             |                [**1.0x**]                |            more             |            hard             |                                    |                                 |   :white_check_mark:   |                              |                               |
|        |  immersive   |        [**normal**]        |          [**normal**]           |                [**1.0x**]                |        [**normal**]         |          veryhard           |                                    |                                 |   :white_check_mark:   |      :white_check_mark:      |                               |
|        |    hammer    |        [**normal**]        |          [**normal**]           |                [**1.0x**]                |            none             |        [**normal**]         |                                    |       :white_check_mark:        |                        |                              |      :white_check_mark:       |

You an start with a preset, then modify individual parts of that preset until you get the configuration you prefer.

If configured with a preset, modifiers should be listed afterwards:
> Example: `-preset normal -modifier portals casual`

## Combat Settings

In concrete terms, the following are the effects of each difficulty setting:

| Active |     Mode     | Player Damage | Enemy Damage | Enemy Speed & Size | Enemy Level Up Rate |
| :----: | :----------: | :-----------: | :----------: | :----------------: | :-----------------: |
|        |   veryeasy   |     125%      |     50%      |        90%         |        100%         |
|        |     easy     |     110%      |     75%      |        90%         |        100%         |
| :star: | [**normal**] |     100%      |     100%     |        100%        |        100%         |
|        |     hard     |      85%      |     150%     |        110%        |        120%         |
|        |   veryhard   |      70%      |     200%     |        120%        |        140%         |

> Example: `-modifier combat veryeasy`

In `Hard` and `Very Hard` settings, there is a higher probability of spawning high-level enemies.

Player Damage (%) modifications are not reflected in the values shown on the screen, either in weapon damage ranges in the inventory or upon successful hits to a creature.

## Death Penalty

The **death penalty** slider affects several aspects of what happens to a player character upon [Death](https://valheim.fandom.com/wiki/Death). Independent factors include:

- `Equipment`, the inventory items that are worn or in use at the moment the player dies
- `Inventory`, all other items that weren't worn or in use
- `Skill loss`, a reduction to all [Skill](https://valheim.fandom.com/wiki/Skills) levels for the player
  - The listed percentage is the portion of total skill level value lost
  - The loss is not rounded, and new, otherwise unattainable decimal levels will be set, even though the decimals are truncated
  - Every skill's next level requirement is recalculated for the new, reduced level and progress is set to zero -- this progress loss is not impacted by the death penalty settings
  - **Example**: A player's [Run](https://valheim.fandom.com/wiki/Run) skill is 70, halfway to 71, and they die on the "easy" death penalty setting. 2.5% of the level value of 70 is lost and the new, effective level for the [Run](https://valheim.fandom.com/wiki/Run) skill is set to 68.25, visualized in the UI as 68. The required experience to the next level, 69.25, is calculated and progress towards it is set to 0.

| Active |     Mode     | Equipment | Inventory | Skill Loss | Description                                                                                                |
| :----: | :----------: | :-------: | :-------: | :--------: | ---------------------------------------------------------------------------------------------------------- |
|        |    casual    |   Kept    |  Dropped  |     1%     | You do not drop equipped gear, and skills are reduced a lot less than on normal mode.                      |
|        |   veryeasy   |  Dropped  |  Dropped  |     1%     | You drop all items, and skills are reduced a lot less than on normal mode.                                 |
|        |     easy     |  Dropped  |  Dropped  |    2.5%    | You drop all items, and skills are reduced less than on normal mode.                                       |
| :star: | [**normal**] |  Dropped  |  Dropped  |     5%     | You drop all items, and skills are reduced normally.                                                       |
|        |     hard     |  Dropped  | Destroyed |    7.5%    | Equipped items are dropped, the rest of your inventory is lost permanently, and skills are reduced faster. |
|        |   hardcore   | Destroyed | Destroyed |    100%    | You lose all carried items and skills permanently.                                                         |

> Example: `-modifier deathPenalty hardcore`

## Resource Rate Modifier

Ranges from `0.5x` to `3x` normal drop rate from mobs and lootable objects in the world. There are a few exceptions (not sure if intentional) like fish.

| Active |     Mode     |   Value    |
| :----: | :----------: | :--------: |
|        |   muchless   |    0.5x    |
|        |     less     |   0.75x    |
| :star: | [**normal**] | [**1.0x**] |
|        |     more     |    1.5x    |
|        |   muchmore   |     2x     |
|        |     most     |     3x     |

> Example: `-modifier resources more`

## Raid Settings

Governs how often enemies may raid your base.

| Active |     Mode     | EventRate (%) | Raid Interval (min) | Raid Chance (%) |
| :----: | :----------: | :-----------: | :-----------------: | :-------------: |
|        |     none     |       0       |          -          |        -        |
|        |   muchless   |      200      |         92          |       10        |
|        |     less     |      150      |         69          |      13.33      |
| :star: | [**normal**] |      100      |         46          |       20        |
|        |     more     |      60       |        27.6         |      33.33      |
|        |   muchmore   |      30       |        13.8         |      66.67      |

> Example: `-modifier raids less`

## Portal Settings

| Active |     Mode     | Description                                                                   |
| :----: | :----------: | ----------------------------------------------------------------------------- |
| :star: |    casual    | Allows everything to be portalled at all time, does not include tamed animals |
|        | [**normal**] | Non-portalable items apply as standard                                        |
|        |     hard     | Portals aren't available when a boss is active                                |
|        |   veryhard   | No portals are allowed at all in the world                                    |

> Example: `-modifier portals casual`

## Global Keys

World modifiers are stored in [Global Keys](https://valheim.fandom.com/wiki/Global_Keys). Console commands can be used to set or remove keys which provides another way to set world modifiers.

When added to a configuration which also includes presets and modifiers, `-setkey` entries would go at the end.
> Example: `-preset normal -modifier deathPenalty hardcore -modifier resources more -setkey nomap -setkey playerevents -setkey skillgainrate 200`

### The following keys can be set to modify game behavior

| Activate | Key                   | Description                                                                                                                                                                                                                                                            |
| :------: | --------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|          | AllPiecesUnlocked     | all pieces become unlocked.                                                                                                                                                                                                                                            |
|          | AllRecipesUnlocked    | all recipes become unlocked.                                                                                                                                                                                                                                           |
|          | DeathDeleteItems      | all items will be deleted on death (unless DeathDeleteUnequipped or DeathKeepEquip is set).                                                                                                                                                                            |
|          | DeathDeleteUnequipped | unequipped items will be deleted on death.                                                                                                                                                                                                                             |
|          | DeathKeepEquip        | equipped items will be kept on death.                                                                                                                                                                                                                                  |
|          | DeathSkillsReset      | all skills will be lost on death.                                                                                                                                                                                                                                      |
|          | DungeonBuild          | can build in dungeons.                                                                                                                                                                                                                                                 |
|  :star:  | Fire                  | wood can catch fire and spread throughout the whole world, not just in the Ashlands.                                                                                                                                                                                   |
|          | NoBossPortals         | portals can't be used near bosses.                                                                                                                                                                                                                                     |
|          | NoBuildCost           | building is free; build pieces require no materials to build. You still need to discover recipes as per usual.                                                                                                                                                         |
|          | NoCraftCost           | crafting is free.                                                                                                                                                                                                                                                      |
|          | NoMap                 | map can't be used; you will not have access to the map or the minimap. This makes the game harder than intended.                                                                                                                                                       |
|          | NoPortals             | portals can't be used.                                                                                                                                                                                                                                                 |
|          | NoWorkbench           | can build without workbench.                                                                                                                                                                                                                                           |
|          | PassiveMobs           | enemies are passive; they won't attack unless you provoke them.                                                                                                                                                                                                        |
|  :star:  | PlayerEvents          | events use player specific keys; raids are based on the progress of each individual player, rather than on which bosses have been killed on the server. This setting is recommended if you want the game to be slightly friendlier to players with different progress. |
|          | TeleportAll           | all items can be teleported.                                                                                                                                                                                                                                           |

> Example: `-setkey NoMap -setkey Fire` to enable NoMap and Fire features                                                                                                                                                                                                                                 |

### Following keys can be used to multiply a game setting

|        Key         | Default | Modified |
| :----------------: | :-----: | :------: |
|    DamageTaken     |  100%   |          |
|    EnemyDamage     |  100%   |          |
|  EnemyLevelUpRate  |  100%   |          |
|   EnemySpeedSize   |  100%   |          |
|     EventRate      |  100%   |          |
|  MoveStaminaRate   |  100%   |          |
|    PlayerDamage    |  100%   |          |
|    ResourceRate    |  100%   |          |
|   SkillGainRate    |  100%   |          |
| SkillReductionRate |  100%   |          |
|    StaminaRate     |  100%   |          |
|  StaminaRegenRate  |  100%   |          |

> Example: `-setkey PlayerDamage 150` to increase player damage by 50%.

### World Level

| Value |          Key          | Description                                          |
| :---: | :-------------------: | ---------------------------------------------------- |
|       |      WorldLevel       | Progress within the world; useful for NewGame+       |
|       | WorldLevelLockedTools | If set, tool tier check also checks the world level. |

> Example: hmm... untested, but maybe `-setkey WorldLevel 100` and `setkey WorldLevelLockedTools` ?

## Reference Material

- [A GUIDE TO DEDICATED SERVERS](https://valheim.com/support/a-guide-to-dedicated-servers/) (official)
- [World Modifiers](https://valheim.fandom.com/wiki/World_Modifiers)
