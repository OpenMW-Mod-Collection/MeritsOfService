# Merits of Service (OpenMW)

Dynamic skill and attribute rewards for completing faction quests.

I like quests that reward you with stats instead of items. Stats always have value, while items tend to get outscaled pretty quickly. I also like having an actual motivation to play the Mages Guild questline for the 10th time.

I could also go on about how, most of the time, faction-favored skills don't correlate with their quests at all, yet still prevent you from advancing... but I'm sure you already know how it feels - finishing something like seven fetch quests for Ajira and Edwina, only to get stuck because YoU dOn'T mEeT rEqUiReMeNtS fOr An AdVaNcEmEnT.

## Features

Every 3 faction quests, the player is granted either **3-5 skill increases** or **2-3 attribute increases**, depending on the faction. And that's it.

Except maybe 10% chance to get bonus Luck each attribute reward.

Every value is configurable.

### Retroactive Rewards

If you install this mod mid-playthrough, you can still receive all the rewards factions owe you. **They are intentionally not granted automatically**, so you need to trigger them manually via the console.

1. Open Morrowind's console by pressing `~`
2. Run the `luap` command
3. Run `I.MeritsOfService.RetroactiveUpdate()`
4. Run `exit()`
5. Done!

## Compatibility

### This Is a Dynamic Lua Mod

There are already countless faction quest improvement, revamp, and overhaul mods out there, but they all share a common flaw - compatibility issues caused by ~~toddscript~~ mwscript. I'm not saying they're bad - they just don't always mix well together. Merits of Service is different.

**_It's dynamic._**  
**_It's 100% Lua._**  
**_It's built different._**

### Compatible With Everything

If a mod adds its own quest and the quest name starts with a faction prefix, it will be treated as a faction quest. For example:

- "Mages Guild: Missing Khajiit" - counts toward Mages Guild quest progress
- "Missing Khajiit" - does not count toward any faction

### Out of the Box Supported Factions

**Vanilla**

- East Empire Company
- Fighters Guild
- House Hlaalu
- House Redoran
- House Telvanni
- Imperial Cult
- Imperial Legion
- Mages Guild
- Morag Tong
- Thieves Guild
- Tribunal Temple

**Not Joinable Vanilla Factions**  
_In case some mod adds a questline for them._

- Census and Excise
- Dark Brotherhood
- Imperial Knights
- Talos Cult
- Camonna Tong
- Twin Lamps

**Project Tamriel Mods**

- Ja-Natta Syndicate
- Narsis Arena
- Orlukh Clan
- Kingdom of Anvil
- Order of Itinerant Priests

**Other Mods**

- Astrologians Guild from [Astrologian's Guild](https://www.nexusmods.com/morrowind/mods/51216) by Billyfighter
- Vvardenfell Brotherhood from [The War for the Vvardenfell Brotherhood](https://www.nexusmods.com/morrowind/mods/47314) (part of the [Morrowind Extended Cut](https://www.nexusmods.com/morrowind/mods/55615)) by Caeris

**Incompatible Mods**  
_Because quest name convention is not followed._

- [Barristers Guild - Old Ebonheart Questline](https://www.nexusmods.com/morrowind/mods/55995) by levanesque
- [Camonna Tong - Puppet Master](https://www.nexusmods.com/morrowind/mods/50740) (part of the [Morrowind Extended Cut](https://www.nexusmods.com/morrowind/mods/55615)) by Caeris

## Making Your Own Patches

Faction patches are stored in the `./MoS_Factions` folder. Folder nesting is ignored and serves only a cosmetic purpose.

Patch structure example:

```yaml
# name must match the beginning of the quest's name
name: mages guild

# check consts.lua for values
attributes:
  - intelligence
  - willpower

# check consts.lua for values
skills:
  - alchemy
  - alteration
  - destruction
  - enchant
  - illusion
  - mysticism
```

Requirements for patch validation:

- `name` field is required
- File must contain at least 1 skill or attribute as a reward
- Atributes and skills must match values defined in `scripts/utils/consts.lua` file

## Consider also

- [Morrowind Quests Redux](https://www.nexusmods.com/morrowind/mods/54060) by Killdozery - Improves quest rewards while being a very compatible and lightweight mod.

## Credits

**Sosnoviy Bor** - Author
