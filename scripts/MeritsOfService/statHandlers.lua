local ambient = require("openmw.ambient")
local I = require("openmw.interfaces")
local storage = require("openmw.storage")

require("scripts.MeritsOfService.utils.consts")
require("scripts.MeritsOfService.utils.string")

local sectionRewards = storage.playerSection("SettingsMeritsOfService_rewards")

local function increaseSkillsInterface(player, stats)
    local src = I.SkillProgression.SKILL_INCREASE_SOURCES.Usage
    for skillId, count in pairs(stats) do
        local skill = SkillNameToHandler[skillId](player)
        local skillXp = skill.progress

        -- increase skill
        for _ = 1, count do
            I.SkillProgression.skillLevelUp(skillId, src)
        end

        -- carry xp if needed
        if sectionRewards:get("carrySkillXp") then
            skill.progress = skillXp
        end
    end
end

local function increaseSkillsBrute(player, stats)
    local msg = ""
    for skillId, count in pairs(stats) do
        local skill = SkillNameToHandler[skillId](player)

        -- increase skill
        for _ = 1, count do
            skill.base = skill.base + 1
        end

        -- reset xp if needed
        if not sectionRewards:get("carrySkillXp") then
            skill.progress = 0
        end

        -- update message
        msg = msg .. "Your " .. Capitalize(skillId) .. " increased to " .. tostring(skill.base) .. ".\n"
    end
    msg = msg:sub(1, -2) -- remove last newline
    player:sendEvent("ShowMessage", { message = msg })
    ambient.playSound("skillraise")
end

local function increaseAttrs(player, stats)
    local msg = ""
    for attrId, count in pairs(stats) do
        local attr = player.type.stats.attributes[attrId](player)

        -- increase attribute
        for _ = 1, count do
            attr.base = attr.base + 1
        end

        -- update message
        msg = msg .. "Your " .. Capitalize(attrId) .. " increased to " .. tostring(attr.base) .. ".\n"
    end
    msg = msg:sub(1, -2) -- remove last newline
    player:sendEvent("ShowMessage", { message = msg })
    ambient.playSound("skillraise")
end

function IncreaseStat(player, statType, stats)
    if statType == SKILL_REWARD then
        if sectionRewards:get("skillsContributeToLevel") then
            increaseSkillsInterface(stats)
        else
            increaseSkillsBrute(player, stats)
        end
    else
        increaseAttrs(player, stats)
    end
end
