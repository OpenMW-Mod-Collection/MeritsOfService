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
- Vvardenfell Brotherhood from [The War for the Vvardenfell Brotherhood](https://www.nexusmods.com/morrowind/mods/47314) / [Morrowind Extended Cut](https://www.nexusmods.com/morrowind/mods/55615) by Caeris

**Incompatible Mods**  
_Because quest name convention is not followed._

- [Barristers Guild - Old Ebonheart Questline](https://www.nexusmods.com/morrowind/mods/55995) by levanesque

**TODO tests**

- [Camonna Tong - Puppet Master](https://www.nexusmods.com/morrowind/mods/50740)
- [Guild of Vampire Hunters](https://www.nexusmods.com/morrowind/mods/45832)
- [Imperial Knights Faction](https://www.nexusmods.com/morrowind/mods/50643)
- [Join the Royal Guards](https://www.nexusmods.com/morrowind/mods/50676)
- [Census and Excise Office Faction](https://www.nexusmods.com/morrowind/mods/46798)
- [Imperial Employment Office (MD Edit)](https://www.nexusmods.com/morrowind/mods/53845)
- [Imperial Bank (Faction - Quests - Banking - Share Trading)](https://web.archive.org/web/20250401062632/https://www.nexusmods.com/morrowind/mods/54889)
- [The Guiding Guild - Dune Inspired Guild Guides](https://www.nexusmods.com/morrowind/mods/54750)
- [The Imperial Dwemer Society](https://www.nexusmods.com/morrowind/mods/45225)
- [Illuminated Order Improved](https://www.nexusmods.com/morrowind/mods/47414)
- [Welcome to the Arena](https://www.nexusmods.com/morrowind/mods/22002)
- [Suran Underworld 3](https://www.nexusmods.com/morrowind/mods/40299)
- [Dura gra-Bol's House Reclaimed - And the Grab-All Gang](https://www.nexusmods.com/morrowind/mods/46772)
- [Great House Dagoth](https://www.nexusmods.com/morrowind/mods/48200)
- [The Arcane Watch -- FULL](https://www.nexusmods.com/morrowind/mods/54522)
- [The Arcane Academy of Venarius](https://www.nexusmods.com/morrowind/mods/53675)

## Making Your Own Patches

[TODO]

## Consider also

- [Morrowind Quests Redux](https://www.nexusmods.com/morrowind/mods/54060) by Killdozery - Improves quest rewards while being a very compatible and lightweight mod.

## Credits

**Sosnoviy Bor** - Author
