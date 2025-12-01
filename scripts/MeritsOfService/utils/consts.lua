local types = require("openmw.types")

Factions = require("scripts.MeritsOfService.factionParser")

SKILL_REWARD = "skills"
ATTRIBUTE_REWARD = "attributes"

CompletedQuests = {
    -- factionName = {
    --     count = 0,
    --     quests = {
    --         questId_1 = true,
    --         questId_2 = true,
    --     }
    -- }
}

local skills = types.NPC.stats.skills
-- use it as a skill names reference for guild yamls
SkillNameToHandler = {
    acrobatics  = skills.acrobatics,
    alchemy     = skills.alchemy,
    alteration  = skills.alteration,
    armorer     = skills.armorer,
    athletics   = skills.athletics,
    axe         = skills.axe,
    block       = skills.block,
    blunt       = skills.bluntweapon,
    conjuration = skills.conjuration,
    destruction = skills.destruction,
    enchant     = skills.enchant,
    handtohand  = skills.handtohand,
    heavyarmor  = skills.heavyarmor,
    illusion    = skills.illusion,
    lightarmor  = skills.lightarmor,
    longblade   = skills.longblade,
    marksman    = skills.marksman,
    mediumarmor = skills.mediumarmor,
    mercantile  = skills.mercantile,
    mysticism   = skills.mysticism,
    restoration = skills.restoration,
    security    = skills.security,
    shortblade  = skills.shortblade,
    sneak       = skills.sneak,
    spear       = skills.spear,
    speechcraft = skills.speechcraft,
    unarmored   = skills.unarmored,
}
