# Merits of Service (OpenMW)

Dynamic skill and attribute rewards for completing faction quests.

I like quests that reward you with stats instead of items. Stats always have value, while items tend to get outscaled pretty quickly. What I also like is having an actual motivation to play Mages Guild questline for the 10th time.

I could also go on about how most of the time faction favored skills don't correlate with treir quests at all, yet prevent you from advancements... But I'm sure you know how it feels already - finishing like 7 fetch quests in Mages Guild for Ajira and Edwina and getting stuck because YoU dOn'T mEeT rEqUiReMeNtS fOr An AdVaNcEmEnT.

## Features

Each 3 faction quests the player will be granted 3-5 skills or 2-3 attributes depending on faction. And that's it.

Each value is configurable.

### Retroactive Rewards

If you install this mod mid-playthrough, you still can get all the rewards factions owe you. **They are intentionally not granted by default**, so you'd need to manually execute the script for it in the console.

1. Open Morrowind's console by pressing `~`
2. Run `luap` command
3. Run `I.MeritsOfService.RetroactiveUpdate()`
4. Run `exit()`
5. And you're done!

## Compatibility

### This is a Dynamic Lua Mod

There are already countless faction quests improvement, revamp, overhaul, etc. mods, but they all share a common flaw - compatibility issues thanks to ~~toddscript~~ mwscript. I'm not saying that they're bad - they just can be mixed together. But Merits of Service is not like them.

**_It's dynamic._**  
**_It's 100% lua._**  
**_It's built different._**

### Compatible With Everything

If a mod adds it's own quest and it's name starts with a prefix for faction, it will be considered a faction quest. For example:

- "Mages Guild: Missing Khajiit" - would count towards MG quest count
- "Missing Khajiit" - won't count towards anything

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
- Camonna Tong *(in case some mod adds a questline for them, otherwise doesn't do anything on it's own)*
- Dark Brotherhood *(in case some mod adds a questline for them)*

**Project Tamriel Mods**

- Ja-Natta Syndicate
- Narsis Arena
- Orlukh Clan
- Kingdom of Anvil
- Order of Itinerant Priests

**Other Mods**

- Astrologians Guild from [Astrologian's Guild](https://www.nexusmods.com/morrowind/mods/51216) by Billyfighter
- Vvardenfell Brotherhood from [The War for the Vvardenfell Brotherhood](https://www.nexusmods.com/morrowind/mods/47314) / [Morrowind Extended Cut](https://www.nexusmods.com/morrowind/mods/55615) by Caeris

## Making Your Own Patches

[TODO]

## Consider also

- [Morrowind Quests Redux](https://www.nexusmods.com/morrowind/mods/54060) by Killdozery - Improves quest rewards while being a very compatible and lightweight mod.

## Credits

**Sosnoviy Bor** - Author
