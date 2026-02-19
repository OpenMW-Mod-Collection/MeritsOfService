# Merits of Service (OpenMW)

Dynamic skill and attribute rewards for completing faction quests.

I like quests that reward you with stats instead of items. Stats always have value, while items tend to get outscaled pretty quickly. I also like having an actual motivation to play the Mages Guild questline for the 10th time.

I could also go on about how, most of the time, faction-favored skills don't correlate with their quests at all, yet still prevent you from advancing... but I'm sure you already know how it feels - finishing something like seven fetch quests for Ajira and Edwina, only to get stuck because YoU dOn'T mEeT rEqUiReMeNtS fOr An AdVaNcEmEnT.

## Features

Every faction quest, the player is granted either a skill increase or an attribute increase, depending on the faction. And that's it.

Except maybe 10% chance to get bonus Luck each attribute reward.

And every value is configurable.

### Retroactive Rewards

If you install this mod mid-playthrough, you can still receive all the rewards factions owe you. **They are intentionally not granted automatically**, so you need to trigger them manually via the console.

1. Open Morrowind's console by pressing `~`
2. Run `lua MeritMyService`
3. Done!

## Compatibility

### This Is a Dynamic Lua Mod

There are already countless faction quest improvement, revamp, and overhaul mods out there, but they all share a common flaw - compatibility issues caused by ~~toddscript~~ mwscript. I'm not saying they're bad - they just don't always mix well together. Merits of Service is different.

**_It's dynamic._**  
**_It's 100% Lua._**  
**_It's built different._**

### Compatible With Everything Out of the Box

If a mod adds its own quest and the quest name starts with a faction prefix, it will be treated as a faction quest. For example:

- "Mages Guild: Missing Khajiit" - counts toward Mages Guild quest progress
- "Missing Khajiit" - does not count toward any faction

**_No patching required._**

## Consider also

- [Morrowind Quests Redux](https://www.nexusmods.com/morrowind/mods/54060) by Killdozery - Improves quest rewards while being a very compatible and lightweight mod.

## Credits

**Sosnoviy Bor** - Author  
**LiNGeN** - Brilliant idea for "Fast and Small" settings preset
